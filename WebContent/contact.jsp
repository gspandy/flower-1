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
    
    <title>联系我们</title>
    
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
                <li><a href='<c:url value="/index.jsp"></c:url>' >主页</a></li>
                <li><a href='<c:url value="/contact.jsp"></c:url>'>关于</a></li>
           		<li><a href='<c:url value='browseFlowerPaging.action?catalogid=1&currentPage=1'></c:url>'>产品</a>
                    <ul>
                        <li><a href="http://www.gsunny.cn/?page/1" rel="nofollow">Sub Page One</a></li>
                        <li><a href="http://www.gsunny.cn/?page/2" rel="nofollow">Sub Page Two</a></li>
                        <li><a href="http://www.gsunny.cn/?page/3" rel="nofollow">Sub Page Three</a></li>
                        <li><a href="http://www.gsunny.cn/?page/4" rel="nofollow">Sub Page Four</a></li>
                        <li><a href="http://www.gsunny.cn/?page/5" rel="nofollow">Sub Page Five</a></li>
                  </ul>
                </li>
                <li><a href='<c:url value="/jsp/shoppingcart.jsp"></c:url>'>购物车</a></li>
                <li><a href='<c:url value="/jsp/contact.jsp"></c:url>' class="selected">联系我们</a></li>
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
        <a title="免费的图像搜索"  class="site_repeat" ><img src="images/top_repeat.png" title="免费的图像搜索" alt="免费的图像搜索" /></a>

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
		<h2>Contact</h2>
        <p>赠人玫瑰，手游余香~</p>
        <div class="cleaner h20"></div>
        <div class="col col13">
            <h4>邮箱</h4>
        	<h6><strong>办公电话</strong></h6>
           025—800****   <br />
             <br />
             <br /><br />
			<strong>电话:</strong> 18851826086<br />
            <strong>邮箱:</strong> <a href="mailto:grn2015@foxmail.com">grn2015@foxmail.com</a> <br />
		</div>
        <div class="col col23 no_margin_right">
        	<div class="map_border">
                <iframe width="430" height="340" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src=""></iframe></div>
			
        </div>
        <div class="cleaner h40"></div>
        <div id="contact_form">
           <form method="post" name="contact" action="#">
           		<div class="col col13">
                
                    <label for="name">姓名:</label> 
              		<input name="name" type="text" class="input_field" id="name" maxlength="40" />
                	<div class="cleaner h10"></div>
                    <label for="email">邮箱:</label> 
          			<input name="email" type="text" class="required input_field" id="email" maxlength="40" />
                	<div class="cleaner h10"></div>
                    <label for="phone">电话:</label> 
        			<input name="phone" type="text" class="input_field" id="phone" maxlength="20" />
                	<div class="cleaner h10"></div>
                	
                
			 	</div>
                
                <div class="col col23 no_margin_right">
                    <label for="message">留言:</label> 
               	  	<textarea id="message" name="message" rows="0" cols="0" class="required"></textarea>
                    <div class="cleaner h10"></div>
                    <input type="submit" class="submit_btn left" name="submit" id="submit" value="发送" />
                    <input type="reset" class="submit_btn submit_right" name="reset" id="reset" value="撤销" />
				</div>
            </form>
        </div>
        <div class="cleaner h40"></div>        
        <div class="blank_box">
        	<a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
        </div>  
        <div class="cleaner"></div>  
    </div>
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
	<div class="footer_left">
    	 
    </div>
	<div class="footer_right">
		<p>Copyright &copy; <a target="_blank" href=" ">www.gsunny.cn</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->
</div>

  </body>
  <script type='text/javascript' src='js/logging.js'></script>
</html>
