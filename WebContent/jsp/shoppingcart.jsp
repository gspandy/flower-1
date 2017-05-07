<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="s"  uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoppingcart.jsp' starting page</title>
    
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
                <li><a href='<c:url value="/contact.jsp"></c:url>'>关于</a></li>
                <li><a href='<c:url value='browseFlowerPaging.action?catalogid=1&currentPage=1'></c:url>'>产品</a>
                    <ul>
                    <!-- 鼠标 hover事件 -->
                      <!--   <li><a href="http://www.gsunny.cn/?page/1" rel="nofollow">Sub Page One</a></li> -->
                        
                  	</ul>
                </li>
                <li><a href='<c:url value="/jsp/shoppingcart.jsp"></c:url>'>购物车</a></li>
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
        <a href="http://www.freemoban.com" title="图像"  class="site_repeat" target="_blank"><img src="images/top_repeat.png" title="图像"  /></a><!-- end of templatemo_menu -->

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
    	<h2>购物车</h2>
    	<!--显示 购物车所有花品信息  -->
		<table width="700" border="0" cellpadding="5" cellspacing="0">
          	<tr bgcolor="#fff">
                <th width="168" align="left">物品项</th> 
                <th width="188" align="left">描述</th> 
                <th width="60" align="center">数量</th> 
                <th width="80" align="right">价格</th> 
                <th width="80" align="right">小计</th> 
                <th width="64"> </th>
          	</tr>
          	<!-- 循环遍历  cart -->
          	<s:set value="#session.cart.cartitems" var="cartitems"></s:set>
          	<s:if test="#cartitems.size!=0">
          		<s:iterator value="#cartitems" var="item">
            	<tr bgcolor="#41581B">
	                  <td><a href='displayOneFlower.action?flowerid=<s:property value="value.flower.flowerid"/>'><img src="pic/<s:property value="value.flower.picture" />" alt="flower image 1" /></a></td> 
	                <td><s:property value="value.flower.flowername" /></td> 
	                <td align="center">
	                	<input name="quantity1" type="text" id="quantity1" value="<s:property value="value.quantity"/>" size="6" maxlength="2" /> 
	                </td>
	                <td align="right">$<s:property value="value.flower.price" /></td> 
	                <!-- 同种商品 的小计=数量*单价 ,这个小计值 来自于OrderItem实体类-->
	                <td align="right">$<span>${value.subTotal} </span></td>
	                <td align="center"> <a href='<c:url value="deleteCart.action?flowerid=${value.flower.flowerid}"></c:url>'><img src="images/remove.png" alt="remove" /><br />移除</a>   
                </td>
      			</s:iterator>
      		</s:if>
      		
      		<tr bgcolor="#fff">
                <td colspan="3">您有修改过的项目数量吗？ <a href='<c:url value="updateCart"></c:url>'><strong>更新</strong></a> 购物车.&nbsp;&nbsp;</td>
                <!--所有商品总价格，该值来源于Cart类  -->
                <td align="right"><h4>总价:</h4></td>
                <td align="right"><h4>$<span style="font-size: 22px;"> ${session.cart.totalPrice}</span></h4></td>
                <td> </td>
            </tr>
        </table>
		<div class="cleaner h20"></div>
		<!-- 提交订单 并转发到支付界面 -->
        <div class="right"><a href='<c:url value="check.action"></c:url>' class="button">结算</a></div>
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
		<p>Copyright &copy; <a target="_blank" href="http://www.gsunny.cn/?moban/">http://www.gsunny.cn</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->
</div>
  </body>
  <script type='text/javascript' src='js/logging.js'></script>
</html>
