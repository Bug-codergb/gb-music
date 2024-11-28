<template>
  <div class="pro-form">
    <el-form :model="newFormData" label-position="top" ref="formRef">
      <el-row v-for="(item, index) in newFormConfig" :key="index" :gutter="20">
        <el-col v-for="it in item" :span="24 / item.length">
          <el-form-item
            :prop="it.prop"
            :label="it.label"
            v-if="it.isShow"
            :rules="{ required: !!it.required, message: `${it.label}不能为空`, trigger: ['change', 'blur'] }"
          >
            <template v-if="it.tag === 'input'">
              <el-input v-bind="it.attrs" :placeholder="it.placeholder" v-model="newFormData[it.prop]" />
            </template>
            <template v-if="it.tag === 'input-number'">
              <el-input-number v-bind="it.attrs" :placeholder="it.placeholder" v-model="newFormData[it.prop]" />
            </template>
            <template v-if="it.tag === 'select'">
              <el-select v-bind="it.attrs" :placeholder="it.placeholder" v-model="newFormData[it.prop]">
                <el-option v-for="item in it.options" :key="item.value" :value="item.value" :label="item.label"></el-option>
              </el-select>
            </template>
            <template v-if="it.tag==='radio'">
              <el-radio-group v-bind="it.attrs" v-model="newFormData[it.prop]">
                <el-radio v-for="row in it.options" :value="row.value">{{row.label}}</el-radio>
              </el-radio-group>
            </template>
            <template v-if="it.tag === 'date'">
              <el-date-picker
                v-model="newFormData[it.prop]"
                style="width: 100%"
                v-bind="it.attrs"
                type="date"
                :placeholder="it.placeholder"
              />
            </template>
            <template v-if="it.tag==='autocomplete'">
              <el-autocomplete v-model="newFormData[it.prop]" :placeholder="it.placeholder" v-bind="it.attrs" v-on="it.events||{}"/>
            </template>
            <template v-if="it.tag === 'cover'">
              <div class="cover-container flx-center">
                <template v-if="!isPrevCover">
                  <input type="file" :key="coverKey" @change="e => coverChange(e, it.prop)" />
                  <el-icon><Picture /></el-icon>
                </template>
                <template v-else>
                  <img :src="prevCoverURL" />
                  <div class="mask flx-center" @click="handleDelCover" title="删除文件">
                    <el-icon><Delete /></el-icon>
                  </div>
                </template>
              </div>
            </template>
            <template v-if="it.tag==='file'">
              <FormFile v-model="newFormData[it.prop]" v-bind="it.attrs"/>
            </template>
            <template v-if="it.tag==='video'">
              <FormFile v-model="newFormData[it.prop]" v-bind="it.attrs" file-type="video"/>
            </template>
            <template v-if="it.tag === 'slot'">
              <slot :name="it.prop"></slot>
            </template>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <ProCropper ref="proCopperRef" @confirm="handleConfirm" :aspectRatio="aspectRatio" :realWidth="realWidth" />
  </div>
</template>
<script setup>
import { ref, watch, computed } from "vue";
import cloneDeep from "lodash/cloneDeep";
import { ElMessage } from "element-plus";
import ProCropper from "../ProCropper/index.vue";
import FormFile from "./components/FormFile.vue"
const props = defineProps({
  aspectRatio: {
    type: Number,
    default: 16 / 9
  },
  realWidth: {
    type: Number,
    default: 300
  },
  config: {
    type: Array,
    default() {
      return [];
    }
  },
  modelValue: {
    type: Object,
    default() {
      return {};
    }
  }
});
const emit = defineEmits(["update:modelValue"]);
const newFormData = ref(cloneDeep(props.modelValue));


watch(
  () => newFormData.value,
  newVal => {
    emit("update:modelValue", newVal);
  },
  {
    deep: true,
    immediate:true
  }
);
const newFormConfig = computed(() =>{
  for(let item of props.config){
    for(let it of item){
      it.isShow = it.isShow===null || it.isShow===undefined ? true :it.isShow
    }
  }
  return props.config
});

const proCopperRef = ref();
const currentCoverProp = ref("");

const coverKey = ref(0);
const coverChange = (e, prop) => {
  const file = e.currentTarget.files[0];
  if (!file.type.includes("image")) {
    ElMessage.warning("请上传图片文件");
    return;
  }
  coverKey.value+=1;
  proCopperRef.value && proCopperRef.value.showDialog(file);
  currentCoverProp.value = prop;
};

const isPrevCover = ref(false);
const prevCoverURL = ref("");
const handleConfirm = file => {
  file && (isPrevCover.value = true);
  file && (prevCoverURL.value = URL.createObjectURL(file));

  newFormData.value[currentCoverProp.value] = file;
  formRef.value && formRef.value.clearValidate(currentCoverProp.value);
};

const handleDelCover = () => {
  isPrevCover.value = false;
  prevCoverURL.value = "";

  newFormData.value[currentCoverProp.value] = null;
  currentCoverProp.value = "";
};
const formRef = ref();
defineExpose({
  formRef
});
</script>
<style lang="scss" scoped>
.pro-form {
  .cover-container {
    position: relative;
    width: 100%;
    height: 140px;
    background-color: #fafafa;
    input {
      position: absolute;
      z-index: 999;
      width: 100%;
      height: 100%;
      cursor: pointer;
      opacity: 0;
    }
    .el-icon {
      position: absolute;
      z-index: 98;
      font-size: 28px;
      color: var(--el-color-primary);
    }
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
    .mask {
      position: absolute;
      display: none;
      width: 100%;
      height: 100%;
      cursor: pointer;
      background-color: rgb(0 0 0 / 45%);
      transition: display 0.3s;
      .el-icon {
        font-size: 40px;
        font-weight: bolder;
        color: #ffffff;
      }
    }
    &:hover {
      .mask {
        display: flex;
      }
    }
  }
}
</style>
