<template>
  <ProDrawer
    v-model="isShow"
    @confirm="handleConfirm"
    title="添加专辑"
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
import { ref, reactive } from "vue";
import { ElMessage } from "element-plus";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
import ArtistList from "../artistList/index";
import {
  getAlbumTypeListApi,
  uploadAlbumAvatarApi,
  addAlbumApi
} from "@/api/modules/album.js";

const emit = defineEmits(["success"]);

const isShow = ref(false);
const showDrawer = () => {
  isShow.value = true;
};
const config = reactive([
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
      }
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
      prop: "cover"
    }
  ],
  [
    {
      label: "歌手",
      tag: "slot",
      prop: "arId",
      required: true
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
  for (let item of config) {
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
  console.log(artist.value);
  formData.value.arId = artist.value.id;
};

const formRef = ref();
const handleConfirm = () => {
  formRef.value.formRef.validate(async e => {
    if (e) {
      const res = await addAlbumApi(formData.value);
      const coverFile = new FormData();
      coverFile.append("album_cover", formData.value.cover);
      await uploadAlbumAvatarApi(res.id, coverFile);
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
