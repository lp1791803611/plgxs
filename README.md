项目用来学习java的相关知识  
使用IntelliJ IDEA工具进行构建，多模块Maven+Spring+SpringMVC+Mybatis 
### 项目结构
  plgxs  
  -- plgxs-parent　父模块,管理项目依赖  
  -- plgxs-common　公共模块，存放一些公共类  
  -- plgxs-app　　　接口模块（暂未使用）  
  -- plgxs-admin　　后台管理模块  
  ---- plgxs-admin-utils　　工具类模块  
  ---- plgxs-admin-model　　model层，存放实体类对象  
  ---- plgxs-admin-dao　　　dao层，mapper和mybatis  
  ---- plgxs-admin-service　service层，业务接口及实现，事务控制  
  ---- plgxs-admin-web　　　controller层  
    
### Spring SpringMVC Mybatis的配置文件  
  plgxs-admin-web下  
  1、src/main/resources  
  -config  
  ---db.properties 数据库配置  
  -mybatis  
  ---SqlMapConfig.xml mybatis配置+分页  
  -spring  
  ---applicationContext-dao.xml  
  ---applicationContext-service.xml  
  ---applicationContext-trans.xml  
  ---springmvc.xml  
  -generatorConfig.xml  
  2、src/main/webapp/WEB-INF  
  web.xml  
   
