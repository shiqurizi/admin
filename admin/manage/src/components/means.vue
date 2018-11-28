<template>
    <div class="main">
        <el-form :inline="true" :model="formInline" class="demo-form-inline">
            <el-form-item label="登录人">
                <el-input v-model="formInline.user" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="手机">
                <el-input v-model="formInline.tel" placeholder="请输入"></el-input>
            </el-form-item>
            <el-form-item label="角色">
                <el-select v-model="formInline.region">
                    <el-option label="超级管理员" value="超级管理员"></el-option>
                    <el-option label="管理员" value="管理员"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSearch">搜索</el-button>
            </el-form-item>
        </el-form>
        <el-row>
            <el-button type="primary" @click="userAllDelete">删除</el-button>
            <el-button type="text" @click="dialogFormVisible = true">添加</el-button>
            <el-dialog title="添加用户" :visible.sync="dialogFormVisible">
                <el-form :model="form">
                    <el-form-item label="登录名"  style="width:400px">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="密码"  style="width:400px">
                        <el-input v-model="form.password"></el-input>
                    </el-form-item>
                    <el-form-item label="角色"  style="width:400px">
                        <el-input v-model="form.role"></el-input>
                    </el-form-item>
                    <el-form-item label="手机"  style="width:400px">
                        <el-input v-model="form.tel"></el-input>
                    </el-form-item>
                    <el-form-item label="邮箱"  style="width:400px">
                        <el-input v-model="form.mail"></el-input>
                    </el-form-item>
                    <el-form-item label="审核状态">
                        <el-select v-model="form.region">
                        <el-option label="未审核" value="未审核"></el-option>
                        <el-option label="已审核" value="已审核"></el-option>
                        </el-select>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="onSend()">确 定</el-button>
                </div>
            </el-dialog>
        </el-row>
        <el-table ref="multipleTable" :data="user" tooltip-effect="dark" style="width: 100%"  max-height="350" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" fixed>
            </el-table-column>
            <el-table-column label="ID" prop="id" width="120" sortable>
            </el-table-column>
            <el-table-column label="登录名" prop="name" width="120">
            </el-table-column>
            <el-table-column label="手机" prop="tel" width="180">
            </el-table-column>
            <el-table-column label="邮箱" prop="mail" width="180">
            </el-table-column>
            <el-table-column label="角色" prop="role" width="120">
            </el-table-column>
            <el-table-column label="加入时间" prop="reg_time" width="180" sortable>
            </el-table-column>
            <el-table-column label="审核状态" prop="audit" width="120">
            </el-table-column>
            <el-table-column label="操作" width="180">
                <template slot-scope="scope">
                    <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                    <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                formInline: {
                    user: '',
                    tel:'',
                    region: '',
                },
                user:[
                ],
                dialogTableVisible: false,
                dialogFormVisible: false,
                formLabelWidth: '120px',
                form:{
                    name:'',
                    password:'',
                    role:'',
                    tel:'',
                    mail:'',
                    region:''
                },
                multipleSelection:[],
            }
        },
        created(){
            this.getData();
        },
        methods: {
            // 添加用户的方法
            onSend(){
                var info=this.form;
                console.log(info);
                this.$http({
                    method:"post",
                    url:"/api/userAdd",
                    data:{
                        user:info
                    }
                }).then(res=>{
                    if(res.data=='1'){
                        this.dialogFormVisible=false;
                        this.getData();
                    }else{
                       this.$message.error('添加失败');
                    }
                })
            },
            // 查询用户
            onSearch() {
                this.$http({
                    method:"post",
                    url:"/api/userSelect",
                    data:this.formInline
                }).then(res=>{
                    console.log(res.data);
                    if(res.data=='error'){
                        this.$message.error('查询失败');
                        this.user=[];
                    }else{
                        this.user=[];
                        this.user=res.data;
                    }
                })
            },
            handleEdit(index, row){
                console.log(666)
                console.log(index, row);
            },
            // 删除用户
            handleDelete(index, row){
                console.log(index, row);
                // var id=row.id;
                // var name=row.name;
                this.$http({
                    method:"post",
                    url:"/api/userDelete",
                    data:{
                        id:row.id,
                        username:row.name,
                    }
                }).then(res=>{
                    if(res.data=='1'){
                        console.log(666);
                        this.getData();
                    }
                })
            },
            // 删除多个用户
            userAllDelete(){
                let ids=[]
                this.multipleSelection.map((item)=> {
                    ids.push(item.id)
                })
                this.$http({
                    method:"post",
                    url:"/api/userAllDelete",
                    data:{
                        id:ids,
                    }
                }).then(res=>{
                    if(res.data=='success'){
                        this.$message({
                            message: '删除成功',
                            type: 'success'
                        });
                        this.getData();
                    }else if(res.data=='error'){
                        this.$message.error('删除失败');
                    }
                })
            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            getData(){
                this.$http({
                    method:"post",
                    url:"/api/info",
                }).then(res=>{
                    if(res.data=='error'){
                        this.$message.error('页面加载失败');
                    }else{
                        let data=res.data;
                        console.log(data);
                        this.user=res.data;
                    }
                })
            },
        }
    }
</script>
<style>
</style>

