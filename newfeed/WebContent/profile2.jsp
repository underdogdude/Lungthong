<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="img/logo_lungthong.png">

    <title>LungThong - Invert Online Market</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="dist/css/profile.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body id="profile">
  
  	<sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member where user_id=${param.id};
	</sql:query>
	<c:forEach var="i" items="${rs.rows}">
	<div class="container" align="center">
    <h1>Customer Profile</h1>
    <hr>
    <div class="row" id="info_row" align="center">
        <div class="col-xs-6" align="center">
            <img id="profile_pic" class="img-responsive img-circle"  src="${i.pic}">
         </div>
          <div class="col-xs-6">
            <h1>${i.username}</h1><br>
            Name: ${i.name}  ${i.surname}<br>
            Telephone: ${i.tel}<br>
            Social: ${i.social}
         </div>
         <div class="col-xs-12">
          Address: ${i.address}
         </div>
		</c:forEach>
         <div class="col-xs-8 col-xs-offset-2"><br>
         <form action="score.jsp" method="post">
         	<input type="hidden" name="idscore" value="${param.id}">
         	<input type="submit" name="scoresl" value="1"><input type="submit" name="scoresl" value="2"><input type="submit" name="scoresl" value="3"><input type="submit" name="scoresl" value="4"><input type="submit" name="scoresl" value="5"><br>
         <sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from member where user_id=${param.id};
		</sql:query>
		<c:forEach var="i" items="${rs2.rows}">
			<c:if test="${i.voter==0}">
				0 from 0 user
			</c:if>
			<c:if test="${i.voter!=0}">
				<fmt:formatNumber var="score"
				value="${i.score/i.voter}"
				 maxFractionDigits="0"/>
				${score} from ${i.voter}
			</c:if>
		</c:forEach>
         </form>
         <form>
         <button type="button" class="btn-info btn btn-block" onClick="javascript:window.location='comment.jsp?id=${param.p_id}';">Back</button>
         </form>
         </div>
     </div>
     </div>  
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
