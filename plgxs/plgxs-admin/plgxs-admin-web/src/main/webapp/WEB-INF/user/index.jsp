<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <%@include file="../head.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="../left.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <div class="content-header">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="page-title">系统管理</h3>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="${contextPath}/index">
                                        <i class="mdi mdi-home-outline"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">用户管理</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="right-title w-170">
				<span class="subheader_daterange font-weight-600" id="dashboard_daterangepicker">
					<span class="subheader_daterange-label">
						<span class="subheader_daterange-title"></span>
						<span class="subheader_daterange-date text-primary"></span>
					</span>
					<a href="#" class="btn btn-sm btn-primary">
						<i class="fa fa-angle-down"></i>
					</a>
				</span>
                </div>
            </div>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">用户列表</h4>

                            <ul class="box-controls pull-right">
                                <li><a class="box-btn-close" href="#"></a></li>
                                <li><a class="box-btn-slide" href="#"></a></li>
                                <li><a class="box-btn-fullscreen" href="#"></a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <div class="table-responsive">
                                <div id="mysearch" class="box-controls pull-right" style="padding-bottom:10px;flex-direction:row;">
                                    <input id="queryKey" name="lookupType" placeholder='Search & Enter' type="text"
                                           style="float:left;width:150px;margin-right:5px;" class="form-control" onkeypress="EnterPress(event)">
                                    <button onclick="customSearch()" type="button" class="btn btn-primary btn-space">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </button>
                                    <button onclick="resetSearch()" type="button" class="btn btn-default btn-space">
                                        <i class="fa fa-refresh" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <div id="toolbar">
                                    <button type="button" class="btn btn-default" onclick="add()"><span class="glyphicon glyphicon-plus"></span></button>
                                    <button type="button" class="btn btn-default" onclick="edit()"><span class="glyphicon glyphicon-pencil"></span></button>
                                    <button type="button" class="btn btn-default" onclick="remove()"><span class="glyphicon glyphicon-remove"></span></button>
                                    <button type="button" class="btn btn-default" onclick="excel()"><span class="glyphicon glyphicon-download-alt"></span></button>
                                </div>
                                <table id="mytab" class="table table-bordered table-nowrap table-hover table-striped"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- modal -->
    <div id="userModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <form id="userForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">用户信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-12">
                                        <input type="hidden" id="id" >
                                        <div class="form-group">
                                            <h5>用户名 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="username" id="username" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>手机 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="mobile" id="mobile" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>邮箱 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="email" name="email" id="email" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>密码 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="password" name="password" id="password" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>重复密码 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="password" name="confirm_password" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>昵称 </h5>
                                            <div class="controls">
                                                <input type="nickname" name="nickname" id="nickname" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>性别 </h5>
                                            <div class="controls">
                                                <select name="gender" id="gender" class="form-control">
                                                    <option value="0">保密</option>
                                                    <option value="1">男</option>
                                                    <option value="2">女</option>
                                                </select> </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-bold btn-pure btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="save()" class="btn btn-bold btn-pure btn-primary float-right">Save</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </form>
            <!-- /.form -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- data-backdrop="false"去除遮罩层  -->
    <div class="modal fade bd-example-modal-sm"  id="promptModal" role="dialog" data-backdrop="false"  aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <p class="text-center mb-0">
                    <i class="fa fa-check-circle text-success mr-1" aria-hidden="true"></i>
                    <span id="promptContent">操作成功</span>
                </p>
            </div>
        </div>
    </div>

    <!-- foot -->
    <%@include file="../foot.jsp" %>
