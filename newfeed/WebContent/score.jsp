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
	<c:if test="${param.scoresl !=null}">
	<form >
		<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from vote where owner=${param.idscore};
		</sql:query>
		----------------${param.idscore}--------------------<br>
		++++++++++++++++${param.scoresl }+++++++++++++++++++<br>
		<c:set var="check" value="0"/>
		<c:forEach var="i" items="${rs.rows}">
			<c:if test="${user==i.voter}">
				<c:set var="check" value="1"/>
			</c:if>
		</c:forEach>
		<c:if test="${check==0}">
			<sql:query dataSource="jdbc/lungthong" var="rs1">
				select * from member where user_id=${param.idscore};
			</sql:query>
			<c:forEach var="i" items="${rs1.rows}">
				${i.score }<br>
				${i.voter }
				<sql:update dataSource="jdbc/lungthong" var="insert">
					UPDATE member SET `score`='${param.scoresl+i.score }', `voter`='${i.voter+1}' WHERE `user_id`='${param.idscore }';
				</sql:update>
				<sql:update dataSource="jdbc/lungthong" var="insertvote">
					INSERT INTO `lungthong`.`vote` (`owner`, `voter`) VALUES ('${param.idscore}', '${user}');
				</sql:update>
			</c:forEach>
		</c:if>
		<c:if test="${check!=0}">
			
		</c:if>
		
		<%-- <jsp:forward page="profile.jsp"> 
			<jsp:param name="id" value="${param.idscore}"/> 
		</jsp:forward> --%>
	 <c:redirect url="profile.jsp?id=${param.idscore}"/>
	</form>
	</c:if>
</body>
</html>