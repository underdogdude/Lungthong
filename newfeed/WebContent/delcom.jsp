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
	<c:if test="${param.p_id !=null}">
	<form>
		<sql:update dataSource="jdbc/lungthong" var="rs2">
			UPDATE `lungthong`.`post` SET `stat`='del' WHERE `post_id`="${param.p_id}";
		</sql:update>
	<c:redirect url="timeline.jsp"/>
	</form>
	</c:if>
</body>
</html>