</div>
<!-- 引入公共js -->
<%@include file="../javascript.jsp" %>
<script type="text/javascript">
    // 生成用户数据
    $('#mytab').bootstrapTable({
        method: 'post',
        contentType: "application/json",// 必须要有！！！！
        url: "${contextPath }/user/queryList",// 要请求数据的文件路径
        //height:tableHeight(),// 高度调整
        toolbar: '#toolbar',// 指定工具栏
        striped: true, // 是否显示行间隔色
        pagination: true,// 是否分页
        queryParamsType: 'limit',// 查询参数组织方式
        queryParams: queryParams,// 请求服务器时所传的参数
        sidePagination: 'server',// 指定服务器端分页
        pageNumber: 1, // 初始化加载第一页，默认第一页
        pageSize: 10,// 单页记录数
        pageList: [10, 20, 50, 100],// 分页步进值
        showRefresh: false,// 刷新按钮
        showColumns: false,// 是否显示 内容列下拉框
        clickToSelect: true,// 是否启用点击选中行
        toolbarAlign: 'left',// 工具栏对齐方式
        buttonsAlign: 'left',// 按钮对齐方式
        columns: [
            {
                checkbox: true
            }, {
                title: '#',
                field: 'id',
                formatter: orderNumber
            }, {
                title: '用户名',
                field: 'username'
            }, {
                title: '手机号',
                field: 'mobile'
            }, {
                title: '邮箱',
                field: 'email'
            }, {
                title: '性别',
                field: 'gender',
                formatter: genderFormatter
            }, {
                title: '状态',
                field: 'status',
                formatter: function(value,row,index){
                    var id = row.id;
                    if(value == 0){
                        return '<input value="' + id + '" type="checkbox" name="my-checkbox1" checked/>';
                    }else{
                        return '<input value="' + id + '" type="checkbox" name="my-checkbox2" />';
                    }
                }
            }, {
                title: '最后登录时间',
                field: 'lastLoginTime'
            }
        ],
        responseHandler: function (res) {
            p = res.page;
            s = res.pageSize;
            return res;
        },
        onClickRow: function (row, $element) {
            // changeFixedTable(row, $element[0])
        },
        onLoadSuccess:function(){
            $("[name='my-checkbox1']").bootstrapSwitch({//分种类初始化
                onText:"启用",
                offText:"冻结",
                onColor:"success",
                offColor:"danger",
                size:"small",
                onSwitchChange:function(event,state){
                    console.log(this);
                    var id=this.value;
                    if(state==true){
                        $.ajax({
                            url: "${contextPath}/user/" + id + "/switchState",
                            type: "GET",
                            data: {"state":0},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                var msg = "操作失败！";
                                if(data.code == '00000'){
                                    msg = "操作成功！";
                                }
                                prompt("操作成功！");
                            }
                        });
                    }else{
                        $.ajax({
                            url: "${contextPath}/user/" + id + "/switchState",
                            type: "GET",
                            data: {"state":1},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                var msg = "操作失败！";
                                if(data.code == '00000'){
                                    msg = "操作成功！";
                                }
                                prompt("操作成功！");
                            }
                        });
                    }
                }
            });

            $("[name='my-checkbox2']").bootstrapSwitch({
                onText:"启用",
                offText:"冻结",
                onColor: "success",
                offColor: "danger",
                size: "small",
                onSwitchChange: function (event, state) {
                    console.log(this);
                    var id = this.value;
                    if (state == true) {
                        $.ajax({
                            url: "${contextPath}/user/" + id + "/switchState",
                            type: "GET",
                            data: {"state":0},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                var msg = "操作失败！";
                                if(data.code == '00000'){
                                    msg = "操作成功！";
                                }
                                prompt("操作成功！");
                            }
                        });
                    } else {
                        $.ajax({
                            url: "${contextPath}/user/" + id + "/switchState",
                            type: "GET",
                            data: {"state":1},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                var msg = "操作失败！";
                                if(data.code == '00000'){
                                    msg = "操作成功！";
                                }
                                prompt("操作成功！");
                            }
                        });
                    }
                },
            });
        }
    });

    // 请求服务数据时所传参数
    function queryParams(params) {
        var result = {
            pageSize: params.limit,
            page: Math.ceil(params.offset / params.limit) + 1,
            queryKey: $('#queryKey').val()
        };
        return result;
    }

    // 自定义查询
    function customSearch() {
        $('#mytab').bootstrapTable('refreshOptions', {pageNumber: 1, pageSize: 10});
    }

    // 回车事件
    function EnterPress(e) {
        var e = e || window.event;
        if (e.keyCode == 13) {
            customSearch();
        }
    }

    // 重置
    function resetSearch(){
        // 迭代清空
        cleanFormData($('#mysearch'));
        // 重置后查询
        customSearch();
    }

    var p = 1;
    var s = 10;

    // 计数
    function orderNumber(value, row, index) {
        var result = "";
        result += (p * s - s + index + 1);
        return result;
    }

    // 性别
    function genderFormatter(gender) {
        if (gender == 1) {
            return "男";
        } else if (gender == 2) {
            return "女";
        } else {
            return "保密";
        }
    }

    // 用户状态
    function statusFormatter(state) {
        if (state == 0) {
            return "正常";
        } else if (state == 1) {
            return "冻结";
        }
    }
