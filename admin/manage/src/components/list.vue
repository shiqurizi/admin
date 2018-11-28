<template>
    <div class="goods">
        <el-form :inline="true"  class="demo-form-inline" :model="formInline">
            <el-form-item label="关键字">
                <el-input  placeholder="请输入商品名称" v-model="formInline.user"></el-input>
            </el-form-item>
            <el-form-item label="商品分类">
                <el-select placeholder="请选择分类" v-model="formInline.region">
                    <el-option v-for="item in classify" :key="item.id" v-model="item.brand">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" icon="el-icon-search" @click="searchGoods()">搜索</el-button>
            </el-form-item>
        </el-form>
        <el-row style="margin-bottom:10px">
            <el-button type="primary" @click="goodsAllDelete">删除</el-button>
            <el-button type="text" @click="dialogFormVisible = true">添加</el-button>
            <el-dialog title="添加商品" :visible.sync="dialogFormVisible">
                <el-form :model="form">
                    <el-form-item label="商品分类"  style="width:400px">
                        <el-input v-model="form.region"></el-input>
                    </el-form-item>
                    <el-form-item label="商品名"  style="width:400px">
                        <el-input v-model="form.name"></el-input>
                    </el-form-item>
                    <el-form-item label="价格"  style="width:400px">
                        <el-input v-model="form.price"></el-input>
                    </el-form-item>
                    <el-form-item label="上传时间"  style="width:400px">
                        <el-input v-model="form.date"></el-input>
                    </el-form-item>
                    <el-form-item label="发布状态"  style="width:400px">
                        <el-input v-model="form.lab"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="addGoods()">确 定</el-button>
                </div>
            </el-dialog>
        </el-row>
        <!-- 主表格 -->
        <el-table :data="tableData" tooltip-effect="dark" style="width: 100%" border max-height="350" ref="multipleTable" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55" fixed>
            </el-table-column>
            <el-table-column label="ID" prop="id" width="200" sortable header-align="center">
            </el-table-column>
            <el-table-column label="商品分类" width="300" prop="brand" header-align="center">
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.brand" />
                    <span v-if="!showEdit[$index]">{{row.brand}}</span>
                </template>
            </el-table-column>
            <el-table-column label="商品名称" width="300" prop="name" header-align="center">
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.name" />
                    <span v-if="!showEdit[$index]">{{row.name}}</span>
                </template>
            </el-table-column>
            <el-table-column label="价格" width="300" prop="price" header-align="center">
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.price" />
                    <span v-if="!showEdit[$index]">{{row.price}}</span>
                </template>
            </el-table-column>
            <el-table-column label="上传时间" width="300" prop="sales" header-align="center" sortable>
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.sales" />
                    <span v-if="!showEdit[$index]">{{row.sales}}</span>
                </template>
            </el-table-column>
            <el-table-column label="发布状态" width="300" prop="hot" header-align="center" sortable>
                <template slot-scope="{row,$index}">
                    <input class="edit-cell" v-if="showEdit[$index]" v-model="row.hot" />
                    <span v-if="!showEdit[$index]">{{row.hot}}</span>
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
        <!-- 分页板块 -->
        <div class="block">
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage"
        :page-sizes="[5, 8, 12, 15]" :page-size="10" layout="total, sizes, prev, pager, next, jumper" :total="this.totalCount">
        </el-pagination>
    </div>
    </div>
</template>
<script>
export default {
    data:function(){
        return {
            classify:[],
            formInline:{
                user:'',
                region:''
            },
            form:{
                region:'',
                name:'',
                price:'',
                date:'',
                lab:''
            },
            totalCount:5,
            currentPage: 1,
            currentNum:5,
            dialogTableVisible: false,
            dialogFormVisible: false,
            showEdit: [], //显示编辑框
            showBtn: [],
            showBtnOrdinary: true,
            tableData:[],
            multipleSelection:[],
        }  
    },
    created(){
        this.getClassify();
        this.getGoods();
    },
    methods:{
        // 获取当前页的商品数据
        getGoods(){
            this.$http({
                method:"post",
                url:"/api/page",
                data:{
                    page:this.currentPage,
                    num:this.currentNum
                }
            }).then(res=>{
                if(res.data=='error'){
                    this.$message.error('数据加载失败');
                }else{
                    console.log(res.data);
                    this.totalCount=res.data.totalCount;
                    this.tableData=res.data.data;
                }
            })
        },
        // 获取商品分类信息
        getClassify(){
            this.$http.get('/api/brand').then(res=>{
                if(res.data=='error'){
                        this.$message.error('页面加载失败');
                    }else{
                        console.log(res.data);
                        this.classify=res.data;
                    }
            })
        },
        //查询商品信息
        searchGoods(){
            this.$http({
                method:"post",
                url:"/api/goodsSelect",
                data:this.formInline
            }).then(res=>{
                console.log(res.data);
                if(res.data=='error'){
                    this.$message.error('查询失败');
                    this.tableData=[];
                }else{
                    this.tableData=[];
                    this.totalCount=res.data.length;
                    this.tableData=res.data;
                }
            })
        },
        addGoods(){
            this.$http({
                method:"post",
                url:"/api/goodsAdd",
                data:this.form
            }).then(res=>{
                if(res.data=='1'){
                    this.dialogFormVisible=false;
                    this.$message({
                            message: '商品添加成功',
                            type: 'success'
                    });
                    this.getGoods();  
                }else if(res.data=='0'){
                     this.$message.error('商品添加失败，请重新操作');
                }
            })
        },
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
                url:'/api/goodsChange',
                data:{
                    id:row.id,
                    form:{
                        name:row.name,
                        price:row.price,
                        date:row.sales,
                        region:row.brand,
                        lab:row.hot
                    },
                }
            }).then(res=>{
                if(res.data=='1'){
                    this.$message({
                            message: '资料修改成功',
                            type: 'success'
                    });
                    this.getGoods();
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
                url:"/api/goodsDelete",
                data:{
                    id:row.id,
                    username:row.name,
                }
                }).then(res=>{
                    if(res.data=='1'){
                        this.getGoods();
                    }else{
                         this.$message.error('删除失败');
                    }
                })
        },
        // 多个商品删除
        goodsAllDelete(){
            let ids=[]
            this.multipleSelection.map((item)=> {
                ids.push(item.id)
            });
            console.log(ids);
            this.$http({
                method:"post",
                url:"/api/goodsAllDelete",
                data:{
                    id:ids,
                }
            }).then(res=>{
                if(res.data=='success'){
                    this.$message({
                        message: '删除成功',
                        type: 'success'
                    });
                    this.currentPage=1;
                    this.getGoods();
                }else if(res.data=='error'){
                    this.$message.error('删除失败');
                }
            })
        },
        handleSelectionChange(val) {
            this.multipleSelection = val;
        },
        handleSizeChange(val) {
            console.log(`每页 ${val} 条`);
            this.currentNum=val;
            this.getGoods();
        },
        handleCurrentChange(val) {
            console.log(`当前页: ${val}`);
            this.currentPage=val;
            this.getGoods();
        },
    }
}
</script>
