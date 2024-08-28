import globals from "globals";
import pluginJs from "@eslint/js";
import pluginVue from "eslint-plugin-vue";
const eslintConfigPrettier = require("eslint-config-prettier");
const eslintPluginPrettierRecommended = require("eslint-plugin-prettier/recommended");
export default [
  {
    files: ["**/*.{js,mjs,cjs,vue}"],
    ignores: ["node_modules/*", "dist/*"]
  },
  {
    files: ["**/*.js"],
    languageOptions: { sourceType: "commonjs" }
  },
  {
    languageOptions: { globals: globals.browser }
  },
  pluginJs.configs.recommended,
  ...pluginVue.configs["flat/essential"],
  eslintConfigPrettier,
  eslintPluginPrettierRecommended,
  {
    rules: {
      "no-var": "error",
      "vue/multi-word-component-names": "off"
    }
  }
];