</script>

<script type="text/javascript">
    // 清除数据
    function cleanFormData(form) {
        // 迭代清空
        $(':input', form).each(function() {
            var type = this.type;
            var tag = this.tagName.toLowerCase(); // normalize case
            if (type == 'text' || type == 'password' || tag == 'textarea'){
                this.value = "";
            }
            //  跌代多选checkboxes
            else if (type == 'checkbox' || type == 'radio'){
                this.checked = false;
            }
            //  select 迭代下拉框
            else if (tag == 'select'){
                // this.selectedIndex = -1;
                this.selectedIndex = 0;
            }
        });
    }
    // add
    function add() {
        // 清楚数据
        cleanFormData($('#userModal'));
        // 清楚验证
        $("#userForm").validate().resetForm();
        // 打开modal
        $("#userModal").modal();
    }
    // edit
    function edit() {
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            // 清楚数据
            cleanFormData($('#userModal'));
            // 清楚验证
            $("#userForm").validate().resetForm();

            $.ajax({
                url:"${contextPath}/user/queryById/" + selRow[0].id,
                type:"GET",
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    $("#id").val(data.id);
                    $("#username").val(data.username);
                    $("#mobile").val(data.mobile);
                    $("#email").val(data.email);
                    $("#nickname").val(data.nickname);
                    $("#gender").val(data.gender);
                    $("#userModal").modal();
                }
            });
        }else{
            alert("请选择一条数据进行编辑");
        }
    }

    // 表单验证
    function validateForm(){
        return $("#userForm").validate({
            rules: {
                username: {
                    required: true,
                    rangelength: [6,20]
                },
                mobile: "required",
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    rangelength: [6,20]
                },
                confirm_password: {
                    required: true,
                    equalTo: "#password"
                }
            },
            messages: {
                username: {
                    required: "请输入用户名",
                    rangelength: "用户名长度介于 6-20 个字符"
                },
                mobile: "请输入一个正确的手机号",
                email: "请输入一个正确的邮箱",
                password: {
                    required: "请输入密码",
                    rangelength: "密码长度介于 6-20 个字符"
                },
                confirm_password: {
                    required: "请输入密码",
                    equalTo: "两次密码输入不一致"
                }
            }
        });
    }
    // 注册表单验证
    $(validateForm());
    // save
    function save() {
        if(validateForm().form()){
            $.ajax({
                url:"${contextPath}/user/saveUser",
                type:"POST",
                data:JSON.stringify($('#userForm').serializeObject()),
                contentType:"application/json",
                success:function(){
                    alert("成功");
                    $("#userModal").modal('toggle');
                    $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
                }
            });
        }else{
            return ;
        }
    }

    // 提示信息
    function prompt(value){
        $("#promptContent").html(value);
        $('#promptModal').modal('show');
        setTimeout(function(){
            $("#promptModal").modal("hide")
        },1000);
    }

    // remove
    function remove(){
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            if(confirm("确认要删除该用户吗？")){
                $.ajax({
                    url:"${contextPath}/user/deleteUserById/" + selRow[0].id,
                    type:"GET",
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data){
                        prompt("删除成功");
                        $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
                    }
                });
            }
        }else{
            alert("请选择一条数据进行删除");
        }
    }

    // excel
    function excel() {
        var queryKey = $('#queryKey').val();
        window.location.href="${contextPath}/user/exportExcel?queryKey=" + queryKey;
    }

</script>
</body>
</html>
