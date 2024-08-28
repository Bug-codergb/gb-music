<template>
  <component :is="LayoutVerical" />
  <ThemeDrawer />
</template>
<script setup>
import LayoutVerical from "./LayoutVerical/index.vue";
import ThemeDrawer from "./components/ThemeDrawer/index.vue";
</script>
