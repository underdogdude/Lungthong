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
	<h1>History Shop</h1>
	<c:set var="user" value="4"/>
	<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from comment where owner=${user};
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
		<sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from post where post_id=${i.post_id};
		</sql:query>
		<c:forEach items="${rs2.rows}" var="j">
			<div class="container">
    		<div class="row navbar-fixed-top" id="top" align="right">
       	 	</div>
			<div class="col-xs-10 col-xs-offset-1" id="main">
           	<div class="mytopic row">
            	<div class="col-xs-4" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${j.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-8">
                <h1 id="mytopic_name"><a href= comment.jsp?id=${i.post_id}>${j.head}</a></h1>
                <h3>
                <span class="label label-info">${j.type}</span>
                <span class="label label-info">${j.style}</span>
                <span class="label label-info">${j.colour}</span>
                <span class="label label-info">${j.size}</span>
                </h3>
                <h3 id="mytopic_price">Price ${j.minp} - ${j.maxp}</h3>
                </div>
            </div> 	
     		</div>
			</div>
		</c:forEach>
	</c:forEach>
</form>
<form>
	
</form>
</body>
</html>