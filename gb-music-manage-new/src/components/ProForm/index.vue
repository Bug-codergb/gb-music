<template>
  <div class="pro-form">
    <el-form :model="formData" label-position="top">
      <el-row v-for="(item, index) in config" :key="index" :gutter="20">
        <el-col v-for="it in item" :span="24 / item.length">
          <el-form-item
            :label="it.label"
            :rules="{ required: !!it.require, message: `${it.label不能为空}`, trigger: ['change', 'blur'] }"
          >
            <template v-if="it.tag === 'input'">
              <el-input v-bind="it.attrs" :placeholder="it.placeholder" v-model="newFormData[it.prop]" />
            </template>
            <template v-if="it.tag === 'select'">
              <el-select v-bind="it.attrs" :placeholder="it.placeholder" v-model="newFormData[it.prop]">
                <el-option v-for="item in it.options" :key="item.value" :value="item.value" :label="item.label"></el-option>
              </el-select>
            </template>
            <template v-if="it.tag === 'cover'">
              <input type="file" @change="coverChange" />
            </template>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <ProCropper ref="proCopperRef" />
  </div>
</template>
<script setup>
import { ref } from "vue";
import { ElMessage } from "element-plus";
import ProCropper from "../ProCropper/index.vue";
const props = defineProps({
  config: {
    type: Array,
    default() {
      return [
        [
          {
            label: "姓名",
            prop: "name",
            tag: "input",
            require: true,
            placeholder: "请输入姓名",
            attrs: {
              clearable: true
            }
          },
          {
            label: "封面",
            prop: "cover"
          }
        ],
        [
          {
            label: "分类",
            tag: "select",
            prop: "cate",
            placeholder: "请选择AA",
            attrs: {
              clearable: true
            },
            options: [
              {
                label: "呜呜呜",
                value: "www"
              },
              {
                label: "呜1呜呜",
                value: "www1"
              }
            ]
          }
        ],
        [
          {
            label: "封面",
            prop: "cover",
            tag: "cover"
          }
        ]
      ];
    }
  },
  formData: {
    type: Object,
    default() {
      return {
        name: "dwdewd",
        cate: "www1"
      };
    }
  }
});
const newFormData = ref(props.formData);

const proCopperRef = ref();
const coverChange = e => {
  const file = e.currentTarget.files[0];
  if (!file.type.includes("image")) {
    ElMessage.warning("请上传图片文件");
    return;
  }
  proCopperRef.value && proCopperRef.value.showDialog(file);
};
</script>
