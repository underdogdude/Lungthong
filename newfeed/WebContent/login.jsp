<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="icon" href="img/logo_lungthong.png">
 	<link href="dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="dist/css/spinner.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    
    <title>LungThong - Invert Online Market</title>
   
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body style="background">
	<div class="container" align="center">
    <!--login form-->
    	<span id="logo">   	
        <img src="img/icon/logo_longthong.png" id="login__logo"/><br>

        
       	<img style="height:50px;margin:5px;" src="img/login/LUNG THONG.PNG"/><br>

        <img style="height:30px;margin:5px;" src="img/login/Invert Online Market.PNG"/><br>
		</span>
       
        
        <div class="col-xs-10 col-xs-offset-1">
        	<form class="form-signin" role="form" id="loginform">
        <div class="col-xs-8">
        	<input type="text" id="inputEmail" name="user" class="form-control" placeholder="Username" required autofocus style="margin-top:10px;">
        	<input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" required  style="margin-top:10px;">
       	</div>
        <div class="col-xs-4">
        	<button type="submit" style="height:100px;background-image:img/login/LOGIN2.PNG " ></button>
        </div>
        </form>
      	</div>
        
     
        
               
        
        
    </div>

 	<c:if test="${param.user!=null}">
    	<form>
			<sql:query dataSource="jdbc/lungthong" var="rs">
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
			<c:if test="${stat.equals('success')}">
				<sql:query dataSource="jdbc/lungthong" var="rs">
					select * from member where username="${param.user}";
				</sql:query>
				<c:forEach var="i" items="${rs.rows}">
					<c:set var="user" value="${i.user_id}" scope="session"/>
				</c:forEach>
				<c:redirect url="timeline.jsp"/>
			</c:if>
			<p  style="color:red;text-align: center;margin-bottom: 50px;font-size: 30px;" > ${stat} </p>
		</form>
    </c:if>
 	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/login.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
