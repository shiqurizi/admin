import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
import index from '@/components/index'
import means from '@/components/means'
import list from '@/components/list'
import password from '@/components/password'
import classify from '@/components/classify'
import home from '@/components/home'
import user from '@/components/user'
import page404 from '@/components/page404'
Vue.use(Router)

let router= new Router({
  routes: [
    {
      path: '/index',
      name: 'Index',
      component: index,
      props:true
    },
    {
      path: '/home',
      name: 'Home',
      component: home,
      // 需要认证（登录）才运行进入路由
      meta: { requiresAuth: true },
      children:[
        {
          path: 'means',
          name: 'Means',
          component: means,
          props:true,
          meta: { requiresAuth: true },
        },
        {
          path: 'list',
          name: 'List',
          component:list,
          props:true,
          meta: { requiresAuth: true },
        },
        {
          path: 'password',
          name: 'Password',
          component: password,
          props:true,
          meta: { requiresAuth: true },
        },
        {
          path: 'classify',
          name: 'Classify',
          component: classify,
          props:true,
          meta: { requiresAuth: true },
        },
        {
          path: 'user',
          name: 'User',
          component: user,
          props:true,
          meta: { requiresAuth: true },
        }
      ],
      props:true
    },
    // 配置404页面，当页面发生异常时。可跳转到404页面
    {
      path:'*',
      redirect:{name:'page404'}
    }
  ]
});
// 路由拦截
// 导航卫士（钩子函数）
// 操作导航卫士时，路由处于暂停状态
router.beforeEach((to, from, next) => {
  // 需要登录才允许进入路由
  if(to.meta.requiresAuth){
  	// 判断是否登录
  	if(sessionStorage.getItem('name')){
  		next();
  	}else{
  		next({
  			path:'/index'
  		})
  	}
  }else{
	  // 调用next()方法，放行路由跳转
	  next();
  }
});

export default router;
