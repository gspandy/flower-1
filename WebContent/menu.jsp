<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'menu.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<%-- <s:property value="#request.msg"/><br/>
	nihaoa <br/>
	<%=request.getAttribute("msg") %> --%>
	<s:iterator value="#request.catalogs" var="cata">
		<a href="browseFlowerPaging.action?catalogid=
		    <s:property value=
		    "#cata.catalogid"/>
    &currentPage=1" target="_self">
	<s:property value="#cata.catalogname"/></a>   
     <br><br>
	</s:iterator>
</body>
</html>
