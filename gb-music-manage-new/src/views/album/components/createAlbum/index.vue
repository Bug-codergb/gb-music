<template>
  <ProDrawer v-model="isShow" @confirm="handleConfirm" title="添加专辑">
    <ProForm :config="config">
      <template #artist>
        <el-button type="primary" @click="handleSelectArtist">选择歌手</el-button>
      </template>
    </ProForm>
    <ArtistList ref="artistListRef" />
  </ProDrawer>
</template>
<script setup>
import { ref, reactive } from "vue";
import ProDrawer from "@/components/ProDrawer/index.vue";
import ProForm from "@/components/ProForm/index.vue";
import ArtistList from "../artistList/index";
import { getAlbumTypeList } from "@/api/modules/album.js";
const isShow = ref(true);
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
      placeholder: "请选择发布时间"
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
      prop: "artist",
      required: true
    }
  ]
]);
const formData = reactive({
  arId: "",
  cateId: "",
  description: "",
  name: "",
  publishTime: "",
  cover: null
});

const typeList = ref([]);
getAlbumTypeList().then(res => {
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

const handleConfirm = () => {};

defineExpose({
  showDrawer
});
</script>
