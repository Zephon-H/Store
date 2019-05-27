<%--
  Created by IntelliJ IDEA.
  User: zephon
  Date: 19-5-27
  Time: 上午10:49
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商店 | 商品</title>
    <link href="css/style.css" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
    </script>
    <!----start-alert-scroller---->
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet"/>
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="js/menu_jquery.js"></script>
    <!-- //End menu -->
    <!---slider---->
    <link rel="stylesheet" href="css/slippry.css">
    <script src="js/jquery-ui.js" type="text/javascript"></script>
    <script src="js/scripts-f0e4e0c2.js" type="text/javascript"></script>
    <script>
        jQuery('#jquery-demo').slippry({
            // general elements & wrapper
            slippryWrapper: '<div class="sy-box jquery-demo" />', // wrapper to wrap everything, including pager
            // options
            adaptiveHeight: false, // height of the sliders adapts to current slide
            useCSS: false, // true, false -> fallback to js if no browser support
            autoHover: false,
            transition: 'fade'
        });
    </script>
    <!---move-top-top---->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>
    <!---//move-top-top---->
</head>
<body>
<!---start-wrap---->
<!---start-header---->
<div class="header">
    <div class="top-header">
        <div class="wrap">
            <div class="top-header-left">
                <ul>
                    <!---cart-tonggle-script---->
                    <script type="text/javascript">
                        $(function () {
                            var $cart = $('#cart');
                            $('#clickme').click(function (e) {
                                e.stopPropagation();
                                if ($cart.is(":hidden")) {
                                    $cart.slideDown("slow");
                                } else {
                                    $cart.slideUp("slow");
                                }
                            });
                            $(document.body).click(function () {
                                if ($cart.not(":hidden")) {
                                    $cart.slideUp("slow");
                                }
                            });
                        });
                    </script>
                    <!---//cart-tonggle-script---->
                    <li><a class="cart" href="#"><span id="clickme"> </span></a></li>
                    <!---start-cart-bag---->
                    <div id="cart">Your Cart is Empty <span>(0)</span></div>
                    <!---start-cart-bag---->
                    <li><a class="info" href="#"><span> </span></a></li>
                </ul>
            </div>
            <div class="top-header-center">
                <div class="top-header-center-alert-left">
                    <h3>免费邮寄</h3>
                </div>
                <div class="top-header-center-alert-right">
                    <div class="vticker">
                        <ul>
                            <li>适用于300元以上的订单 <label>免费退货</label></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="top-header-right">
                <ul>
                    <c:if test="${not empty user}">
                        <li style="color: #fff; font-size:15px;">${user.uname},你好</li>
                        <li><a href="exit">退出</a></li>
                    </c:if>
                    <c:if test="${empty user}">
                        <li><a href="login.jsp">登录</a><span> </span></li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!----start-mid-head---->
    <div class="mid-header">
        <div class="wrap">
            <div class="mid-grid-left">
                <form>
                    <input type="text" placeholder="搜索"/>
                </form>
            </div>
            <div class="mid-grid-right">
                <a class="logo" href="index"><span> </span></a>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!----//End-mid-head---->
    <!----start-bottom-header---->
    <div class="header-bottom">
        <div class="wrap">
            <!-- start header menu -->
            <ul class="megamenu skyblue">
                <li class="grid"><a class="color2" href="#">男子</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>所有鞋类</h4>
                                    <ul>
                                        <li><a href="products">休闲</a></li>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    <h4 class="top">所有服装</h4>
                                    <ul>
                                        <li><a href="products">上衣/T恤</a></li>
                                        <li><a href="products">Polo衫</a></li>
                                        <li><a href="products">连帽衫/套头衫</a></li>
                                        <li><a href="#">外套/夹克</a></li>
                                        <li><a href="#">短裤</a></li>
                                        <li><a href="#">休闲裤</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>运动</h4>
                                    <ul>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                        <li><a href="products">健身/训练</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>品牌</h4>
                                    <ul>
                                        <li><a href="products">乔丹</a></li>
                                        <li><a href="products">耐克</a></li>
                                        <li><a href="products">李宁</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1 men">
                                <div class="men-pic">
                                    <img src="images/men.png" title=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="active grid"><a class="color4" href="#">女子</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>所有鞋类</h4>
                                    <ul>
                                        <li><a href="products">休闲</a></li>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    <h4 class="top">所有服装</h4>
                                    <ul>
                                        <li><a href="products">上衣/T恤</a></li>
                                        <li><a href="products">Polo衫</a></li>
                                        <li><a href="products">连帽衫/套头衫</a></li>
                                        <li><a href="#">外套/夹克</a></li>
                                        <li><a href="#">短裤</a></li>
                                        <li><a href="#">休闲裤</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>运动</h4>
                                    <ul>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                        <li><a href="products">健身/训练</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>品牌</h4>
                                    <ul>
                                        <li><a href="products">乔丹</a></li>
                                        <li><a href="products">耐克</a></li>
                                        <li><a href="products">李宁</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1 men">
                                <div class="men-pic">
                                    <img src="images/women.png" title=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li><a class="color5" href="#">儿童</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>所有鞋类</h4>
                                    <ul>
                                        <li><a href="products">休闲</a></li>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    <h4 class="top">所有服装</h4>
                                    <ul>
                                        <li><a href="products">上衣/T恤</a></li>
                                        <li><a href="products">Polo衫</a></li>
                                        <li><a href="products">连帽衫/套头衫</a></li>
                                        <li><a href="#">外套/夹克</a></li>
                                        <li><a href="#">短裤</a></li>
                                        <li><a href="#">休闲裤</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>运动</h4>
                                    <ul>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                        <li><a href="products">健身/训练</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>品牌</h4>
                                    <ul>
                                        <li><a href="products">乔丹</a></li>
                                        <li><a href="products">耐克</a></li>
                                        <li><a href="products">李宁</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col1 men">
                                <div class="men-pic">
                                    <img src="#" title=""/>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li><a class="color6" href="#">专属定制</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>男子定制</h4>
                                    <ul>
                                        <li><a href="products">所有男子定制</a></li>
                                        <li><a href="products">休闲</a></li>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                    </ul>
                                </div>
                                <div class="h_nav">
                                    <h4 class="top"></h4>

                                </div>
                            </div>
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>女子定制</h4>
                                    <ul>
                                        <li><a href="products">所有男子定制</a></li>
                                        <li><a href="products">休闲</a></li>
                                        <li><a href="products">跑步</a></li>
                                        <li><a href="products">篮球</a></li>
                                        <li><a href="products">足球</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li><a class="color7" href="#">流行</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!----//End-bottom-header---->
