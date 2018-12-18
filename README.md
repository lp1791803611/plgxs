### 2018年12月16日 19:22:36
项目用来学习java知识 

使用IntelliJ IDEA工具进行构建，多模块Maven+Spring+SpringMVC+Mybatis 

项目结构<br>
  plgxs<br>
  -- plgxs-parent　父模块,管理项目依赖<br>
  -- plgxs-common　公共模块，存放一些公共类<br>
  -- plgxs-app　　　接口模块（暂未使用）<br>
  -- plgxs-admin　　后台管理模块<br>
  ---- plgxs-admin-utils　　工具类模块<br>
  ---- plgxs-admin-model　　model层，存放实体类对象<br>
  ---- plgxs-admin-dao　　　dao层，mapper和mybatis<br>
  ---- plgxs-admin-service　service层，业务接口及实现，事务控制<br>
  ---- plgxs-admin-web　　　controller层<br>
  
### 2018年12月18日 14:03:30  
  1、配置Spring SpringMVC Mybatis  
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
  web.xml  
  2、添加js文件，包括jquery、easyui、layui、bootstrap  
