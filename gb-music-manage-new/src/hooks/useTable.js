import { reactive, computed, toRefs } from "vue";
export const useTable = (api, initParam, isPageable, dataCallback, requestError) => {
  const state = reactive({
    tableData: [],
    pageable: {
      pageNum: 1,
      pageSize: 10,
      total: 0
    },
    searchParam: {},
    searchInitParam: {},
    totalParam: {}
  });
  const pageParam = computed({
    get: () => {
      return {
        pageNum: state.pageable.pageNum,
        pageSize: state.pageable.pageSize
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
      let data = res.data;
      dataCallback && (data = dataCallback(res));
      state.tableData = isPageable ? res.rows : res.data;
      if (isPageable) {
        state.pageable.total = res.total;
      }
    } catch (e) {
      requestError && requestError(e);
    }
  };

  const updateTotalParam = () => {};

  const search = async () => {
    state.pageable.pageNum = 1;
    await getTableList();
  };

  const handleSizeChange = value => {
    state.pageable.pageSize = value;
    state.pageable.pageNum = 1;
    getTableList();
  };
  const handleCurrentChange = val => {
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
