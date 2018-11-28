<template>
    <div class="login">
        <h1>波奇网后台管理系统</h1>
        <el-form  label-width="80px" :model="form" label-position="top">
            <el-form-item label="用户名" style="width:400px">
                <el-input v-model="form.name">
                </el-input>
            </el-form-item>
            <el-form-item label="密码" style="width:400px">
                <el-input v-model="form.password"></el-input>
            </el-form-item>
            <el-row style="margin-bottom:20px">
                <el-button type="primary" style="width:400px" @click="login()">登录</el-button>
            </el-row>
            <el-row>
                <el-checkbox v-model="checked">记住密码</el-checkbox>
                <a href="#">忘记密码？</a>
            </el-row>
        </el-form>
    </div>
</template>
<script>
export default {
    data:function(){
        return {
            checked:false,
            form:{
                name:'',
                password:'',
            },
        }
    },
    methods:{
        login(){
            this.$http({
                method:"post",
                url:"/api/login",
                data:this.form
            }).then(res=>{
                if(res.data=='error'){
                    this.$message.error('登录失败，密码或用户名错误');
                }else{
                    console.log(res.data);
                    sessionStorage.setItem('name',res.data[0].name);
                    this.$router.push({
                        path:'/home'
                    })
                }
            })
        }
    },
    created(){
    }
}
</script>
<style scoped>
    h1{text-align: center;margin:20px 0;}
    .login{margin:40px auto;width:410px;padding:40px 100px;border:2px solid #000;}
    a{text-decoration: none;font-size: 12px;display:block;float: right;}
</style>
