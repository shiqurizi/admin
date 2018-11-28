// 创建连接模块
var mysql= require("mysql");
// 配置接口
var conn = mysql.createConnection({
    "host":"localhost",//主机名或者IP地址
    "port":"3306",//端口
    "user":"root",//用户名
    "password":"",//密码
    "database":"background",//库名
    charset:'UTF8_GENERAL_CI'
});

// 启动连接
conn.connect();
module.exports=conn;//创建模块的关键步骤