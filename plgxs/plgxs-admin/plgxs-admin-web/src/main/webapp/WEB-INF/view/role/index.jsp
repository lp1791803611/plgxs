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
    <title>角色管理</title>
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
                                <li class="breadcrumb-item active" aria-current="page">角色管理</li>
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
                            <h4 class="box-title">角色列表</h4>

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
                                    <button type="button" class="btn btn-default" onclick="assignMenu()">分配权限</button>
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
    <!-- roleModal -->
    <div id="roleModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <form id="roleForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">角色信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" style="display:none" id="id" name="id">
                                        <div class="form-group">
                                            <h5>角色名称 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="roleName" id="roleName" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>角色编码 </h5>
                                            <div class="controls">
                                                <input type="text" name="roleCode" id="roleCode" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>优先级(1-10) <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="priority" id="priority" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>备注 </h5>
                                            <div class="controls">
                                                <textarea name="remark" id="remark" class="form-control"></textarea>
                                            </div>
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

    <!-- menuModal -->
    <div id="menuModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <form id="menuForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">分配菜单</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <h5>菜单列表 </h5>
                                            <div id="tree" class="form-control"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-bold btn-pure btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" onclick="saveMenu()" class="btn btn-bold btn-pure btn-primary float-right">Save</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </form>
            <!-- /.form -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!-- promptModal -->
    <!-- data-backdrop="false"去除遮罩层 -->
    <div class="modal modal-info fade bs-example-modal-sm"  id="promptModal" role="dialog" data-backdrop="false"  aria-labelledby="mySmallModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center;">
                    <span id="promptContent">操作成功</span>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <!--/ modal Area -->

    <!-- foot -->
    <%@include file="../foot.jsp" %>
</div>
<!-- 引入公共js -->
<%@include file="../javascript.jsp" %>

