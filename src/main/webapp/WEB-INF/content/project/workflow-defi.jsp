<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程定义管理</title>

    <link href="<c:url value='/project/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/project/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/project/font-awesome/css/font-awesome.css'/>" rel="stylesheet">
    <link href="<c:url value='/project/css/animate.css'/>" rel="stylesheet">
	<link href="<c:url value='/project/css/workflow/workflow.css'/>" rel="stylesheet">
	<link href="<c:url value='/project/css/plugins/dataTables/datatables.min.css'/>" rel="stylesheet">
	<link href="<c:url value='/project/css/plugins/sweetalert/sweetalert.css'/>" rel="stylesheet">

</head>
<body class="white-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<!--流程展现-->
	        <div class="col-md-6">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                   流程展现
		                <button class="btn btn-primary btn-add" type="button">
		                   	<i class="fa fa-plus-circle"></i>&nbsp;&nbsp;新增
		                </button>

	                </div>
	                <div class="panel-body">
						<table class="table table-striped table-bordered table-hover dataTables-example" >
                    		<thead>
			                    <tr>
			                        <th class="text-center">流程名称</th>
			                        <th class="text-center">流程个数</th>
			                        <th class="text-center">操作</th>
			                    </tr>
                   			</thead>
                   			<tbody id="dataTableWorkflow">

                    		</tbody>
                    	</table>
	                </div>
	            </div>
	        </div>
	    	<!--流程定义-->
	        <div class="col-md-6">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    流程定义
	                    <button class="btn btn-primary btn-upload" type="button">
	                    	<i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">提交</span>
	                    </button>
	                </div>
	                <!--添加流程名字-->
	                <div class="panel-body" id="workflow">
	                	<div class="ibox float-e-margins inputSoming">
		                   <div class="input-group">
		                   		<input type="text" class="form-control" placeholder="流程名称">
		                   		<span class="input-group-btn">
		                   			<button type="button" class="btn btn-info group-btn fileText"  title="描述">
		                   				<i class="fa fa-chevron-up"></i>
		                   			</button>
		                   			<button type="button" class="btn btn-success group-btn addInput" title="添加子项目">
		                   				<i class="fa fa-plus-square"></i>
		                   			</button>
		                   		</span>
		                   	</div>
							<textarea class="form-control fText" rows="6" placeholder="描述">

                            </textarea>

		                </div>
	                </div>

	            </div>
	        </div>
	    </div>

	    <!--模态框-->
	    <div class="modal inmodal fade" id="eyeWorkflow" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">
	                    	<span aria-hidden="true">&times;</span>
	                    	<span class="sr-only">Close</span>
	                    </button>
	                    <h4 class="modal-title"></h4>
	                    <small></small>
                	</div>
                    <div id="vertical-timeline" class="vertical-container dark-timeline center-orientation">



                  	</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

	</div>
	<!-- Mainly scripts -->
	<script src="<c:url value='/project/js/jquery-3.1.1.min.js'/>"></script>
	<script src="<c:url value='/project/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/project/js/plugins/metisMenu/jquery.metisMenu.js'/>"></script>
    <script src="<c:url value='/project/js/plugins/slimscroll/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/project/js/plugins/dataTables/datatables.min.js'/>"></script>

    <!-- Sweet alert -->
    <script src="<c:url value='/project/js/plugins/sweetalert/sweetalert.min.js'/>"></script>

    <script src="<c:url value='/project/js/workflow/workflow-data.js'/>"></script>
    <script src="<c:url value='/project/js/workflow/workflow-service.js'/>"></script>
</body>
</html>