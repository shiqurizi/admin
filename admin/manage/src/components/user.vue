<template>
    <div class="information">
        <el-form ref="form" label-width="100px" :model="form" :rules="rules">
            <el-form-item label="我的角色" prop="role">
                <el-select placeholder="请输入角色" v-model="form.role" style="width:700px">
                    <el-option label="超级管理员" value="超级管理员"></el-option>
                    <el-option label="管理员" value="管理员"></el-option>
                </el-select>
                <span>{{this.yanzhen}}</span>
            </el-form-item>
            <el-form-item label="用户名"  style="width:800px" prop="username">
                <el-input v-model="form.name"></el-input>
                <span>不可修改，一般用于后台登录名</span>
            </el-form-item>
            <el-form-item label="昵称"  style="width:800px" prop="nickname">
                <el-input v-model="form.nickname"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="gender">
                <template>
                    <el-radio v-model="form.gender" label="男">男</el-radio>
                    <el-radio v-model="form.gender" label="女">女</el-radio>
                </template>
            </el-form-item>
            <el-form-item label="头像">
                <el-input style="width:500px"></el-input>
                <el-button>上传图片</el-button>
                <el-button>查看图片</el-button>
            </el-form-item>
            <el-form-item label="手机"  style="width:800px" prop="tel">
                <el-input v-model="form.tel"></el-input>
            </el-form-item>
            <el-form-item label="邮箱"  style="width:800px" prop="mail">
                <el-input v-model="form.mail"></el-input>
            </el-form-item>
            <el-form-item label="备注" style="width:800px" prop="remark">
                <el-input type="textarea" placeholder="请输入内容" v-model="form.remark"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="userChange()">确认修改</el-button>
                <el-button @click="cancel()">重新填写</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data () {
        var validatePass = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请输入昵称'));
            }
        };
        var validatePass1 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('性别必选'));
            }
        };
        var validatePass2 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请填入手机号码'));
            }else if(value!="/^1[34578]\d{9}$/"){
                callback(new Error('手机号码格式不对'))
            }
        };
        var validatePass3 = (rule, value, callback) => {
            if (value === '') {
                callback(new Error('请填入邮箱'));
            }else if(value!="/[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/"){
                callback(new Error('邮箱格式不对'))
            }
        };
        var validatePass4 = (rule, value, callback) => {
            if (value == '超级管理员') {
                this.yanzhen='当前角色不可更改';
            }
        };
        return {
            form:{
                role:'',
                genter: '',
                name:'',
                nickname:'',
                gender:'',
                tel:'',
                mail:'',
                remark:''
            },
            yanzhen:'',
            rules: {
                nickname: [
                    {validator:validatePass,trigger:'blur'}
                ],
                gender: [
                    { required: true, message: '性别必选', trigger: 'change' }
                ],
                tel: [
                    { validator: validatePass2, trigger: 'blur' }
                ],
                mail: [
                    { validator: validatePass3, trigger: 'blur' }
                ],
                role: [
                    { validator: validatePass4, trigger: 'change' }
                ],
            }, 

        };
    },
    created(){
        this.$http({
            method:'post',
            url:'/api/detail',
            data:{
                name:sessionStorage.getItem('name'),
            }
        }).then(res=>{
            if(res.data=='error'){
                this.$message.error('页面数据加载失败');
            }else{
                console.log(res.data);
                this.form=res.data[0];
            }
        })
    },
    methods:{
        userChange(){
            var infoForm=this.form;
            console.log(infoForm)
            this.$http({
                method:'post',
                url:'/api/userChange',
                data:infoForm
            }).then(res=>{
                if(res.data=='1'){
                    this.$message({
                            message: '资料修改成功',
                            type: 'success'
                    });
                }else if(res.data=='error'){
                     this.$message.error('资料修改失败');
                }
            })
        },
        cancel(){
            this.form.tel='';
            this.form.mail='';
            this.form.nickname='';
            this.form.genter='';
            this.form.remark='';
        }
    },
}
</script>
