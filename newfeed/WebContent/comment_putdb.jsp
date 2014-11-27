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
	<c:if test="${param.com !=null}">
	<form action="comment.jsp?id=${param.id}">
		<sql:update dataSource="jdbc/lungthong" var="rs2">
			INSERT INTO comment (`text`, `owner`, `post_id`) VALUES ("${param.com}", ${user}, ${param.id});
		</sql:update>
		<jsp:forward page="comment.jsp"> 
			<jsp:param name="id" value="${param.id}"/> 
		</jsp:forward>
	<c:redirect url="http://localhost:8080/newfeed/comment.jsp?id=${param.id}"/>
	</form>
	</c:if>
</body>
</html>