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
    <!-- layui -->
    <link rel="stylesheet" href="${contextPath}/assets/vendor_components/layui/css/layui.css">
    <link rel="stylesheet" href="${contextPath}/assets/vendor_components/jquery-ztree/css/cyType.css">
    <link rel="stylesheet" href="${contextPath}/assets/vendor_components/jquery-ztree/css/cyStyle.css">
    <link rel="stylesheet" href="${contextPath}/assets/vendor_components/jquery-ztree/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/vendor_components/jquery-ztree/css/zTreeStyle/zTreeStyle.css">

    <title>部门管理</title>
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
                                <li class="breadcrumb-item active" aria-current="page">部门管理</li>
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
                            <h4 class="box-title">部门列表</h4>

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
    <!-- deptModal -->
    <div id="deptModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <form id="deptForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">部门信息</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col-12">
                                        <input type="text" style="display:none" id="id" name="id">
                                        <div class="form-group">
                                            <h5>上级部门 <span class="text-danger">*</span></h5>
                                            <div class="controls" id="tree">
                                                <div cyType="dropDownTool" cyProps="url:'${contextPath }/dept/getDeptTreeViewData',search:'true',checkbox:'false'"
                                                     name="parentId" value="" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>部门名称 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="deptName" id="deptName" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>部门代码 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="deptCode" id="deptCode" class="form-control"> </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>排序号 <span class="text-danger">*</span></h5>
                                            <div class="controls">
                                                <input type="text" name="seq" id="seq" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <h5>状态 </h5>
                                            <div class="controls">
                                                <input type="checkbox" name="status" id="status"
                                                       data-on-text="启用" data-off-text="冻结" data-on-color="success" data-off-color="danger"/>
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

<script src="${contextPath}/assets/vendor_components/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/vendor_components/jquery-ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="${contextPath}/assets/js/utils.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/js/dropDownTool.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    var $table = $('#mytab');
    // 生成角色数据
    $table.bootstrapTable({
        idField: 'id',
        method: 'post',
        contentType: "application/json",// 必须要有！！！！
        dataType: "json",
        url: "${contextPath }/dept/deptTree",// 要请求数据的文件路径
        toolbar: '#toolbar',// 指定工具栏
        striped: true, // 是否显示行间隔色
        queryParamsType: 'limit',// 查询参数组织方式
        queryParams: queryParams,// 请求服务器时所传的参数
        sidePagination: 'server',// 指定服务器端分页
        showRefresh: false,// 刷新按钮
        showColumns: true,// 是否显示 内容列下拉框
        toolbarAlign: 'left',// 工具栏对齐方式
        buttonsAlign: 'left',// 按钮对齐方式
        columns: [
            {
                field: 'ck',
                checkbox: true
            }, {
                title: '部门名称',
                field: 'name'
            }, {
                title: '部门代码',
                field: 'deptCode'
            }, {
                title: '状态',
                field: 'status',
                formatter:function(value,row,index){
                    var id = row.id;
                    if(value == 0){
                        return '<input value="' + id + '" type="checkbox" name="my-checkbox1" checked/>';
                    }else{
                        return '<input value="' + id + '" type="checkbox" name="my-checkbox2" />';
                    }
                }
            }
        ],
        //在哪一列展开树形
        treeShowField: 'name',
        //指定父id列
        parentIdField: 'pid',

        onLoadSuccess: function(data) {
            $table.treegrid({
                initialState: 'collapsed',// 所有节点都折叠
                // initialState: 'expanded',// 所有节点都展开，默认展开
                treeColumn: 1,
                expanderExpandedClass: 'glyphicon glyphicon-minus',  //图标样式
                expanderCollapsedClass: 'glyphicon glyphicon-plus',
                onChange: function() {
                    $table.bootstrapTable('resetWidth');
                }
            });
            //只展开树形的第一级节点
            $table.treegrid('getRootNodes').treegrid('expand');
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
                            url: "${contextPath}/dept/" + id + "/switchState",
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
                            url: "${contextPath}/dept/" + id + "/switchState",
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
                            url: "${contextPath}/dept/" + id + "/switchState",
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
                            url: "${contextPath}/dept/" + id + "/switchState",
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

    function queryParams(params) {
        var result = {
            queryKey: $('#queryKey').val()
        };
        return result;
    }

    // 自定义查询
    function customSearch() {
        $('#mytab').bootstrapTable('refreshOptions', {});
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
        cleanFormData($('#deptModal'));
        // 清楚验证
        $("#deptForm").validate().resetForm();
        // 打开modal
        $("#deptModal").modal();
    }
    // edit
    function edit() {
        var selRow = $("#mytab").bootstrapTable('getSelections');
        if(selRow.length == 1){
            // 清楚数据
            cleanFormData($('#deptModal'));
            // 清楚验证
            $("#deptForm").validate().resetForm();

            $.ajax({
                url:"${contextPath}/dept/queryById/" + selRow[0].id,
                type:"GET",
                dataType:"json",
                contentType:"application/json",
                async: false,
                success:function(res){
                    $("#id").val(res.id);
                    $("#deptName").val(res.deptName);
                    $("#deptCode").val(res.deptCode);
                    $("#seq").val(res.seq);
                    $("#status").val(res.status);
                    $("div[name='parentId']").attr('value',res.parentId);
                    $($("[cyType='dropDownTool']")[0]).dropDownTool();
                    $("#deptModal").modal();
                }
            });
        }else{
            alert("请选择一条数据进行编辑");
        }
    }

    // 表单验证
    function validateForm(){
        return $("#deptForm").validate({
            rules: {
                deptName: {
                    required: true,
                    rangelength: [2,20]
                },
                deptCode: {
                    required: true,
                    rangelength: [2,30]
                },
                seq: {
                    required: true,
                    digits: true,
                    range: [1,100]
                }

            },
            messages: {
                deptName: {
                    required: "请输入部门名称",
                    rangelength: "长度介于 2-20 个字符"
                },
                deptCode: {
                    required: "请输入部门编码",
                    rangelength: "长度介于 2-30 个字符"
                },
                seq: {
                    required: "请输入优先级",
                    digits: "请填写数字",
                    range: "数字长度介于1-100之间"
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
                url:"${contextPath}/dept/saveDept",
                type:"POST",
                data:JSON.stringify($('#deptForm').serializeObject()),
                dataType:"json",
                contentType:"application/json",
                success:function(data){
                    if(data.code == "00000"){
                        alert("保存成功！");
                        $("#deptModal").modal('toggle');
                        $('#mytab').bootstrapTable('refresh');
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
            if(confirm("确认要删除该部门吗？")){
                $.ajax({
                    url:"${contextPath}/dept/deleteDeptById/" + selRow[0].id,
                    type:"GET",
                    dataType:"json",
                    contentType:"application/json",
                    success:function(data){
                        if(data.code == "00000"){
                            prompt("删除成功");
                            $('#mytab').bootstrapTable('refresh');
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

</script>
</body>
</html>