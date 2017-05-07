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
    
    <title>产品</title>
    
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
                <li><a href='<c:url value='browseFlowerPaging.action?catalogid=1&currentPage=1'></c:url>' >产品 </a>
                    <ul>
                    <!-- 鼠标hover 时间，当鼠标移动上去 查询分离结果 -->
                       <!--  <li><a href="http://www.gsunny.cn/?page/1" rel="nofollow">红玫瑰</a></li>
                         -->
                  </ul>
                </li>
                <li><a href='<c:url value="/jsp/shoppingcart.jsp"></c:url>'>购物车</a></li>
                <li><a href='<c:url value="/jsp/contact.jsp"></c:url>'>>联系我们</a></li>
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
        <a href="http://www.gsunny.cn" title="www.gsunny.cn" rel="nofollow" class="site_repeat" target="_blank"><img src="images/top_repeat.png" title="www.gsunny.cn"  /></a><!-- end of templatemo_menu -->
        
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
		<h2>产品</h2>
        <p>爱情信物品牌，以“一生只送一人”的真爱理念与矜贵花材甄选、精湛的工艺与设计闻名于世，
			产品系列涵盖鲜花玫瑰、永生玫瑰、珠宝、香氛等领域。floral以传奇玫瑰灵感 杰作引领时代风格，
			见证世间无数至臻浪漫的爱情故事 .</p>
			
			<!-- 循环遍历鲜花查询结果 -->
			<s:set value="#request.flowers" var="flowers"></s:set>
			
			<s:iterator value="#flowers" var="flower">
  			<div class="product_box">
  			
  				 <form  id="form1" name="shoppingAction" action='<c:url value="/shoppingAction"></c:url>' method="get">
						 
						<a href='displayOneFlower.action?flowerid=<s:property value="#flower.flowerid"/>'>
							<img src="pic/<s:property value="#flower.picture"/>"  alt="floral set 1" />
						</a>
						<h3><s:property value="#flower.flowername"/></h3>
						
						<p class="product_price">$<s:property value="#flower.price"/></p>
						
						<p class="add_to_cart">
						<!-- 查看花品详情 -->
							<a href="displayOneFlower.action?flowerid=<s:property value="#flower.flowerid"/>">详情</a>
							<!-- 添加  花品 到购物车 -->
						<input type="hidden"  name="flowerid" value="<s:property value="#flower.flowerid" />"> 	
							<a>
						  <button	style="list-style-type: none; border: none; background: none;"  type="submit">加入购物车 </button>
							 </a>
						</p>
						 </form> 
        	</div>        	
        </s:iterator>
        
        <!--翻页按钮  -->
        <div class="blank_box">
			<s:if test="#pager.hasPrevious">
	        	<a href="browseFlowerPaging.action?currentPage=<s:property  value="#pager.currentPage-1"/>" class="button left">上一页</a> 
			</s:if>  
			<s:if test="#pager.hasNext">
			
            <a href="browseFlowerPaging.action?currentPage=<s:property  value="#pager.currentPage+1"/>" class="button right">下一页</a>
			</s:if>      
        </div>
        
        <div class="cleaner h20"></div>
    	<div class="blank_box">
        	<a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
        </div>    
    </div>
    <div class="cleaner"></div>
</div> <!-- END of main -->
</div> <!-- END of main wrapper -->

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
	 
	<div class="footer_right">
		<p>Copyright &copy; <a target="_blank" href="http://www.gsunny.cn/">www.gsunny.cn</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->
</div>
  </body>
  <script type='text/javascript' src='js/logging.js'></script>
</html>
