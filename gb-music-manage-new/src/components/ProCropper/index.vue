<template>
  <div class="pro-cropper">
    <el-dialog title="图片裁剪" v-model="isShow" width="60%" :close-on-click-modal="false">
      <div class="box">
        <div class="lf">
          <img ref="imgRef" />
        </div>
        <div class="rt">
          <div class="small"></div>
        </div>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="handleCanacl">取消</el-button>
          <el-button type="primary" @click="handleConfirm"> 确定 </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>
<script setup>
import { ref, onMounted, nextTick } from "vue";
import Cropper from "cropperjs";
const emit = defineEmits(["confirm"]);
const props = defineProps({
  aspectRatio: {
    type: Number,
    default: 16 / 9
  },
  realWidth: {
    type: Number,
    default: 300
  }
});

const isShow = ref(false);

const imgRef = ref();
const cropperContainer = ref();

const rawFile = ref();
const showDialog = file => {
  isShow.value = true;
  rawFile.value = file;
  nextTick(() => {
    initCropper(file);
  });
};
const initCropper = file => {
  if (!file) {
    return;
  }
  if (imgRef.value) {
    const url = URL.createObjectURL(file);
    cropperContainer.value && cropperContainer.value.destroy();
    cropperContainer.value = new Cropper(imgRef.value, {
      ready: function () {
        console.log("ready");
      },
      dragMode: "move",
      aspectRatio: props.aspectRatio,
      viewMode: 1,
      background: false,
      zoomable: false,
      preview: ".small"
    });
    cropperContainer.value.replace(url);
  }
};
const getCropperFile = async file => {
  return await new Promise((resolve, reject) => {
    if (cropperContainer.value) {
      const canvasFile = cropperContainer.value.getCroppedCanvas({
        imageSmoothingQuality: "high",
        width: props.realWidth,
        imageSmoothingEnabled: false,
        fillColor: "#fff"
      });
      canvasFile.toBlob(blob => {
        if (blob && file) {
          const cropperFile = new File([blob], file.name, {
            type: file.type
          });
          resolve(cropperFile);
        } else {
          resolve(null);
        }
      });
    } else {
      reject(new Error("cropper 不存在"));
    }
  });
};
const handleCanacl = () => {
  isShow.value = false;
};
const handleConfirm = async () => {
  const ret = await getCropperFile(rawFile.value);
  emit("confirm", ret);
  isShow.value = false;
};
defineExpose({
  showDialog
});
const aspectRatio = props.aspectRatio;
</script>
<style lang="scss" scoped>
.box {
  display: flex;
  align-items: center;
  height: 40vh;
  background-color: skyblue;
  .lf,
  .rt {
    flex: 1;
    height: 100%;
  }
  .lf {
    background-color: #f5f7fa;
    img {
      width: 100%;
    }
  }
  .rt {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f5f7fa;
    .small {
      width: 70%;
      aspect-ratio: v-bind(aspectRatio);
      overflow: hidden;
    }
  }
}
</style>
, nextTick