<!---//End-header---->
<!--- start-content---->
<div class="content product-box-main">
    <div class="wrap">
        <div class="content-left">
            <div class="content-left-top-brands">
                <h3>类别</h3>
                <ul>
                    <li><a href="#">所有</a></li>
                    <li><a href="#">男子</a></li>
                    <li><a href="#">女子</a></li>
                    <li><a href="#">童装</a></li>
                </ul>
            </div>
            <div class="content-left-top-grid">
                <div class="content-left-price-selection content-left-top-brands-prices">
                    <h4></h4>
                    <div class="price-selection-tree">
                    </div>
                </div>
            </div>
        </div>
        <div class="content-right product-box">
            <div class="product-box-head">
                <div class="product-box-head-left">
                    <h3>商品 <span>(500)</span></h3>
                </div>
                <div class="product-box-head-right">
                    <ul>
                        <li><span>分类 ::</span><a href="#"> </a></li>
                        <li><label> </label> <a href="#"> 流行</a></li>
                        <li><label> </label> <a href="#"> 新品</a></li>
                        <li><label> </label> <a href="#"> 折扣</a></li>
                        <li><span>价格 ::</span><a href="#">低 高</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="product-grids" id="contentDiv">
                <!--- start-rate---->
                <script src="js/jstarbox.js"></script>
                <link rel="stylesheet" href="css/jstarbox.css" charset="utf-8"/>
                <script type="text/javascript">
                    jQuery(function () {
                        jQuery('.starbox').each(function () {
                            var starbox = jQuery(this);
                            starbox.starbox({
                                average: starbox.attr('data-start-value'),
                                changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                                ghosting: starbox.hasClass('ghosting'),
                                autoUpdateAverage: starbox.hasClass('autoupdate'),
                                buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                                stars: starbox.attr('data-star-count') || 5
                            }).bind('starbox-value-changed', function (event, value) {
                                if (starbox.hasClass('random')) {
                                    var val = Math.random();
                                    starbox.next().text(' ' + val);
                                    return val;
                                }
                            })
                        });
                    });
                </script>
                <!---//End-rate---->
                <script>
                    $(function () {
                        // 记录页数
                        var $page = 1;
                        $.ajax({
                            url:"selPage",
                            data:"page="+$page,
                            type:"get",
                            datatype:'json',
                            success:function(data){
                                console.log(data+"--"+data[0].detail);
                                for(var i=0;i<data.length;i++){
                                    if((i+1)%3!=0){
                                        $("#contentDiv").append("<div onClick=\"location.href='details';\" class=\"product-grid fade\">\n" +
                                            "                    <div class=\"product-pic\">\n" +
                                            "                        <a href=\"#\"><img src=\"images/product"+data[i].picture+".jpg\" title=\"product-name\"/></a>\n" +
                                            "                        <p>\n" +
                                            "                            <a href=\"#\">\n" +data[i].name+
                                            "                            <span>"+data[i].detail+"</span>\n" +
                                            "                        </p>\n" +
                                            "                    </div>\n" +
                                            "                    <div class=\"product-info\">\n" +
                                            "                        <div class=\"product-info-cust\">\n" +
                                            "                            <a href=\"details\">Details</a>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"product-info-price\">\n" +
                                            "                            <a href=\"details\">"+data[i].price+"</a>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"clear\"></div>\n" +
                                            "                    </div>\n" +
                                            "                    <div class=\"more-product-info\">\n" +
                                            "                        <span> </span>\n" +
                                            "                    </div>\n" +
                                            "                </div>");
                                    }else{
                                        $("#contentDiv").append("<div onClick=\"location.href='details';\" class=\"product-grid fade last-grid\">\n" +
                                            "                    <div class=\"product-pic\">\n" +
                                            "                        <a href=\"#\"><img src=\"images/product"+data[i].picture+".jpg\" title=\"product-name\"/></a>\n" +
                                            "                        <p>\n" +
                                            "                            <a href=\"#\">\n" +data[i].name+
                                            "                            <span>"+data[i].detail+"</span>\n" +
                                            "                        </p>\n" +
                                            "                    </div>\n" +
                                            "                    <div class=\"product-info\">\n" +
                                            "                        <div class=\"product-info-cust\">\n" +
                                            "                            <a href=\"details\">Details</a>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"product-info-price\">\n" +
                                            "                            <a href=\"details\">"+data[i].price+"元</a>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"clear\"></div>\n" +
                                            "                    </div>\n" +
                                            "                    <div class=\"more-product-info\">\n" +
                                            "                        <span> </span>\n" +
                                            "                    </div>\n" +
                                            "                </div>");
                                    }
                                }
                                //$("#contentDiv").html("");
                            },
                            error:function () {
                                alert("11");
                            }});
                        // 懒加载
                        var winH = $(window).height(); //页面可视区域高度
                        $(window).scroll(function () {
                            var pageH = $(document.body).height();
                            var scrollT = $(window).scrollTop(); //滚动条top
                            var aa = (pageH - winH - scrollT) / winH;
                            if (aa < 0.02) {
                                $page++;
                                $.ajax({
                                    url:"selPage?page="+$page,
                                    type:"get",
                                    datatype:'json',
                                    success:function(data){
                                        if(data.length==0){
                                            $("#moreDiv").html("");
                                        }
                                        for(var i=0;i<data.length;i++){
                                            if((i+1)%3!=0){
                                                $("#contentDiv").append("<div onClick=\"location.href='details';\" class=\"product-grid fade\">\n" +
                                                    "                    <div class=\"product-pic\">\n" +
                                                    "                        <a href=\"#\"><img src=\"images/product"+data[i].picture+".jpg\" title=\"product-name\"/></a>\n" +
                                                    "                        <p>\n" +
                                                    "                            <a href=\"#\">\n" +data[i].name+
                                                    "                            <span>"+data[i].detail+"</span>\n" +
                                                    "                        </p>\n" +
                                                    "                    </div>\n" +
                                                    "                    <div class=\"product-info\">\n" +
                                                    "                        <div class=\"product-info-cust\">\n" +
                                                    "                            <a href=\"details\">Details</a>\n" +
                                                    "                        </div>\n" +
                                                    "                        <div class=\"product-info-price\">\n" +
                                                    "                            <a href=\"details\">"+data[i].price+"</a>\n" +
                                                    "                        </div>\n" +
                                                    "                        <div class=\"clear\"></div>\n" +
                                                    "                    </div>\n" +
                                                    "                    <div class=\"more-product-info\">\n" +
                                                    "                        <span> </span>\n" +
                                                    "                    </div>\n" +
                                                    "                </div>");
                                            }else{
                                                $("#contentDiv").append("<div onClick=\"location.href='details';\" class=\"product-grid fade last-grid\">\n" +
                                                    "                    <div class=\"product-pic\">\n" +
                                                    "                        <a href=\"#\"><img src=\"images/product"+data[i].picture+".jpg\" title=\"product-name\"/></a>\n" +
                                                    "                        <p>\n" +
                                                    "                            <a href=\"#\">\n" +data[i].name+
                                                    "                            <span>"+data[i].detail+"</span>\n" +
                                                    "                        </p>\n" +
                                                    "                    </div>\n" +
                                                    "                    <div class=\"product-info\">\n" +
                                                    "                        <div class=\"product-info-cust\">\n" +
                                                    "                            <a href=\"details\">Details</a>\n" +
                                                    "                        </div>\n" +
                                                    "                        <div class=\"product-info-price\">\n" +
                                                    "                            <a href=\"details\">"+data[i].price+"元</a>\n" +
                                                    "                        </div>\n" +
                                                    "                        <div class=\"clear\"></div>\n" +
                                                    "                    </div>\n" +
                                                    "                    <div class=\"more-product-info\">\n" +
                                                    "                        <span> </span>\n" +
                                                    "                    </div>\n" +
                                                    "                </div>");
                                            }
                                        }
                                        //$("#contentDiv").html("");
                                    },
                                    error:function () {
                                        alert("11");
                                    }
                                });
                            }
                        });
                        $("#moreA").click(function () {
                            $(document).scrollTop(9999);
                        });
                    });
                </script>
            </div>


            <!----start-load-more-products---->
            <div class="clear" id="moreDiv">
                <div class="loadmore-products">
                    <a id="moreA">Loadmore</a>
                </div>
            </div>

            <!----//End-load-more-products---->
        </div>
        <div class="clear"></div>
    </div>
