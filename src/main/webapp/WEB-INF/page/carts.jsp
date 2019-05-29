<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: zephon
  Date: 19-5-27
  Time: 下午8:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商店 | 详情</title>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <script src="js/jquery.min.js"></script>
    <!----start-alert-scroller---->
    <script type="text/javascript" src="js/jquery.easy-ticker.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#demo').hide();
            $('.vticker').easyTicker();
        });
    </script>
    <!----start-alert-scroller---->
    <!-- start menu -->
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script src="js/menu_jquery.js"></script>
    <!-- //End menu -->
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
    <!-- Owl Carousel Assets -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <!-- Owl Carousel Assets -->
    <!-- Prettify -->
    <script src="js/owl.carousel.js"></script>
    <script>
        $(document).ready(function () {

            $("#owl-demo").owlCarousel({
                items: 3,
                lazyLoad: true,
                autoPlay: true,
                navigation: true,
                navigationText: ["", ""],
                rewindNav: false,
                scrollPerPage: false,
                pagination: false,
                paginationNumbers: false,
            });

        });
    </script>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
    <!-- //Owl Carousel Assets -->
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
                    <div id="cart">
                        <c:if test="${empty total}">
                            购物车是空的 <span>(0)</span>
                        </c:if>
                        <c:if test="${not empty total}">
                            <center><a style="color: #fff;" href="cart">结算</a><span>(${total})</span></center>
                        </c:if>

                    </div>
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
                            <li>适用于300元以上的订单 <label style="display:none ;">免费退货</label></li>
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
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" title="网站模板">网站模板</a></div>
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
<div class="content details-page">
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>
        <div class="cartBox" style="display: none;">
            <div class="all_check">
                <!--店铺全选-->
                <input type="checkbox" id="shop_a" class="shopChoice">
                <label for="shop_a" class="shop"></label>
            </div>
            <div class="shop_name">
                店铺：<a href="javascript:;"></a>
            </div>
        </div>
        <div class="order_content">
            <c:forEach items="${cart}" var="c">
                <ul class="order_lists">
                    <li style="display: none;"><div>${c.key.id}</div></li>
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_${s.index+2}" class="son_check">
                        <label for="checkbox_${s.index+2}"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="images/product${c.key.picture}.jpg" alt=""></a></div>
                        <div class="list_text"><a href="javascript:;">${c.key.name}</a></div>
                    </li>
                    <li class="list_info">
                        <p>规格：默认</p>
                        <p></p>
                    </li>
                    <li class="list_price">
                        <p class="price">￥${c.key.price}</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="${c.value}" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">￥${c.key.price*c.value}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
            </c:forEach>
        </div>
    </section>
</div>
<script src="js/carts.js"></script>
<script>
    var $name = "a";
    $(function () {
        //确定按钮，移除商品
        $('.dialog-sure').click(function () {

            var $id = parseInt($name[0].innerText.trim().substring(0, $name[0].innerText.trim().indexOf(" ")));
            //$name=$name[0].childNodes[3].innerText.trim();

            $.ajax({
                url: "removeCart",
                type: "post",
                datatype: 'json',
                data: {
                    id: $id
                },
                success: function (data) {
                    alert("移除成功");
                }
            });
        })
    })
</script>
<!--底部-->
<div class="bar-wrapper">
    <div class="bar-right">
        <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
        <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
        <div class="calBtn"><a href="javascript:;">结算</a></div>
    </div>
</div>
</section>
<section class="model_bg"></section>
<section class="my_model">
    <p class="title">删除宝贝<span class="closeModel">X</span></p>
    <p>您确认要删除该宝贝吗？</p>
    <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;"
                                                                           class="dialog-close">关闭</a></div>
</section>
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

