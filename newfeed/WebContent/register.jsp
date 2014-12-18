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
  
  	  <!--Register form-->
         <div class="col-xs-10 col-xs-offset-1" id="registerform">
        <form class="form" role="form" >
        <div class="row">
        	<img src="img/login/top layout/logo_longthong1.png" class="img-responsive"/>
        </div>
        <p class="regis_text">Username:</p><input type="text" name="user" id="username" class="form-control regis_input" required autofocus>
        <p class="regis_text">Password:</p><input type="password" name="pass" id="inputPassword" class="form-control regis_input" required>
        <p class="regis_text">Confirm Password</p><input type="password" name="passag" id="inputCPassword" class="form-control regis_input" required>
        <p class="regis_text">Email:</p><input type="email" name="email" id="inputEmail" class="form-control regis_input" required>
        <p class="regis_text">Confirm Email:</p><input type="email" name="emailag" id="inputCEmail" class="form-control regis_input"  required>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        <button class="btn btn-lg btn-info btn-block" type="submit" onClick="javascript:window.location='home.jsp'">Back</button>
        </div>
    </div>
	<c:if test="${param.user!=null}">
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
		<%-- <c:if test="${stat.equals(value)}">
			<c:if test="${param.pass.length()<6}">
				<c:set var="stat" value="The password your enter at least 6 character."/>
			</c:if>
		</c:if>--%>
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
				INSERT INTO `lungthong`.`member` (`username`, `password`, `email`, `role`,`pic`) VALUES ('${param.user}', '${param.pass}', '${param.email}', 'user','http://localhost:8080/newfeed/img/icon/logo_longthong.png');

				<c:set var="stat" value="Success"/>
			</sql:update>
		</c:if>
	</c:forEach>
	<p  style="color:red;text-align: center;margin-bottom: 50px;font-size: 30px;" > ${stat} </p>
	</form>
    </c:if>
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/login.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