</div>
<!---- start-bottom-grids---->
<div class="bottom-grids">
    <div class="bottom-top-grids">
        <div class="wrap">
            <div class="bottom-top-grid">
                <h4>获取帮助</h4>
                <ul>
                    <li><a href="contact.jsp">订单状态</a></li>
                    <li><a href="#">配送方式</a></li>
                    <li><a href="#">退换货</a></li>
                    <li><a href="#">付款选项</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </div>
            <div class="bottom-top-grid">
                <h4>关于我们</h4>
                <ul>
                    <li><a href="#">about</a></li>
                </ul>
            </div>
            <div class="bottom-top-grid last-bottom-top-grid">
                <h4>特色服务</h4>
                <p>something</p>
                <a class="learn-more" href="#">Learn more</a>
            </div>
            <div class="clear"></div>
        </div>
    </div>

</div>
<!---- //End-bottom-grids---->
<!--- //End-content---->
<!---start-footer---->
<div class="footer">
    <div class="wrap">
        <div class="footer-left">
            <ul>
                <li><a href="#">中国</a> <span> </span></li>
                <li><a href="#">使用条款</a> <span> </span></li>
                <li><a href="#">xx公司</a> <span> </span></li>
                <li><a href="#"> 隐私和Cookie政策</a> <span> </span></li>
                <li><a href="#">Cookie设置</a></li>
                <div class="clear"></div>
            </ul>
        </div>
        <div class="footer-right">
            <p><a href="#" target="_blank">沪ICP备xxxxxxx号</a></p>
            <script type="text/javascript">
                $(document).ready(function () {
                    /*
                    var defaults = {
                          containerID: 'toTop', // fading element id
                        containerHoverID: 'toTopHover', // fading element hover id
                        scrollSpeed: 1200,
                        easingType: 'linear'
                     };
                    */

                    $().UItoTop({easingType: 'easeOutQuart'});

                });
            </script>
            <a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 1;"></span></a>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!---//End-footer---->
<!---//End-wrap---->
</body>
</html>

