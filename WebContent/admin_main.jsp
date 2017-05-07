<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/jkxyflower.css">
	

  </head>
  
  <body>
 
   <div class="content">
		<div class="left">
		<a href="addNewFlower.jsp" target="_blank">添加新花品</a><br><br>
		<a href='<c:url value="/admin/managerFlower.action"></c:url>' target="_blank">管理花品</a><br><br>
		<a href="managerUser.jsp" target="_blank">顾客账号管理</a><br><br>	
     <a href="logOut.action" target="_top">注销</a>


		</div>
		 
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
