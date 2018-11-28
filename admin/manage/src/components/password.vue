<template>
    <div class="change">
        <el-form :model="form" :rules="rules" ref="form" label-width="100px" class="demo-form">
            <el-form-item label="密码" style="width:800px" prop="password">
                <el-input type="password" autocomplete="off" v-model="form.password"></el-input>
            </el-form-item>
            <el-form-item label="新密码" style="width:800px" prop="newPsw">
                <el-input type="password" autocomplete="off" v-model="form.newPsw"></el-input>
            </el-form-item>
            <el-form-item label="确认密码" style="width:800px" prop="confirmPsw">
                <el-input type="password" autocomplete="off" v-model="form.confirmPsw"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="change()">确认修改</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data:function(){
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('新密码不能为空'));
            }else if(value===this.form.password){
                callback(new Error('新密码与原来密码一致，请重新输入'));
            } else {
                if (this.form.confirmPsw!== '') {
                    this.$refs.form.validateField('confirmPsw');
                }
                callback();
            }
        };
        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                (new Error('请再次输入密码'));
            } else if (value !== this.form.newPsw) {
                console.log
                callback(new Error('两次输入密码不一致!'));
            } else {
                callback();
            }
        };
        var validatePass3 =(rule,value,callback)=>{
            if(value===''){
                callback(new Error('密码不能为空'));
            }else{
                if (this.form.newPsw!== '') {
                    this.$refs.form.validateField('newPsw');
                }
                callback();
            }
        }
        return {
            form:{
                password:'',
                newPsw:'',
                confirmPsw:'',
            },
            rules: {
                password: [
                    {validator:validatePass3,trigger:'blur'}
                ],
                newPsw: [
                    { validator: validatePass, trigger: 'blur' }
                ],
                confirmPsw: [
                    { validator: validatePass2, trigger: 'blur' }
                ],
            }, 
        }
    },
    methods:{
        change(){
            var infoPsw=this.form;
            this.$http({
                    method:"post",
                    url:"/api/change",
                    data:{
                        name:sessionStorage.getItem('name'),
                        changePsw:infoPsw
                    }
                }).then(res=>{
                    if(res.data=='1'){
                       this.$message({
                            message: '密码修改成功',
                            type: 'success'
                        });
                        this.form.password='';
                        this.form.newPsw='';
                        this.form.confirmPsw='';
                    }else{
                        this.$message.error('密码修改失败，原密码输入有误');
                    }
                })
        }
    }
}
</script>
