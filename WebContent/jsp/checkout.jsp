<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'checkout.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}

</script>

  </head>
  <body>
    <div id="templatemo_wrapper_sp">
<div id="templatemo_header_wsp">
	<div id="templatemo_header" class="header_subpage">
    	<div id="site_title"><a href="http://www.gsunny.cn" rel="nofollow">Floral Shop</a></div>
        <div id="templatemo_menu" class="ddsmoothmenu">
            <ul>
                <li><a href='<c:url value="/index.jsp"></c:url>'>主页</a></li>
                <li><a href='<c:url value="/contact.jsp"></c:url>' >关于</a></li>
                <li><a href='<c:url value='browseFlowerPaging.action?catalogid=1&currentPage=1'></c:url>'>产品</a>
                </li>
                <li><a href='<c:url value="/jsp/shoppingcart.jsp"></c:url>' class="selected">购物车</a></li>
                <li><a href='<c:url value="/jsp/contact.jsp"></c:url>'>联系我们</a></li>
                <li><a href='<c:url value="/jsp/faqs.jsp"></c:url>'>FAQs</a></li>
            </ul>
            <div id="templatemo_search">
                <form action='<c:url value="searchFlower"></c:url>' method="get">
                  	<input type="text" value="搜索" name="flower.flowername" id="keyword" title="keyword" 
                  			onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  	<input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
                </form>
            </div>
            <br style="clear: left" />
        </div> 
        <a href="" title="图像"  class="site_repeat" target="_blank"><img src="images/top_repeat.png" title="图像" alt="图像" /></a><!-- end of templatemo_menu -->

    </div> <!-- END of header -->
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">
	<div id="sidebar" class="left">
    	<div class="sidebar_box"><span class="bottom"></span>
            <h3>目录</h3>   
            <div class="content"> 
                <ul class="sidebar_list">
                    <!--取得返回的目录结果 ，遍历显示  -->
								<s:iterator value="#session.catalogs" var="cata">
								<li> 
								<a href="browseFlowerPaging.action?catalogid=
									<s:property value="#cata.catalogid"/>&currentPage=1">
									<s:property value="#cata.catalogname"/></a>
								</li>
								</s:iterator>
                </ul>
            </div>
        </div>
        <div class="sidebar_box"><span class="bottom"></span>
            <h3>每周最佳</h3>   
            <div class="content special"> 
                <img src="images/templatemo_image_01.jpg" alt="Flowers" />
                <a href="#">Citrus Burst Bouquet</a>
                <p>
                	Price:
                    <span class="price normal_price">$160</span>&nbsp;&nbsp;
                    <span class="price special_price">$100</span>
                </p>
            </div>
        </div>
    </div>
    <div id="content" class="right">
    	<h2>结算</h2>
		<h3>订单详情</h3>
            <div class="content_half left form_field">
				收货人姓名: (must be the same as on credit card)
                <input name="fullname" type="text" id="fullname" maxlength="40" /><br />
                                             地址:
      			<input name="address" type="text" id="address" maxlength="40" />
            </div>
            <div class="content_half right form_field">
            	邮箱:
			  <input name="email" type="text" id="email" maxlength="40" /><br />
             	   手机:<br />
                <input name="phone" type="text" id="phone" maxlength="40" />
                <span>Please, specify your reachable phone number to call you for a verification.</span>
            </div>
            <div class="cleaner h40"></div>
            <h3>支付通道</h3>
            <h4>TOTAL: <strong>$560</strong></h4>
			<p><input name="terms" type="checkbox" id="terms" />
		    I have read and accept the <a href="#">Terms of Use</a>. Validate <a href="http://www.gsunny.cn/??check?uri=referer" rel="nofollow"><strong>XHTML</strong></a> &amp; <a href="http://www.gsunny.cn/??css-validator/check/referer" rel="nofollow"><strong>CSS</strong></a>.</p>
            <p><a href="#"><img src="images/1311260370_paypal-straight.png" alt="paypal" align="middle" /></a>&nbsp;(recommended if you have a PayPal account. Fastest way to complete your order.)</p>
            <p><a href="#"><img src="images/flagship.jpg" alt="Flagship" align="middle" /></a>&nbsp;(free shipping for orders above $500)</p>
            <div class="blank_box">
        	<a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
        	</div>    
    </div>
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
	<div class="footer_left">
    	<a href="#"><img src="images/1311260370_paypal-straight.png" alt="Paypal" /></a><!---->
    </div>
	<div class="footer_right">
		<p><a target="_blank" href="http://www.gsummy.cn">www.gsunny.cn</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->
</div>
  </body>
  <script type='text/javascript' src='js/logging.js'></script>
</html>
