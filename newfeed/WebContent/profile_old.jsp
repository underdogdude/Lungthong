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
	<sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member where user_id=${param.id};
	</sql:query>
	<c:forEach var="i" items="${rs.rows}">
		Username:${i.username} <img src="${i.pic}"><br>
		Name:${i.name}<br>
		Surname:${i.surname}<br>
		Address:${i.address}<br>
		Telephone:${i.tel}<br>
		Social:${i.social}<br>
	</c:forEach>
</form>
</body>
</html>