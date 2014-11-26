<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="img/logo_lungthong.png">

    <title>LungThong - Invert Online Market</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="dist/css/topic.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>
  <c:set var="user" value="1"/> ไอดีผู้ใช้ๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ<br>
	<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from post where post_id= ${param.id};
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
	<c:if test="${i.user_id==user}">
			<form action="delcom.jsp">
			<input type="hidden" name="p_id" value="${i.post_id}">
			<input type='submit' value='Delete'>
			</form>
			<form action="editre.jsp" >
			<input type="hidden" name="p_id" value="${param.id}">
			<input type='submit' value='Edit'>
			</form>
			<form action="lock.jsp">
			<input type="hidden" name="p_id" value="${i.post_id}">
			<input type='submit' value='Finish'><br>
			</form>
	</c:if>
	<div class="container" >
   	<div class="row" id="topic_info" align="center">  
   <span id="topic_name"><h3>${i.head}</h3></span>
   <h3 id="mytopic_price">Price ${i.minp} - ${i.maxp}</h3>
    <img src="${i.pic}" id="product_pic">
  <hr>
      <c:if test="${param.edit!=null}">
			<form action="editdb.jsp">
			<input type="hidden" name="p_id" value="${param.id}">
			<textarea class="form-control" rows="2" name="com">${i.comment}</textarea>
			<input type='submit' value='edit'>
			</form>
		</c:if>
		<c:if test="${param.edit==null}">
			<textarea class="form-control" rows="2" disabled>${i.comment}</textarea> 
		</c:if>
		<h3>
      <span class="label label-info">${i.type}</span>
      <span class="label label-info">${i.style}</span>
      <span class="label label-info">${i.colour}</span>
      </h3>
       <sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from member where user_id= ${i.user_id};
		</sql:query>
		<c:forEach items="${rs2.rows}" var="k">
			by <a href= profile.jsp?id=${i.user_id}&p_id=${param.id}>${k.username}</a>  <br>
		</c:forEach>   
       
    </div>
    </c:forEach>
    <sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from comment where post_id= ${param.id};
	</sql:query>
	<c:forEach items="${rs2.rows}" var="j">
    <div id="comment_row" class="row">
    <div class="col-xs-4" align="right">
    <sql:query dataSource="jdbc/lungthong" var="rs3">
			select * from member where user_id= ${j.owner};
	</sql:query>
	<c:forEach items="${rs3.rows}" var="k">
     <img src="${k.pic}" class="img-circle" id="profile_comment_pic">
     </div>
     <div class="col-xs-8">
			<h2><a href= profile.jsp?id=${k.user_id}&p_id=${param.id}>${k.username}</a></h2>
	</c:forEach>
     </div>
     <hr>
	<p>${j.text}</p>
    </div>
    </c:forEach>
    <form action="comment_putdb.jsp">
	<input type="hidden" name="id" value="${param.id}">
	<textarea class="form-control" rows="2" name="com"></textarea> 
	<input type='submit' value='post'>
	</form>
    
       <div class="row navbar-fixed-bottom" id="bottom_menu" align="center">
        <img src="img/icon/selection.png"  class="selection">
       <img src="img/icon/timeline.png"  class="img-rounded">
       <img src="img/icon/snap.png"  class="img-rounded">
       <img src="img/icon/search.png"  class="img-rounded">
       <img src="img/icon/history.png"  class="img-rounded">
       </div>

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    
  </body>
</html>
