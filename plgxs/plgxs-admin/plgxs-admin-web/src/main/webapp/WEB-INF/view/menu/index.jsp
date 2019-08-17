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
    <title>菜单管理</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- Heade Navbar, Control Sidebar-->
    <%@include file="../head.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@include file="../left.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- left content -->
        <section class="left-block content fixed-left-block">
            <div class="scrollable" style="height: 100%;">
                <div class="left-content-area" id="tree">

                </div>
            </div>
        </section>
        <!-- /.left content -->
        <!-- right content -->
        <section class="right-block content">
            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">系统管理</h3>
                    <div class="d-inline-block align-items-center">
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="${contextPath}/index">
                                        <i class="mdi mdi-home-outline"></i>
                                    </a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">菜单管理</li>
                            </ol>
                        </nav>
                    </div>
                    <ul class="box-controls pull-right">
                        <li><a class="box-btn-close" href="#"></a></li>
                        <li><a class="box-btn-slide" href="#"></a></li>
                        <li><a class="box-btn-fullscreen" href="#"></a></li>
                    </ul>
                </div>
                <div class="box-body">
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
                            </div>
                            <table id="mytab" class="table table-bordered table-nowrap table-hover table-striped"></table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box -->
        </section>
        <!-- /.right content -->
    </div>
    <!-- menuModal -->
    <div id="menuModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <form id="menuForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">菜单信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" style="display:none" id="id" name="id">
                                        <input type="hidden" id="parentId" name="parentId">
                                        <div class="form-group">
                                            <h5>菜单名称 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="menuName" id="menuName" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>菜单类型 </h5>
                                            <div class="controls">
                                                <select name="type" id="type" class="form-control">
                                                    <option value="0">菜单</option>
                                                    <option value="1">按钮</option>
                                                </select> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>菜单url <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="menuUrl" id="menuUrl" class="form-control">
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
    $(function(){
        initTree(0);
        initTable(0);
    });

    // 初始化树形菜单
    function initTree(nodeId){
        $.ajax({
            type:"post",
            url:"${contextPath }/menu/getTree",
            contentType:"application/json",
            dataType: "json",
            sync:false,
            success:function (result) {
                $('#tree').treeview({
                    data: result, // 获取数据节点
                    showCheckbox: false,   //是否显示复选框
                    highlightSelected: true,    //是否高亮选中
                    multiSelect: false,    //多选
                    levels : 3,
                    color: "#010A0E",
                    onNodeSelected : function (event,data) {
                        initTable(data.id);
                        $("#parentId").val(data.nodeId);
                    },
                });
                if(nodeId > 0){
                    $('#tree').treeview('selectNode', [ nodeId, { silent: true } ]);
                }
            },
            error:function () {
                prompt("系统错误！");
            }
        });

    }

    // 初始化表格
    function initTable(pid){
        $('#mytab').bootstrapTable("destroy");
        // 生成用户数据
        $('#mytab').bootstrapTable({
            method: 'post',
            contentType: "application/json",// 必须要有！！！！
            url: "${contextPath }/menu/"+ pid +"/queryList",// 要请求数据的文件路径
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
                    title: '菜单名称',
                    field: 'menuName'
                }, {
                    title: 'url',
                    field: 'menuUrl'
                }, {
                    title: '排序',
                    field: 'orderNumber'
                }, {
                    title: '类型',
                    field: 'type',
                    formatter: typeFormatter
                }, {
                    title: '创建时间',
                    field: 'createTime'
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
                                url: "${contextPath}/menu/" + id + "/switchState",
                                type: "GET",
                                data: {"state":0},
                                dataType: "json",
                                contentType: "application/json",
                                success: function(data){
                                    var msg = "操作失败！";
                                    if(data.code == '00000'){
                                        msg = "操作成功！";
                                    }
                                    prompt(msg);
                                    initTree(parseInt($("#parentId").val()));
                                }
                            });
                        }else{
                            $.ajax({
                                url: "${contextPath}/menu/" + id + "/switchState",
                                type: "GET",
                                data: {"state":1},
                                dataType: "json",
                                contentType: "application/json",
                                success: function(data){
                                    var msg = "操作失败！";
                                    if(data.code == '00000'){
                                        msg = "操作成功！";
                                    }
                                    prompt(msg);
                                    initTree(parseInt($("#parentId").val()));
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
                                url: "${contextPath}/menu/" + id + "/switchState",
                                type: "GET",
                                data: {"state":0},
                                dataType: "json",
                                contentType: "application/json",
                                success: function(data){
                                    var msg = "操作失败！";
                                    if(data.code == '00000'){
                                        msg = "操作成功！";
                                    }
                                    prompt(msg);
                                    initTree(parseInt($("#parentId").val()));
                                }
                            });
                        } else {
                            $.ajax({
                                url: "${contextPath}/menu/" + id + "/switchState",
                                type: "GET",
                                data: {"state":1},
                                dataType: "json",
                                contentType: "application/json",
                                success: function(data){
                                    var msg = "操作失败！";
                                    if(data.code == '00000'){
                                        msg = "操作成功！";
                                    }
                                    prompt(msg);
                                    initTree(parseInt($("#parentId").val()));
                                }
                            });
                        }
                    },
                });
            }
        });
    }

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

    // 类型
    function typeFormatter(type) {
        if (type == 1) {
            return "按钮";
        } else if (type == 0) {
            return "菜单";
        } else {
            return "其他";
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
        cleanFormData($('#menuModal'));
        // 清楚验证
        $("#menuForm").validate().resetForm();
        // 打开modal
        $("#menuModal").modal();
    }
    // edit
    function edit() {
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            // 清楚数据
            cleanFormData($('#menuModal'));
            // 清楚验证
            $("#menuForm").validate().resetForm();

            $.ajax({
                url:"${contextPath}/menu/queryById/" + selRow[0].id,
                type:"GET",
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    $("#id").val(data.id);
                    $("#menuName").val(data.menuName);
                    $("#type").val(data.type);
                    $("#menuUrl").val(data.menuUrl);
                    $("#menuModal").modal();
                }
            });
        }else{
            alert("请选择一条数据进行编辑");
        }
    }

    // 表单验证
    function validateForm(){
        return $("#menuForm").validate({
            rules: {
                menuName: {
                    required: true,
                    rangelength: [1,50]
                },
                type: "required",
                menuUrl: {
                    required: true,
                    rangelength: [1,100]
                }
            },
            messages: {
                menuName: {
                    required: "请输入菜单名称",
                    rangelength: "菜单名称长度介于 1-50 个字符"
                },
                type: "请选择菜单类型",
                menuUrl: {
                    required: "请输入Url",
                    rangelength: "Url长度介于 1-100 个字符"
                }
            }
        });
    }
    // 注册表单验证
    $(validateForm());
    // save
    function save() {
        if(validateForm().form()){
            var node = $('#tree').treeview('getNode', $("#parentId").val());
            $.ajax({
                url:"${contextPath}/menu/saveMenu",
                type:"POST",
                data:JSON.stringify({
                    "menuName":$("#menuName").val(),
                    "type":$("#type").val(),
                    "menuUrl":$("#menuUrl").val(),
                    "parentId":node.id
                }),
                contentType:"application/json",
                dataType:"json",
                success:function(){
                    alert("成功");
                    $("#menuModal").modal('toggle');
                    initTree(parseInt($("#parentId").val()));
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
            if(confirm("确认要删除该菜单吗？")){
                $.ajax({
                    url:"${contextPath}/menu/deleteById/" + selRow[0].id,
                    type:"GET",
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data){
                        prompt("删除成功");
                        $('#mytab').bootstrapTable('refreshOptions',{pageNumber:1,pageSize:10});
                        initTree(parseInt($("#parentId").val()));
                    }
                });
            }
        }else{
            alert("请选择一条数据进行删除");
        }
    }

</script>
</body>
</html>
