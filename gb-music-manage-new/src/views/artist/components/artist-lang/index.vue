<template>
  <div class="table-box">
    <ProTable :columns="columns" :data="tableData" ref="tableRef">
      <template #toolButton>
        <el-button type="primary" @click="handleCreate">新增</el-button>
      </template>
    </ProTable>
    <ProDrawer v-model="isShow" title="新增语种" @confirm="handleConfirm">
      <el-form :model="formData" label-position="top" ref="formRef" :rules="rules">
        <el-form-item prop="name" label="名称">
          <el-input v-model="formData.name" placeholder="请输入名称" clearable :maxlength="200" />
        </el-form-item>
      </el-form>
    </ProDrawer>
  </div>
</template>
<script setup lang="jsx">
import { ref, reactive } from "vue";
import { ElMessage, ElMessageBox } from "element-plus";

import ProTable from "@/components/ProTable/index.vue";
import ProDrawer from "@/components/ProDrawer/index.vue";
import { getArtistLangApi, addArtistLangApi, deleteArtistLangApi } from "@/api/modules/artist.js";
const columns = reactive([
  {
    label: "名称",
    prop: "name",
    isShow: true
  },
  {
    label: "操作",
    prop: "action",
    isShow: true,
    render: scope => {
      return (
        <el-link type="danger" onClick={() => handleDelete(scope.row)}>
          删除
        </el-link>
      );
    }
  }
]);
const tableData = ref([]);

const search = () => {
  getArtistLangApi().then(res => {
    tableData.value = res;
  });
};
search();

const isShow = ref(false);
const handleCreate = () => {
  formData.name = "";
  isShow.value = true;
  formRef.value && formRef.value.clearValidate();
};
const handleDelete = item => {
  ElMessageBox.confirm("确认删除么", "提示", {
    type: "warning"
  }).then(async res => {
    await deleteArtistLangApi({ cateId: item.id });
    search();
    ElMessage.success("删除成功");
  });
};
const rules = reactive({
  name: [{ required: true, message: "名称不能为空", trigger: ["change", "blur"] }]
});
const formData = reactive({
  name: ""
});
const formRef = ref();
const tableRef = ref();
const handleConfirm = () => {
  formRef.value &&
    formRef.value.validate(async e => {
      if (e) {
        const res = await addArtistLangApi(formData);
        ElMessage.success("添加成功");
        isShow.value = false;
        search();
      }
    });
};
</script>
