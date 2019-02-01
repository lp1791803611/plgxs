<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${contextPath}/images/favicon.ico">
    <title>用户管理</title>		
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Heade Navbar, Control Sidebar-->
    <%@include file="../head.jsp"%>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="../left.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div>

        </div>
        <table id="mytab" class="table table-bordered table-nowrap table-hover table-striped"></table>
    </div>
    <!-- foot -->
    <%@include file="../foot.jsp"%>
</div>
<!-- 引入公共js -->
<%@include file="../javascript.jsp"%>
<script type="text/javascript">
	//生成用户数据
	$('#mytab').bootstrapTable({
	    method: 'post',
	    contentType: "application/json",//必须要有！！！！
	    url:"${contextPath }/user/queryList",//要请求数据的文件路径
	    //height:tableHeight(),//高度调整
	    toolbar: '#toolbar',//指定工具栏
	    striped: true, //是否显示行间隔色
	    pagination:true,//是否分页
	    queryParamsType:'limit',//查询参数组织方式
	    queryParams:queryParams,//请求服务器时所传的参数
	    sidePagination:'server',//指定服务器端分页
	    pageNumber: 1, //初始化加载第一页，默认第一页
	    pageSize:10,//单页记录数
	    pageList:[10, 20, 50, 100],//分页步进值
	    showRefresh:false,//刷新按钮
	    showColumns:false,//是否显示 内容列下拉框
	    clickToSelect: true,//是否启用点击选中行
	    toolbarAlign:'right',//工具栏对齐方式
	    buttonsAlign:'right',//按钮对齐方式   	    
	    columns:[
	        {
	        	checkbox:true,	        	
	        },{
	            title:'No',
	            field:'id',
	            formatter:orderNumber
	        },{
	            title:'用户名',
	            field:'username'
	        },{
	            title:'手机号',
	            field:'mobile'
	        },{
	            title:'邮箱',
	            field:'email'
	        },{
	            title:'性别',
	            field:'gender',
                formatter:genderFormatter
	        },{
	            title:'状态',
	            field:'status',
	            formatter:statusFormatter
	        },{
	            title:'最后登录时间',
	            field:'lastLoginTime'
	        }
	    ],
	    responseHandler:function(res) { 
	    	p = res.page;
	    	s = res.pageSize;
	    	return res;
	    },
	    onClickRow: function (row, $element) { 	    	
	    	//changeFixedTable(row, $element[0])
	    }
	});

    //请求服务数据时所传参数
    function queryParams(params){
        var result = {
            pageSize:params.limit,
            page:Math.ceil(params.offset / params.limit) + 1
        };
        return result;
    }

    //回车
    function EnterPress(e){ //传入 event
        var e = e || window.event;
        if(e.keyCode == 13){
            selectByKeyWord();
        }
    }
    //change and search event
    function selectByKeyWord(){
        $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
    }

    var p = 1;
    var s = 10;
    // 计数
    function orderNumber(value,row,index){
        var result = "";
        result += (p*s-s+index+1);
        return result;
    }

	// 性别
    function genderFormatter(gender){
		if(gender == 1){
			return "男";
		}else if(gender == 2){
			return "女";
		}else{
			return "保密";
		}	
	}
	
	// 用户状态
	function statusFormatter(state){
		if(state == 0){
			return "正常";
		}else if(state == 1){
			return "冻结";
		}
	}

</script>
</body>
</html>
