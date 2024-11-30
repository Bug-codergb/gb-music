  <template>
  <div class="table-box">
    <ProTable
      :columns="columns"
      :requestApi="getVideoListApi"
      :requestAuto="false"
      ref="tableRef"
      :initParam="searchParams"
      dataAlias="videos"
      :pagination="true"
    >
      <template #tableHeader>
        <el-form inline>
          <el-form-item>
            <el-input
              v-model="searchParams.keyword"
              @input="handleSearch"
              placeholder="请输入视频名称"
              clearable
            />
          </el-form-item>
          <el-form-item>
            <el-select
              v-model="searchParams.cateId"
              style="width: 200px"
              @change="search"
            >
              <el-option
                v-for="item in cateList"
                :key="item.id"
                :label="item.label"
                :value="item.value"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </template>
      <template #toolButton>
        <el-button type="primary" @click="handleCreate"
          >新增视频</el-button
        >
      </template>
    </ProTable>
    <CreateVideo ref="createVideoRef" @success="search"/>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { useRouter } from "vue-router";
import { formatTime } from "@/utils/time.js";
import moment from "moment";
import debounce from "lodash/debounce";
import ProTable from "@/components/ProTable/index";
import CreateVideo from "../createVideo/index.vue"
import {
  getVideoListApi,
  getVideoCateApi, deleteVideoApi
} from "@/api/modules/video.js";
import {ElMessageBox,ElMessage} from "element-plus";

const router = useRouter();
const columns = reactive([
  {
    label:"视频ID",
    prop:"id",
    isShow: true,
    width:130
  },
  {
    label: "封面",
    prop: "cover",
    isShow: true,
    render: scope => {
      return (
        <el-image
          src={scope.row.coverUrl}
          preview-src-list={[scope.row.coverUrl]} preview-teleported={true}
          style={{ width: "150px" }}
        />
      );
    }
  },
  {
    label: "名称",
    prop: "name",
    isShow: true,
    'min-width':100,
    render:(scope)=>{
      return <el-tooltip content={scope.row.name} show-after={500} placement="top">
        <el-link type="primary" onClick={()=>handleVideo(scope.row)}>
          <span class="mle">
            {scope.row.name}
          </span>
        </el-link>
      </el-tooltip>
    }
  },
  {
    label: "时长",
    prop: "dt",
    isShow: true,
    render: scope => {
      return formatTime(scope.row.dt, "mm:ss");
    }
  },
  {
    label: "创建时间",
    prop: "createTime",
    isShow: true,
    render: scope => {
      return moment(scope.row.createTime).format("yyyy-MM-DD HH:mm");
    }
  },
  {
    label: "创建者",
    prop: "user.userName",
    isShow: true
  },
  {
    label: "操作",
    prop: "cover",
    isShow: true,
    render: scope => {
      return (
        <el-space size="large">
          <el-link type="primary" onClick={()=>handleVideo(scope.row)}>查看</el-link>
          <el-link type="primary" onClick={()=>handleEdit(scope.row)}>编辑</el-link>
          <el-link type="danger" onClick={()=>handleDelete(scope.row)}>删除</el-link>
        </el-space>
      );
    }
  }
]);
const tableRef = ref();
const cateList = ref([]);
getVideoCateApi({ type: 0 }).then(res => {
  cateList.value = res.map(item => {
    return {
      label: item.name,
      value: item.id
    };
  });
  searchParams.cateId = res[0].id;
  tableRef.value && tableRef.value.search();
});
const searchParams = reactive({
  keyword: "",
  cateId: "",
  type: 0
});
const search = () => {
  tableRef.value && tableRef.value.search();
};
const handleSearch = debounce(() => {
  search();
}, 500);
const createVideoRef = ref()
const handleCreate = () => {
  createVideoRef.value && createVideoRef.value.showDrawer()
};
const handleEdit=(item)=>{
  createVideoRef.value && createVideoRef.value.showDrawer(item)
}
const handleVideo=(item)=>{
  router.push(`/video/${item.id}`);
}
const handleDelete=async (item)=>{
  ElMessageBox.confirm("确认删除吗?","提示",{
    type:"warning"
  }).then(async ()=>{
    const res = await deleteVideoApi({id:item.id});
    ElMessage.success("删除成功");
    search();
  }).catch(()=>{})
}
</script>