<script type="text/javascript">
    // 生成角色数据
    $('#mytab').bootstrapTable({
        method: 'post',
        contentType: "application/json",// 必须要有！！！！
        url: "${contextPath }/role/queryList",// 要请求数据的文件路径
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
                title: '角色名称',
                field: 'roleName'
            }, {
                title: '角色代码',
                field: 'roleCode'
            },{
                title: '优先级',
                field: 'priority'
            },{
                title: '备注',
                field: 'remark'
            },{
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
                title: '创建时间',
                field: 'createTime'
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
            // 分种类初始化
            $("[name='my-checkbox1']").bootstrapSwitch({
                onText:"启用",
                offText:"冻结",
                onColor:"success",
                offColor:"danger",
                size:"small",
                onSwitchChange:function(event,state){
                    var id=this.value;
                    if(state==true){
                        $.ajax({
                            url: "${contextPath}/role/" + id + "/switchState",
                            type: "GET",
                            data: {"state":0},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                if(data.code == '00000'){
                                    prompt("操作成功！");
                                }else{
                                    prompt("操作失败！");
                                }
                            }
                        });
                    }else{
                        $.ajax({
                            url: "${contextPath}/role/" + id + "/switchState",
                            type: "GET",
                            data: {"state":1},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                if(data.code == '00000'){
                                    prompt("操作成功！");
                                }else{
                                    prompt("操作失败！");
                                }
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
                    var id = this.value;
                    if (state == true) {
                        $.ajax({
                            url: "${contextPath}/role/" + id + "/switchState",
                            type: "GET",
                            data: {"state":0},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                if(data.code == '00000'){
                                    prompt("操作成功！");
                                }else{
                                    prompt("操作失败！");
                                }
                            }
                        });
                    } else {
                        $.ajax({
                            url: "${contextPath}/role/" + id + "/switchState",
                            type: "GET",
                            data: {"state":1},
                            dataType: "json",
                            contentType: "application/json",
                            success: function(data){
                                if(data.code == '00000'){
                                    prompt("操作成功！");
                                }else{
                                    prompt("操作失败！");
                                }
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
        cleanFormData($('#roleModal'));
        // 清楚验证
        $("#roleForm").validate().resetForm();
        // 打开modal
        $("#roleModal").modal();
    }
    // edit
    function edit() {
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            // 清楚数据
            cleanFormData($('#roleModal'));
            // 清楚验证
            $("#roleForm").validate().resetForm();

            $.ajax({
                url:"${contextPath}/role/queryById/" + selRow[0].id,
                type:"GET",
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    $("#id").val(data.id);
                    $("#roleName").val(data.roleName);
                    $("#priority").val(data.priority);
                    $("#roleCode").val(data.roleCode);
                    $("#remark").val(data.remark);
                    $("#roleModal").modal();
                }
            });
        }else{
            alert("请选择一条数据进行编辑");
        }
    }

    // 表单验证
    function validateForm(){
        return $("#roleForm").validate({
            rules: {
                roleName: {
                    required: true,
                    rangelength: [2,20]
                },
                roleCode: {
                    required: true,
                    rangelength: [2,30]
                },
                priority: {
                    required: true,
                    digits: true,
                    range: [1,10]
                }

            },
            messages: {
                roleName: {
                    required: "请输入角色名称",
                    rangelength: "长度介于 2-20 个字符"
                },
                roleCode: {
                    required: "请输入角色编码",
                    rangelength: "长度介于 2-30 个字符"
                },
                priority: {
                    required: "请输入优先级",
                    digits: "请填写数字",
                    range: "数字长度介于1-10之间"
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
                url:"${contextPath}/role/saveRole",
                type:"POST",
                data:JSON.stringify($('#roleForm').serializeObject()),
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    if(data.code == "00000"){
                        alert("保存成功！");
                        $("#roleModal").modal('toggle');
                        $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
                    }else{
                        alert(data.message);
                    }
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
            if(confirm("确认要删除该角色吗？")){
                $.ajax({
                    url:"${contextPath}/role/deleteRoleById/" + selRow[0].id,
                    type:"GET",
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data){
                        if(data.code == "00000"){
                            prompt("删除成功");
                            $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
                        }else{
                            prompt(data.message);
                        }
                    }
                });
            }
        }else{
            alert("请选择一条数据进行删除");
        }
    }

    // 分配权限
    function assignMenu(){
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            // 初始化树形菜单
            $.ajax({
                type:"post",
                url:"${contextPath }/menu/"+selRow[0].id+"/getMenuTree",
                contentType:"application/json",
                dataType: "json",
                async:false,
                success:function (result) {
                    $('#tree').treeview({
                        data: result.data, // 获取数据节点
                        showCheckbox: true,   //是否显示复选框
                        highlightSelected: true,    //是否高亮选中
                        multiSelect: true,    //多选
                        levels : 3,
                        color: "#010A0E",
                        onNodeChecked: function (event,data) {
                            //选中父节点，则自动选择子节点
                            if(data.nodes != null){
                                var arrayInfo = data.nodes;
                                for (var i = 0; i < arrayInfo.length; i++) {
                                    $('#tree').treeview('checkNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                                }
                            }
                        },
                        onNodeUnchecked: function (event, data) {
                            //取消选中父节点，则自动取消选择子节点
                            if(data.nodes != null){
                                var arrayInfo = data.nodes;
                                for (var i = 0; i < arrayInfo.length; i++) {
                                    $('#tree').treeview('uncheckNode', [ arrayInfo[i].nodeId, { silent: true } ]);
                                }
                            }
                        }
                    });
                },
                error:function () {
                    prompt("系统错误！");
                }
            });
            $("#menuModal").modal();
        }else{
            alert("请选择一条数据");
        }
    }

    function saveMenu(){
        var selRow = $("#mytab").bootstrapTable('getSelections');
        var menus = $('#tree').treeview('getChecked');
        var menuIds = "";
        if(menus != null && menus.length > 0){
            for(var i=0;i<menus.length;i++){
                menuIds += menus[i].id + ",";
            }
        }
        $.ajax({
            url:"${contextPath}/menu/"+selRow[0].id+"/saveRoleMenu",
            type:"POST",
            data:JSON.stringify(menuIds),
            contentType:"application/json",
            dataType:"json",
            success:function(){
                alert("成功");
                $("#menuModal").modal('toggle');
                $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
            }
        });
    }
</script>
</body>
</html>
