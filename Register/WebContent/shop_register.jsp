<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
	<h1>Register</h1>
	Username:<br><input type="text" name="user"/><br>
	Password:<br><input type="password" name="pass"/><br>
	Confirm Password:<br><input type="password" name="passag"/><br>
	
	Email:<br><input type="text" name="email"/><br>
	Confirm Email:<br><input type="text" name="emailag"/><br>
	
	<input type="submit" value="Register"/> 
</form>
<c:if test="${param.user !=null && param.pass!=null}">
	<form>
	<sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member;
	</sql:query>
	<c:set var="stat" value="start"/>
	<c:set var="value" value="start"/>
	<c:forEach var="i" items="${rs.rows}">
		<c:if test="${param.user.equals(i.username)}">
			<c:set var="stat" value="Username is already used"/>
		</c:if>
		<c:if test="${stat.equals(value)}">
			<c:if test="${param.pass.length()<6}">
				<c:set var="stat" value="The password your enter at least 6 character."/>
			</c:if>
		</c:if>
		<c:if test="${stat.equals(value)}">
			<c:if test="${param.pass !=param.passag}">
				<c:set var="stat" value="The password your enter doesn't match."/>
			</c:if>
		</c:if>
		<c:if test="${stat.equals(value)}">
			<c:if test="${param.email !=param.emailag}">
				<c:set var="stat" value="The email your enter doesn't match."/>
			</c:if>
		</c:if>
		<c:if test="${stat.equals(value)}">
			<sql:update dataSource="jdbc/lungthong" var="selected">
				INSERT INTO `lungthong`.`member` (`username`, `password`, `email`, `role`) VALUES ('${param.user}', '${param.pass}', '${param.email}', 'shop');

				<c:set var="stat" value="Success"/>
			</sql:update>
		</c:if>
	</c:forEach>
	${stat}
</form>
</c:if>
</body>
</html>