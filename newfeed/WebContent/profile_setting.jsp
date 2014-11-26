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

    <link href="dist/css/profile.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>
  <c:set var="user" value="1"/> ไอดีผู้ใช้ๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆๆ<br>
  <form>
  	<sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member where user_id=${user};
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
            <input name="name" type="text" class="form-control" id="cus_name" placeholder="Name" value="${i.name}"><input name="surname" type="text" class="form-control" id="cus_surname" placeholder="Surname" value="${i.surname}"><br>
            <input name="tel" type="text" class="form-control" id="cus_tel" placeholder="Tel" value="${i.tel}"><br>
            <input name="social" type="text" class="form-control" id="cus_social" placeholder="Social" value="${i.social}">
         </div>
         <div class="col-xs-12">
           <textarea name="add" class="form-control" rows="4" >${i.address}</textarea>
         </div>
		</c:forEach>
         <div class="col-xs-8 col-xs-offset-2"><br>

         <button class="btn-warning btn btn-block" >Change Setting</button><br>
         </form>

          <button class="btn-danger btn btn-block">Logout</button><br>
         
         <button class="btn-info btn btn-block">Back</button>
         
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
  	<c:if test="${param.name!=null || param.tel!=null || param.social!=null || param.add!=null}">
  		<sql:update dataSource="jdbc/lungthong" var="rs">
			UPDATE `lungthong`.`member` SET `name`='${param.name}', `surname`='${param.surname}', `address`='${param.add}', `tel`='${param.tel}', `social`='${param.social}' WHERE `user_id`='${user}';
		</sql:update>
		<c:redirect url="profile_setting.jsp"/>
	</c:if>
  </body>
</html>