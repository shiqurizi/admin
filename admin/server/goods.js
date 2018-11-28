var express = require("express");//npm install express
var app=express();
var session=require("express-session");//npm install express-session
app.use(session({"secret":"wy"}));
var cookieParser =require('cookie-parser');//npm install cookie-parser
app.use(cookieParser());
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded());
var conn =require("./conn.js");//引入自定义模块
// 获取商品详细信息
app.post("/goodslist",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    conn.query('select * from goods',function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })

});
// 获取分类;
app.get("/brand",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    conn.query('select * from classify',function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })

});
// 删除分类
app.post("/classifyDelete",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var id=req.body.id;
    var username=req.body.username;
    var sql="delete from classify where id='"+id+"'";
    conn.query(sql,function(err,result){
        if(result.affectedRows==1){
            res.end('1');//删除成功
        }else if(result.affectedRows==0){
            res.end('0');//注册失败
        }
    })
});
// 更新分类
app.post("/classifyChange",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var id=req.body.id;
    var sql="update classify set brand='"+req.body.brand+"' where id='"+req.body.id+"'";
    conn.query(sql,function(err,result){
        if(result.affectedRows==1){
            res.end('1');//删除成功
        }else if(result.affectedRows==0){
            res.end('0');//注册失败
        }
    })

});
// 添加分类
app.post("/classifyAdd",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var sql = "insert into classify (brand) values ('"+req.body.classify+"')";
    conn.query(sql,function(err,result){
        if(result.affectedRows==1){
            res.end('1');//添加成功
        }else{
            res.end('0');//添加失败
        }
    })
});
// 精确查询商品信息
app.post("/goodsSelect",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body);
    if(req.body.user&&req.body.region){
        console.log('123')
        var sql="select * from goods where name like '%"+req.body.user+"%' and brand='"+req.body.region+"'"
    }else if(req.body.user==''){
        console.log('345')
        var sql="select * from goods where  brand='"+req.body.region+"'"
    }else if(req.body.region==''){
        console.log('456')
        var sql="select * from goods where  name like '%"+req.body.user+"%'"
    };
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })
});
// 管理员身份登录
app.post("/login",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body)
    var sql="select * from user where name='"+req.body.name+"' and password='"+req.body.password+"'"
    conn.query(sql,function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })
});
// 登录成功后再次获取个人详细信息作为资料修改
app.post("/detail",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body)
    var sql="select * from user where name='"+req.body.name+"'"
    conn.query(sql,function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })
});
// 获取用户详细信息
app.post("/info",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    conn.query('select * from user',function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })

});
// 修改用户信息
app.post("/userChange",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body);
    var sql="update user set nickname='"+req.body.nickname+"',gender='"+req.body.gender+"',tel='"+req.body.tel+
    "',role='"+req.body.role+"',mail='"+req.body.mail+"',remarks='"+req.body.remark+"' where name='"+req.body.name+"'";
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.affectedRows==1){
            res.end('1');//修改成功
        }else{
            res.end('error');//修改失败
        }
    })

});
// 删除用户
app.post("/userDelete",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var id=req.body.id;
    var username=req.body.username;
    var sql="delete from user where id='"+id+"'";
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.affectedRows==1){
            res.end('1');//删除成功
        }else if(result.affectedRows==0){
            res.end('0');//注册失败
        }
    })

});
// 删除多个用户信息
app.post("/userAllDelete",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body.id);
    var arr=req.body.id
    var res1='';
    for(let i=0;i<arr.length;i++){
        res1=res1+arr[i]+',';
    }
    console.log(res1.slice(0,-1));
    var sql = 'delete from user where id in ('+res1.slice(0,-1)+')';
        conn.query(sql,function(err,result){
            if(result.affectedRows===arr.length){
                 res.end('success');
            }else{
                res.end('error');
            }
        })
});
// 精确查询用户信息
app.post("/userSelect",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body);
    if(req.body.user&&req.body.tel){
        console.log('123')
        var sql="select * from user where name like '%"+req.body.user+"%' and role='"+req.body.region
        +"' and tel='"+req.body.tel+"'"
    }else if(req.body.user==''&&req.body.tel){
        console.log('345')
        var sql="select * from user where  role='"+req.body.region
        +"' and tel='"+req.body.tel+"'"
    }else if(req.body.tel==''&&req.body.user){
        console.log('456')
        var sql="select * from user where  name like '%"+req.body.user+"%' role='"+req.body.region
        +"'"
    }else if(req.body.user==''&&req.body.tel==''){
        var sql="select * from user where  role='"+req.body.region+"'"
    }
    conn.query(sql,function(err,result){
        if(result.length==0){
            res.end("error")
        }else{
            res.end(JSON.stringify(result))
        }
    })
});
// 删除多个商品
app.post("/goodsAllDelete",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var arr=req.body.id
    var res1='';
    for(let i=0;i<arr.length;i++){
        res1=res1+arr[i]+',';
    }
    console.log(res1.slice(0,-1));
    var sql = 'delete from goods where id in ('+res1.slice(0,-1)+')';
    conn.query(sql,function(err,result){
        if(result.affectedRows===arr.length){
             res.end('success');
        }else{
            res.end('error');
        }
    })
});
// 删除单个商品
app.post("/goodsDelete",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var id=req.body.id;
    var username=req.body.username;
    console.log(id,username);
    var sql="delete from goods where id='"+id+"'";
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.affectedRows==1){
            res.end('1');//删除成功
        }else if(result.affectedRows==0){
            res.end('0');//注册失败
        }
    })

});
// 添加用户
app.post("/userAdd",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    var info=req.body.user;
    var sql = "insert into user (name,mail,password,tel,role,audit) values ('"+info.name+"','"+info.mail+"','"+info.password
    +"','"+info.tel+"','"+info.role+"','"+info.region+"')";
    conn.query(sql,function(err,result){
        if(result.affectedRows==1){
            res.end('1');//添加成功
        }else{
            res.end('0');//添加失败
        }
    })
});
// 添加商品
app.post("/goodsAdd",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body)
    var sql = "insert into goods (name,price,sales,brand,hot) values ('"+req.body.name+"','"+req.body.price+"','"+req.body.date
    +"','"+req.body.region+"','"+req.body.lab+"')";
    conn.query(sql,function(err,result){
        if(result.affectedRows==1){
            res.end('1');//添加成功
        }else{
            res.end('0');//添加失败
        }
    })
});
// 修改密码
app.post("/change",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body)
    var username=req.body.name;
    var changePsw=req.body.changePsw;
    var sql="update user set password='"+changePsw.confirmPsw+"' where name='"+username+"' and password='"+changePsw.password+"'";
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.affectedRows==1){
            res.end('1');//修改成功
        }else{
            res.end('0');//修改失败
        }
    })
});
// 修改商品数据
app.post("/goodsChange",bodyParser.json(),function(req,res){
    res.writeHead(200,{
        'Content-Type':'text/html;charset=utf-8',
        'Access-Control-Allow-Origin':'*'
    })
    console.log(req.body);
    var form=req.body.form;
    var sql="update goods set name='"+form.name+"',price='"+form.price+"',sales='"+form.date+
    "',brand='"+form.region+"',hot='"+form.lab+"' where id='"+req.body.id+"'";
    conn.query(sql,function(err,result){
        console.log(result);
        if(result.affectedRows==1){
            res.end('1');//修改成功
        }else{
            res.end('0');//修改失败
        }  
    })
});
// 分页效果
app.post('/page',bodyParser.json(), function(req, res){
    console.log(req.body.page,req.body.num);
    var page=req.body.page;
    var num =req.body.num; 
    var start = (page - 1) * num;
    var sql = 'select count(*) from goods';
    var sql1 ='select * from goods limit ' + start + ','+num+''; 
    conn.query(sql,function(err,result){
        let allCount = result[0]['count(*)'];
        var allPage = Math.ceil(parseInt(allCount)/num);
        // var pageStr = allPage.toString();
       conn.query(sql1,function(err,results){
            if(results.length==0){
                res.end('error');
            }else{
                res.end(JSON.stringify(
                    {totalCount:allCount,totalPages:allPage,data:results}
                ));
            }
       })
    });  
});
app.listen(8888);