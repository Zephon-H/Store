<%--
  Created by IntelliJ IDEA.
  User: zephon
  Date: 19-6-7
  Time: 下午1:33
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
        <li class="breadcrumb-item active">主页</li>
    </ol>
    <!-- Icon Cards-->
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-comments"></i>
                    </div>
                    <div class="mr-5">商品信息一览</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="backTables">
                    <span class="float-left">查看</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-list"></i>
                    </div>
                    <div class="mr-5">用户信息</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="backUserManage">
                    <span class="float-left">查看</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-shopping-cart"></i>
                    </div>
                    <div class="mr-5">日志信息</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="backLogShow">
                    <span class="float-left">查看</span>
                    <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
                </a>
            </div>
        </div>
    </div>
    <!-- Example DataTables Card-->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fa fa-table"></i>商品信息表</div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>商品价格</th>
                        <th>商品详细</th>
                        <th>商品类型</th>
                        <th>商品图片</th>
                        <th>商品销量</th>
                    </tr>
                    </thead>
                    <c:forEach items="${goodsList}" var="g">
                        <tr>
                            <td>${g.id}</td>
                            <td>${g.name}</td>
                            <td>${g.price}</td>
                            <td>${g.detail}</td>
                            <td>${g.type}</td>
                            <td>${g.picture}</td>
                            <td>${g.sales}</td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
