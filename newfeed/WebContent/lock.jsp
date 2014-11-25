<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="user" value="5"/> ไอดีผู้ใช้ๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ
	<c:if test="${param.p_id !=null}">
	<form>
		<sql:update dataSource="jdbc/lungthong" var="rs2">
			UPDATE `lungthong`.`post` SET `stat`='finish' WHERE `post_id`="${param.p_id}";
		</sql:update>
		<jsp:forward page="newfeed.jsp">
			<jsp:param name="" value=""/>
		</jsp:forward>
	<c:redirect url="http://localhost:8080/newfeed/newfeed.jsp"/>
	</form>
	</c:if>
</body>
</html>