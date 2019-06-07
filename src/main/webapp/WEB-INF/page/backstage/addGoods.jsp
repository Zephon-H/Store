<%--
  Created by IntelliJ IDEA.
  User: zephon
  Date: 19-6-7
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>后台管理</title>
    <!-- Bootstrap core CSS-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Page level plugin CSS-->
    <link href="css/dataTables.bootstrap4.css" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body>
<div class="content-wrapper">
    <div class="container-fluid">
        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="backMain" target="_self">主页</a>
            </li>
            <li class="breadcrumb-item active">商品管理</li>
            <li class="breadcrumb-item active">查看商品</li>
        </ol>
        <!-- Example DataTables Card-->
        <div class="card mb-3">
            <div class="card-header">
                <i class="fa fa-table"></i> 添加商品${deleteStatus}
                <c:if test="${not empty addStatus}">
                    添加成功
                </c:if></div>
            <div class="card-body">

                <form method="post" action="backAddGoodsConfirm" enctype="multipart/form-data">
                    商品名称：<input name="name"/><br>
                    商品价格：<input name="price"/><br>
                    商品详细：<input name="detail"/><br>
                    商品类型：<input name="type"/><br>
                    商品图片：<input type="file" name="file"/><br>
                    <input type="submit" value="添加"/>
                </form>

            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="js/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="js/jquery.dataTables.js"></script>
<script src="js/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="js/sb-admin-datatables.min.js"></script>
</div>
</body>
</html>
