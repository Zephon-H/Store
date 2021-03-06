<%@ page import="com.zephon.pojo.Goods" %><%--
  Created by IntelliJ IDEA.
  BackUser: zephon
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
    <script src="js/jquery-1.9.1.min.js"></script>
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
                                    $.ajax({
                                        url: "refresh",
                                        type: "get",
                                        datatype: 'json',
                                        success: function (data) {
                                            if(data==0){
                                                $cart.html("购物车是空的 <span>(0)</span>")
                                            }else{
                                                $cart.html("<center><a style=\"color: #fff;\" href=\"cart\">结算</a><span>("+data+")</span></center>\n")
                                            }
                                        }
                                    });
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
    <!----start-bottom-header---->
    <div class="header-bottom">
        <div class="wrap">
            <!-- start header menu -->
            <ul class="megamenu skyblue">
                <li class="grid"><a class="color2" href="#">男装</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>所有鞋类</h4>
                                    <ul>
                                        <li><a href="products?type=男装休闲">休闲</a></li>
                                        <li><a href="products?type=男装跑步">跑步</a></li>
                                        <li><a href="products?type=男装篮球">篮球</a></li>
                                        <li><a href="products?type=男装足球">足球</a></li>
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
                <li class="active grid"><a class="color4" href="#">女装</a>
                    <div class="megapanel">
                        <div class="row">
                            <div class="col1">
                                <div class="h_nav">
                                    <h4>所有鞋类</h4>
                                    <ul>
                                        <li><a href="products?type=女装休闲">休闲</a></li>
                                        <li><a href="products?type=女装跑步">跑步</a></li>
                                        <li><a href="products?type=女装篮球">篮球</a></li>
                                        <li><a href="products?type=女装足球">足球</a></li>
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
                                    <h4>男装定制</h4>
                                    <ul>
                                        <li><a href="products">所有男装定制</a></li>
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
                                    <h4>女装定制</h4>
                                    <ul>
                                        <li><a href="products">所有男装定制</a></li>
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
    <!---start-product-details--->
    <div class="product-details">
        <div class="wrap">
            <ul class="product-head">
                <li><a href="#">主页</a> <span>::</span></li>
                <li class="active-page"><a href="#">商品详情页</a></li>
                <div class="clear"></div>
            </ul>
            <!----details-product-slider--->
            <!-- Include the Etalage files -->
            <link rel="stylesheet" href="css/etalage.css">
            <script src="js/jquery.etalage.min.js"></script>
            <!-- Include the Etalage files -->
            <script>
                jQuery(document).ready(function ($) {

                    $('#etalage').etalage({
                        thumb_image_width: 300,
                        thumb_image_height: 400,
                        source_image_width: 900,
                        source_image_height: 1000,
                        show_hint: true,
                        click_callback: function (image_anchor, instance_id) {
                            alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                        }
                    });
                    // This is for the dropdown list example:
                    $('.dropdownlist').change(function () {
                        etalage_show($(this).find('option:selected').attr('class'));
                    });

                });
            </script>
            <!----//details-product-slider--->
            <div class="details-left">
                <div class="details-left-slider">
                    <ul id="etalage">
                        <li>
                            <a href="optionallink.html">
                                <img class="etalage_thumb_image" src="images/product-slide/image1${goods.picture}_thumb.jpg"/>
                                <img class="etalage_source_image" src="images/product-slide/image1${goods.picture}_large.jpg"/>
                            </a>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image2${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image2${goods.picture}_large.jpg"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image3${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image3${goods.picture}_large.jpg"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image4${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image4${goods.picture}_large.jpg"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image5${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image5${goods.picture}_large.jpg"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image6${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image6${goods.picture}_large.jpg"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/product-slide/image7${goods.picture}_thumb.jpg"/>
                            <img class="etalage_source_image" src="images/product-slide/image7${goods.picture}_large.jpg"/>
                        </li>
                    </ul>
                </div>
                <div class="details-left-info">
                    <div class="details-right-head">
                        <h1>${goods.name}</h1>
                        <p class="product-detail-info">${goods.detail}</p>
                        <div class="product-more-details">
                            <ul class="price-avl">
                                <li class="price"><span>${goods.price}</span><label>${goods.price}</label></li>
                                <li class="stock"><i>正在热卖</i></li>
                                <div class="clear"></div>
                            </ul>
                            <ul class="product-colors" id="colorSelect">
                                <h3>可选颜色 :</h3>
                                <li><a class="color1" href="#"><span> </span></a></li>
                                <li><a class="color2" href="#"><span> </span></a></li>
                                <li><a class="color3" href="#"><span> </span></a></li>
                                <li><a class="color4" href="#"><span> </span></a></li>
                                <li><a class="color5" href="#"><span> </span></a></li>
                                <li><a class="color6" href="#"><span> </span></a></li>
                                <li><a class="color7" href="#"><span> </span></a></li>
                                <li><a class="color8" href="#"><span> </span></a></li>
                                <div class="clear"></div>
                            </ul>
                            <ul class="prosuct-qty">
                                <span>数量:</span>
                                <select name="quantity">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                </select>
                            </ul>
                            <input id="bt" type="button" value="添加到购物车"/>
                            <script>
                                $(function () {
                                   $("#bt").click(function () {
                                       $.ajax({
                                           url:"addToCart",
                                           type: "post",
                                           datatype: 'json',
                                           data:{
                                               id:${goods.id},
                                               num:parseInt($("select").val())
                                           },
                                           success: function (data) {
                                               alert("添加成功")
                                           }
                                       });
                                   });
                                });
                            </script>
                            <ul class="product-share">
                                <h3>分享到</h3>
                                <ul>
                                    <li><a class="share-face" href="#"><span> </span> </a></li>
                                    <li><a class="share-twitter" href="#"><span> </span> </a></li>
                                    <li><a class="share-google" href="#"><span> </span> </a></li>
                                    <li><a class="share-rss" href="#"><span> </span> </a></li>
                                    <div class="clear"></div>
                                </ul>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="details-right">
                <a href="products">查看更多</a>
            </div>
            <div class="clear"></div>
        </div>
        <!----product-rewies---->
        <div class="product-reviwes">
            <div class="wrap">
                <!--vertical Tabs-script-->
                <!---responsive-tabs---->
                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion           
                            width: 'auto', //auto or any width like 600px
                            fit: true,   // 100% fit in a container
                            closed: 'accordion', // Start closed if in accordion view
                            activate: function (event) { // Callback function if tab is switched
                                var $tab = $(this);
                                var $info = $('#tabInfo');
                                var $name = $('span', $info);
                                $name.text($tab.text());
                                $info.show();
                            }
                        });

                        $('#verticalTab').easyResponsiveTabs({
                            type: 'vertical',
                            width: 'auto',
                            fit: true
                        });
                    });
                </script>
                <!---//responsive-tabs---->
                <!--//vertical Tabs-script-->
                <!--vertical Tabs-->
                <div id="verticalTab">
                    <ul class="resp-tabs-list">
                        <li>描述</li>
                        <li>商品标签</li>
                        <li>商品评论</li>
                    </ul>
                    <div class="resp-tabs-container vertical-tabs">
                        <div>
                            <h3> 详情</h3>
                            <p>${goods.detail}</p>
                        </div>
                        <div>
                            <h3>商品标签</h3>
                            <h4>添加你的标签</h4>
                            <form>
                                <input type="text"> <input type="submit" value="添加标签"/>
                                <span>使用空格分开标签</span>
                            </form>
                        </div>
                        <div>
                            <h3>顾客评论</h3>
                            <p>暂时还没有顾客评论</p>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <!--- start-similar-products--->
                <div class="similar-products">
                    <div class="similar-products-left">
                        <h3>类似商品</h3>
                        <p>这里显示的是类似的商品</p>
                    </div>
                    <div class="similar-products-right">
                        <!-- start content_slider -->
                        <!--- start-rate---->
                        <script src="js/jstarbox.js"></script>
                        <link rel="stylesheet" href="css/jstarbox.css" type="text/css" media="screen" charset="utf-8"/>
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
                        <div id="owl-demo" class="owl-carousel">
                            <c:forEach items="${similarList}" var="s">
                                <div class="item" onclick="location.href='details?id=${s.id}&type=${s.type}';">
                                    <div class="product-grid fade sproduct-grid">
                                        <div class="product-pic">
                                            <a href="#"><img src="images/product${s.picture}.jpg" title="product-name"/></a>
                                            <p>
                                                <a href="#">
                                                    ${s.name}
                                                    <small>${s.type}</small>
                                                    </a>
                                                <span>${s.detail}</span>
                                            </p>
                                        </div>
                                        <div class="product-info">
                                            <div class="product-info-cust">
                                                <a href="#">详细信息</a>
                                            </div>
                                            <div class="product-info-price">
                                                <a href="#">${s.price}</a>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="more-product-info">
                                            <span> </span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <!----//End-img-cursual---->
                    </div>
                    <div class="clear"></div>
                </div>
                <!--- //End-similar-products--->
            </div>
        </div>
        <div class="clear"></div>
        <!--//vertical Tabs-->
        <!----//product-rewies---->
        <!---//End-product-details--->
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
                    <li><a href="#">about us</a></li>
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

