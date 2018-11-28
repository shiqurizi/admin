<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
  import Vue from 'vue';
  import Element from 'element-ui';
  import 'element-ui/lib/theme-chalk/index.css';
  Vue.use(Element);
  // 引用数据加载插件
  import axios from 'axios';
  // 将axios加入到vue的原型对象里面，其他页面就可以直接用this
  Vue.prototype.$http = axios;
  export default {
    name: 'App'
  }
</script>

<style>
    *{margin:0;padding:0;}
    ul{list-style:none;}
</style>
