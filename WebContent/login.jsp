<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>鲜花订购：注册页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/jkxyflower.css">


</head>

<body>
<jsp:include page="head.jsp"></jsp:include>
	<div
		style="clear: both;float:right;padding-top: 100px;padding-right: 200px;">
		<center>
			<s:property value="#request.msg" />
			<br>
			<br><s:text name="login.title"></s:text>
			<s:token></s:token>
			<s:form action="/login/checkUser.action" method="post">
				<s:textfield name="user.username" key="login.username"></s:textfield>
				<s:password name="user.password"  key="login.password"></s:password>
				<s:hidden name="user.role" value="customer"></s:hidden>
				<s:submit value="%{getText('login.submit')}"></s:submit>
			</s:form>
				<br/>
				<a href="changeLanguage?request_locale=zh_CN">中文</a>
				<a href="changeLanguage?request_locale=en_US">English</a>
		</center>
	</div>
</body>
</html>
