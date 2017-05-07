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
    
    <title>My JSP 'productdetil.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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

			function clearText(field) {
				if(field.defaultValue == field.value) field.value = '';
				else if(field.value == '') field.value = field.defaultValue;
			}
		</script>

		<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script>
		<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" />
		<script type="text/JavaScript" src="js/slimbox2.js"></script>
		
		<!--获取输入的 鲜花数量  -->
		<script>
		$(document).ready(function(){
  			$(".flowerquantity").blur(function(){
    			 
   				 var quantity=$(".flowerquantity").attr("value");
    			$(".quantity").attr("value",quantity);
  });
});
</script>
  </head>
  
  <body>
    <div id="templatemo_wrapper_sp">
			<div id="templatemo_header_wsp">
				<div id="templatemo_header" class="header_subpage">
					<div id="site_title">
						<a href="http://www.gsunny.cn" rel="nofollow">Floral Shop</a>
					</div>
					<div id="templatemo_menu" class="ddsmoothmenu">
						<ul>
							<li>
								<a href='<c:url value="/index.jsp"></c:url>'>主页</a>
							</li>
							<li>
								<a href='<c:url value="/contact.jsp"></c:url>'>关于</a>
							</li>
							<li>
								<a href='<c:url value="browseFlowerPaging.action?catalogid=1&currentPage=1"></c:url>'>产品</a>
								<ul>
									<li>
										<a href='<c:url value="browseFlowerPaging.action?catalogid=1&currentPage=1"></c:url>'>红玫瑰</a>
									</li>
									 
								</ul>
							</li>
							<li>
								<a href='<c:url value="/jsp/shoppingcart.jsp"></c:url>'>购物车</a>
							</li>
							<li>
								<a href='<c:url value="/jsp/contact.jsp"></c:url>'>联系我们</a>
							</li>
							<li>
								<a href='<c:url value="/jsp/faqs.jsp"></c:url>'>FAQs</a>
							</li>
						</ul>
						<div id="templatemo_search">
							<form action='<c:url value="searchFlower"></c:url>' method="get">
								<input type="text" value="搜索" name="flower.flowername" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
								<input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn" />
							</form>
						</div>
						<br style="clear: left" />
					</div>
					<a href="http://cn.hiresimage.com" title="高清晰度图像 from cn.hiresimage.com" class="site_repeat" target="_blank"><img src="images/top_repeat.png" title="高清晰度图像 from cn.hiresimage.com" alt="高清晰度图像" /></a>
					<!-- end of templatemo_menu -->

				</div>
				<!-- END of header -->
			</div>
			<!-- END of header wrapper -->
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
					<!-- 显示 单个花卉的信息 -->
					<div id="content" class="right">
						<h2>花品详情</h2>
						<s:set value="#request.flower" var="flower"></s:set>
						<div class="content_half left">
							<!--展开花卉图片-->
							<a rel="lightbox" href="pic/<s:property value="#flower.picture"/>"><img src="pic/<s:property value="#flower.picture"/>" alt="yellow flowers" /></a>
						</div>
						<!--花卉详细信息  -->
						<div class="content_half right">
						 <form  id="form1" name="shoppingAction" action='<c:url value="/shoppingAction"></c:url>' method="get">
							<table>
								<tr>
									<td>花名:</td>
									<td><strong> <s:property value="#flower.flowername"/></strong></td>
								</tr>
								<tr>
									<td width="130">价格:</td>
									<td width="84">$<s:property value="#flower.price"/></td>
								</tr>
								<tr>
									<td>库存:</td>
									<td><strong>有货</strong></td>
								</tr>
								<tr>
									<td>数量</td>
									<td><input class="flowerquantity" type="text" value="1" size="6" maxlength="2" /></td>
								</tr>
							</table>
							<div class="cleaner h20"></div>
							<!-- 添加  花品 到购物车 -->
						<input type="hidden"  name="flowerid" value="<s:property value="#flower.flowerid" />"> 	
						<input class="quantity" type="hidden"  name="quantity" value=""> 	
							<button	 id="detil_button" style="border: none;"  type="submit">加入购物车 </button>
							 
							</form>
						</div>
						
						
						
						<div class="cleaner h40"></div>

						<h4>花品描述</h4>
						<p>
							 玫瑰在植物分类学上是一种蔷薇科蔷薇属灌木(Rosa rugosa)，在日常生活中是蔷薇属一系列花大艳丽的栽培品种的统称，
							 这些栽培品种亦可称做月季或蔷薇。玫瑰果实可食，无糖，富含维他命C，常用於香草茶、果酱、果冻、果汁和麪包等，
							 亦有瑞典汤（Nyponsoppa）、蜂蜜酒（Rhodomel）。玫瑰长久以来就象征著美丽和爱情。古希腊和古罗马民族
							 用玫瑰象征着他们的爱神阿芙罗狄蒂（Aphrodite）、维纳斯（Venus）。玫瑰在希腊神话中是宙斯所创造的杰作，
							 用来向诸神炫耀自己的能力
						</p>
						<div class="cleaner h40"></div>
						<div class="blank_box">
							<a href="#"><img src="images/free_shipping.jpg" alt="Free Shipping" /></a>
						</div>
					</div>
					<div class="cleaner"></div>
				</div>
				<!-- END of main -->
			</div>
			<!-- END of main wrapper -->

			<div id="templatemo_footer_wrapper">
				<div id="templatemo_footer">
					 
					<div class="footer_right">
						<p>Copyright &copy; 
							<a target="_blank" href="http://www.gsunny.cn/?moban/">www.gsunny.cn</a>
						</p>
					</div>
					<div class="cleaner"></div>
				</div>
				<!-- END of footer -->
			</div>
			<!-- END of footer wrapper -->
		</div>
  </body>
  <script type='text/javascript' src='js/logging.js'></script>
</html>
