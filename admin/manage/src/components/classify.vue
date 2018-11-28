<template>
    <div class="brand">
        <el-breadcrumb separator="/">
            <el-breadcrumb-item :to="{ path: '' }">首页</el-breadcrumb-item>
            <el-breadcrumb-item>商品管理</el-breadcrumb-item>
            <el-breadcrumb-item>商品分类</el-breadcrumb-item>
        </el-breadcrumb>
        <el-button  type="primary" @click="dialogTableVisible = true" style="margin:20px 0">添加</el-button>
        <el-dialog title="添加分类" :visible.sync="dialogTableVisible">
            <el-form :model="form">
                <el-form-item label="商品分类"  style="width:400px">
                    <el-input v-model="form.classify"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogTableVisible = false">取 消</el-button>
                <el-button type="primary" @click="addClassify()">确 定</el-button>
            </div>
        </el-dialog>
        <el-table :data="tableData" tooltip-effect="dark" style="width: 100%" border>
            <el-table-column  width="60" header-align="center" label="行号">
                <template slot-scope="{row,$index}">
                    <span>{{$index + 1}}</span>
                </template>
            </el-table-column>
            <el-table-column label="ID" prop="id" width="200" sortable header-align="center">
            </el-table-column>
            <el-table-column label="分类名" width="300" prop="brand" header-align="center">
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.brand" />
                    <span v-if="!showEdit[$index]">{{row.brand}}</span>
                </template>
            </el-table-column>
            <el-table-column  label="操作" width="200" header-align="center">
                <template slot-scope="{row,$index}">
                    <el-button type="text" size="small"  @click.native="handleUpdate($index, row)"   v-if="showBtn[$index]">更新</el-button>
                    <el-button type="text" size="small"  @click.native="handleCancel($index, row)"  v-if="showBtn[$index]">取消</el-button>
                    <el-button type="text" size="small"  @click.native="handleEdit($index, row)"   v-if="!showBtn[$index]">编辑</el-button>
                    <el-button type="text" size="small"  @click.native="handleDelete($index, row)"   v-if="!showBtn[$index]">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>
<script>
export default {
    data(){
        return {
            dialogTableVisible: false,
            dialogFormVisible: false,
            form:{
                classify:'',
            },
            showEdit: [], //显示编辑框
            showBtn: [],
            showBtnOrdinary: true,
            tableData:[],
        }
    },
    
    created(){
        this.getData();
    },
    methods:{
        // 点击编辑
        handleEdit(index, row) {
            this.showEdit[index] = true;
            this.showBtn[index] = true;
            this.$set(this.showEdit,row,true)
            this.$set(this.showBtn,row,true)
        },
        //取消编辑
        handleCancel(index, row) {
            this.showEdit =[];
            this.showBtn = [];
        },
        //点击更新
        handleUpdate(index,row) {
            var id=row.id;
            var brand=row.brand;
            console.log(row.brand);
            this.$http({
                method:'post',
                url:'/api/classifyChange',
                data:{
                    id:row.id,
                    brand:row.brand
                }
            }).then(res=>{
                if(res.data=='1'){
                    this.$message({
                            message: '资料修改成功',
                            type: 'success'
                    });
                    this.getData();
                    this.handleCancel();

                }else if(res.data=='error'){
                     this.$message.error('资料修改失败');
                }
            })
        },
        //点击删除
        handleDelete(index, row) {
            console.log(index, row);
            this.$http({
                method:"post",
                url:"/api/classifyDelete",
                data:{
                    id:row.id,
                    username:row.name,
                }
                }).then(res=>{
                    if(res.data=='1'){
                        this.getData();
                    }else{
                         this.$message.error('删除失败');
                    }
                })
        },
        // 增加分类
        addClassify(){
            var classify=this.form;
            this.$http({
                    method:"post",
                    url:"/api/classifyAdd",
                    data:classify
                }).then(res=>{
                    if(res.data=='1'){
                        this.$message({
                            message: '资料修改成功',
                            type: 'success'
                        });
                        this.dialogTableVisible=false;
                        this.getData();
                    }else{
                        this.$message.error('删除失败');
                    }
            })
        },
        getData(){
             this.$http({
                method:"get",
                url:"/api/brand",
            }).then(res=>{
                let data=res.data;
                console.log(data);
                this.tableData=res.data;
            });
        }
    }
}
</script>
<style>

</style>

