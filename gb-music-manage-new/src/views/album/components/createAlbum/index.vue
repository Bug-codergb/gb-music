<template>
  <ProDrawer
    v-model="isShow"
    @confirm="handleConfirm"
    :title="title"
  >
    <ProForm
      :config="config"
      ref="formRef"
      v-model="formData"
      :aspectRatio="1"
    >
      <template #arId>
        <el-form inline>
          <el-form-item v-if="artist">
            {{ artist?.name }}
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="handleSelectArtist"
              >选择歌手</el-button
            >
          </el-form-item>
        </el-form>
      </template>
    </ProForm>
    <ArtistList ref="artistListRef" @confirm="handleSelectd" />
  </ProDrawer>
</template>
<script setup>
import { ref, reactive,toValue ,computed} from "vue";
import { ElMessage } from "element-plus";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
import ArtistList from "../artistList/index";
import {
  getAlbumTypeListApi,
  uploadAlbumAvatarApi,
  addAlbumApi,
  updateAlbumApi
} from "@/api/modules/album.js";

const emit = defineEmits(["success"]);
const title = ref("添加专辑")
const isUpdate = ref(false);
const isShow = ref(false);
const showDrawer = (data) => {
  isShow.value = true;
  isUpdate.value = Boolean(data);
  initFormDate(data,isUpdate)
};
const initFormDate=(data,isUpdate)=>{
  isUpdate = toValue(isUpdate);
  formData.value={
    arId:  "",
    cateId: "",
    description:isUpdate ? data.description: "",
    name: isUpdate ? data.name : "",
    publishTime: isUpdate ? data.publishTime : "",
    cover: null,
    id:isUpdate ? data.id : undefined
  };
  artist.value = null;
}
const config = computed(()=>[
  [
    {
      label: "名称",
      prop: "name",
      tag: "input",
      placeholder: "请输入专辑名称",
      required: true
    }
  ],
  [
    {
      label: "简介",
      prop: "description",
      placeholder: "请输入专辑简介",
      tag: "input",
      required: true,
      attrs: {
        type: "textarea"
      }
    }
  ],
  [
    {
      label: "分类",
      prop: "cateId",
      placeholder: "请选择专辑分类",
      tag: "select",
      required: true,
      options: [],
      attrs: {
        clearable: true
      },
      isShow:!isUpdate.value
    }
  ],
  [
    {
      label: "发布时间",
      prop: "publishTime",
      tag: "date",
      required: true,
      placeholder: "请选择发布时间",
      attrs: {
        "value-format": "YYYY-MM-DD"
      }
    }
  ],
  [
    {
      label: "专辑封面",
      tag: "cover",
      required: true,
      prop: "cover",
      isShow:!isUpdate.value
    }
  ],
  [
    {
      label: "歌手",
      tag: "slot",
      prop: "arId",
      required: true,
      isShow:!isUpdate.value
    }
  ]
]);
const formData = ref({
  arId: "",
  cateId: "",
  description: "",
  name: "",
  publishTime: "",
  cover: null
});

const typeList = ref([]);
getAlbumTypeListApi().then(res => {
  typeList.value = res.map(item => {
    return {
      label: item.name,
      value: item.id
    };
  });
  for (let item of config.value) {
    if (item[0].prop === "cateId") {
      item[0].options = typeList.value;
    }
  }
});
const artistListRef = ref();
const handleSelectArtist = () => {
  artistListRef.value && artistListRef.value.showDrawer();
};

const artist = ref(null);
const handleSelectd = val => {
  artist.value = val && val.length !== 0 ? val[0] : null;
  formData.value.arId = artist.value.id;
};

const formRef = ref();
const handleConfirm = () => {
  formRef.value.formRef.validate(async e => {
    if (e) {
      if(!isUpdate.value){
        const res = await addAlbumApi(formData.value);
        const coverFile = new FormData();
        coverFile.append("album_cover", formData.value.cover);
        await uploadAlbumAvatarApi(res.id, coverFile);
      }else{
        await updateAlbumApi({...formData.value,alId:formData.value.id,desc:formData.value.description});
      }
      ElMessage.success("新增成功");
      isShow.value = false;
      emit("success");
    }
  });
};
defineExpose({
  showDrawer
});
</script>
