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
	<form action="comment_putdb.jsp">
	<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from post where post_id= ${param.id};
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
		${i.head}  <img src="${i.pic}"><br>
		${i.comment}<br>
		<sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from member where user_id= ${i.user_id};
		</sql:query>
		<c:forEach items="${rs2.rows}" var="k">
			by <a href= profile.jsp?id=${i.user_id}>${k.username}</a>  <br>
		</c:forEach>  
	</c:forEach>
	----------------------------------------------------<br>
	---------------------------------------------------<br>
	<sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from comment where post_id= ${param.id};
	</sql:query>
	<c:forEach items="${rs2.rows}" var="j">
		${j.text}<br>
		<sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from member where user_id= ${j.owner};
		</sql:query>
		<c:forEach items="${rs2.rows}" var="k">
			by <a href= profile.jsp?id=${k.user_id}>${k.username}</a>  <br>
		</c:forEach>
		_______________________________________________<br>
	</c:forEach>
	<input type="text" name="com" ><br>
	<input type="hidden" name="id" value="${param.id}">
	<input type='submit' value='post'>
	</form>
</body>
</html>