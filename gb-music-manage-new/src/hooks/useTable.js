import { reactive, computed, toRefs } from "vue";
export const useTable = (api, initParam, isPageable, dataCallback, requestError,dataAlias) => {
  console.log('useTable exec...')
  const state = reactive({
    tableData: [],
    pageable: {
      limit: 10,
      offset: 0,
      total: 0,
      pageNum:1,
    },
    searchParam: {},
    searchInitParam: {},
    totalParam: {}
  });
  const pageParam = computed({
    get: () => {
      return {
        limit: state.pageable.limit,
        offset: state.pageable.offset
      };
    },
    set: newVal => {
      console.log("我是分页更新之后的值", newVal);
    }
  });
  const getTableList = async () => {
    if (!api) return;
    try {
      Object.assign(state.totalParam, initParam, isPageable ? pageParam.value : {});

      let res = await api({ ...state.searchInitParam, ...state.totalParam });
      dataCallback && (res = dataCallback(res));
      state.tableData = isPageable ? (dataAlias ? res[dataAlias] : res) : (dataAlias ? res[dataAlias]:res);
      if (isPageable) {
        state.pageable.total = res.count;
      }
    } catch (e) {
      requestError && requestError(e);
    }
  };

  const updateTotalParam = () => {};

  const search = async () => {
    state.pageable.offset = 0;
    state.pageable.pageNum = 1;
    await getTableList();
  };

  const handleSizeChange = value => {
    state.pageable.offset = 0;
    state.pageable.pageNum = 1;
    state.pageable.limit = value;
    getTableList();
  };
  const handleCurrentChange = val => {
    state.pageable.offset = (val-1)*state.pageable.limit;
    state.pageable.pageNum = val;
    getTableList();
  };

  return {
    ...toRefs(state),
    getTableList,
    search,
    handleSizeChange,
    handleCurrentChange
  };
};
