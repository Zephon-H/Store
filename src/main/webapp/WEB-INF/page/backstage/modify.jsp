<%--
  Created by IntelliJ IDEA.
  User: zephon
  Date: 19-6-7
  Time: 下午2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>商品价格</th>
                            <th>商品详细</th>
                            <th>商品类型</th>
                            <th>商品图片</th>
                            <th>商品销量</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                            <tr>
                                <form method="post" action="backModifyConfirm" enctype="multipart/form-data">
                                <td><input size="10" name="id" value="${goods.id}" readonly/> </td>
                                <td><input size="10" name="name" value="${goods.name}"/></td>
                                <td><input size="10" name="price" value="${goods.price}"/></td>
                                <td><input size="10" name="detail" value="${goods.detail}"/></td>
                                <td><input size="10" name="type" value="${goods.type}"/></td>
                                <td><input size="10" type="file" name="file" value="${goods.picture}"/></td>
                                <td><input size="10" name="sales" value="${goods.sales}"/></td>
                                <td><input type="submit" value="确认修改"/></td>
                                </form>
                            </tr>

                    </table>
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
