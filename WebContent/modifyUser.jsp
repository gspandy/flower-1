<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <jsp:include page="head.jsp"></jsp:include>
	<div class="content">
		<div class="left">	
       	</div>
		<div class="right">
			<div style="padding-left:400px;width:600px">
				<s:form action="updateUserDetail.action" method="post">
					<s:textfield name="userdetail.truename" value="%{#session.user.userdetail.truename}"></s:textfield>
				</s:form>
			</div>
			</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
