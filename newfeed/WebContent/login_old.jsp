<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form>
	<h1>Login</h1><br>
	Username:<input type="text" name="user"/><br>
	Password:<input type="password" name="pass"/><br>
	<input type="submit" value="Login"/> 

</form>
<c:if test="${param.user !=null && param.pass!=null}">
<form>
	<sql:query dataSource="jdbc/test" var="rs">
		select * from member;
	</sql:query>
	<c:set var="stat" value="fail"/>
	<c:forEach var="i" items="${rs.rows}">
		<c:if test="${param.user.equals(i.username)}">
			<c:if test="${param.pass.equals(i.password)}">
					<c:set var="stat" value="success"/>
			</c:if>
		</c:if>
	</c:forEach>
	${stat}
</form>
</c:if>
</body>
</html>