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
<form action="comment.jsp">
	<h1>History User</h1>
	<c:set var="user" value="1"/>
	<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from post where user_id=${user};
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
		<div class="container">
    	<div class="row navbar-fixed-top" id="top" align="right">
        </div>
		<div class="col-xs-10 col-xs-offset-1" id="main">
           	<div class="mytopic row">
            	<div class="col-xs-4" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-8">
                <h1 id="mytopic_name"><a href= comment.jsp?id=${i.post_id}>${i.head}</a></h1>
                <h3>
                <span class="label label-info">${i.type}</span>
                <span class="label label-info">${i.style}</span>
                <span class="label label-info">${i.colour}</span>
                <span class="label label-info">${i.size}</span>
                </h3>
                <h3 id="mytopic_price">Price ${i.minp} - ${i.maxp}</h3>
                </div>
            </div> 	
     	</div>
		</div>
	</c:forEach>
</form>
<form>
	
</form>
</body>
</html>