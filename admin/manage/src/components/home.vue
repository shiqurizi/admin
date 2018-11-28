<template>
    <div class="manage">
        <el-container>
            <el-header>
                <ul>
                    <li class="fl">
                        <img src="#" alt="">
                    </li>
                    <li class="fl">
                        <span>波奇网,后台管理系统</span>
                    </li>
                    <li class="fr">
                        <span>欢迎&nbsp;<strong>{{username}}</strong>&nbsp;登录我们波奇网后台管理系统，在这你可以为所欲为 </span>
                    </li>
                </ul>
            </el-header>
            <el-container>
                <el-aside width="200px">
                    <el-row class="tac">
                        <el-col :span="12">
                        <el-menu
                            :default-active="this.currentMenu"
                            class="el-menu-vertical-demo"
                            background-color="#545c64"
                            text-color="#fff"
                            active-text-color="#ffd04b">
                            <el-submenu index="1">
                            <template slot="title" >
                                <span>商品管理</span>
                            </template>
                            <el-menu-item-group>
                                <el-menu-item index="/home/classify" @click="classify">商品分类</el-menu-item>
                                <el-menu-item index="/home/list" @click="list">商品列表</el-menu-item>
                            </el-menu-item-group>
                            </el-submenu>
                            <el-submenu index="2">
                            <template slot="title">
                                <span>用户管理</span>
                            </template>
                            <el-menu-item-group>
                                <el-menu-item index="/home/user" @click="user">资料修改</el-menu-item>
                                <el-menu-item index="/home/password" @click="password">修改密码</el-menu-item>
                                <el-menu-item index="/home/means" @click="means">用户资料</el-menu-item>
                            </el-menu-item-group>
                            </el-submenu>
                            <el-submenu index="3">
                            <template slot="title">
                                <span>交易管理</span>
                            </template>
                            <el-menu-item-group>
                                <el-menu-item index="3-1">订单列表</el-menu-item>
                            </el-menu-item-group>
                            </el-submenu>
                        </el-menu>
                        </el-col>
                    </el-row>
                </el-aside>
                <el-main>
                    <router-view/>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>
<script>
export default {
    data:function(){
        return {
            username:'',
            currentMenu:'/home'
        }
    },
    created(){
        this.username=sessionStorage.getItem('name');
        this.getUrl();
    },
    methods:{
        // 保持刷新后asider的状态，通过其url判定
        getUrl(){
            let self = this;
            let currentUrl = window.location.href;
            self.currentMenu = currentUrl.split('#')[1];
        },
        classify(){   
            this.$router.push({path:'/home/classify'});   
        },
        list(){
            this.$router.push({path:'/home/list'}); 
        },
        password(){
            this.$router.push({path:'/home/password'}); 
        },
        means(){
            this.$router.push({path:'/home/means'}); 
        },
        user(){
            this.$router.push({path:'/home/user'}); 
        },
  }
}
</script>
<style scoped>
    .el-header{
        background-color: #B3C0D1;
        color: #333;
        text-align: center;
        line-height: 60px;
    }
    .el-header ul{overflow: hidden;}
    .fl{float:left;}
    .fr{float:right;}
    .el-aside {
        background-color: rgb(84, 92, 100);
        text-align: center;
        
    }
    /* .el-main {
        background-color: #E9EEF3;
        color: #333;
        text-align: center;
    } */
</style>

