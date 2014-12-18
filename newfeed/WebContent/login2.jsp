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
	<link href="dist/css/spinner.css" rel="stylesheet">
    
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body style="background">
	<div class="container" align="center">
    	<span id="logo">   
        <img src="img/icon/logo_longthong.png" id="login__logo"/>
        
        <p style="font-size:50px;font-family:'Comic Sans MS', cursive;font-weight:bold;">LUNGTHONG</p>
        <p style="font-size:20px; color:#F00"> Online Invert Market</p>
		</span>
        <div class="spinner" id="spinner">
  		<div class="rect1"></div>
  		<div class="rect2"></div>
  		<div class="rect3"></div>
  		<div class="rect4"></div>
 	 	<div class="rect5"></div>
		</div>
        <div class="col-xs-6 col-xs-offset-3" id="button" style="display:none">                   
        <a class="btn-danger btn-block btn-lg"  href="javascript: showregister();">Sign Up</a>
        <a class="btn-default btn-block btn-lg"  href="javascript: showlogin();">Login</a>
         <a href="javascript: forgetpass();">forget password</a>
		</div>
        
        <div class="col-xs-8 col-xs-offset-2">
        <form class="form-signin" role="form" id="loginform" style="display:none">
        
        <input type="text" id="inputEmail" class="form-control" placeholder="Username" required autofocus name="user">
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="pass">
 		<input type="hidden" name="logincheck" value="true">      
       
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </form>
      	</div>
        <div class="col-xs-8 col-xs-offset-2" id="choosebutton" style="display:none">
        <a class="btn-info btn-block btn-lg"  href="javascript: showCustomer();">Sign Up As Customer</a>
        <br>
		<br>
        <a class="btn-success btn-block btn-lg"  href="javascript: showShop();">Sign Up As Shop</a>
        </div>
        
        <div class="col-xs-8 col-xs-offset-2" id="customerform"  style="display:none">
        
        <form class="form" role="form" >
        <h1 style="color:#FFF"> Register</h1>
        <p> <input name="user" type="text" id="username" class="form-control" placeholder="Username" required autofocus></p>
        <p> <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
        <p><input name="passag" type="password" id="inputCPassword" class="form-control" placeholder="Confirm Password" required></p>
        <p><input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email" required></p>
        <p><input name="emailag" type="email" id="inputCEmail" class="form-control" placeholder="Email Confirm" required></p>
        <input type="hidden" name="regischeck" value="true">
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        </div>
        
         <div class="col-xs-8 col-xs-offset-2" id="shopform" style="display:none">
        <form class="form" role="form" >
        <h1 style="color:#FFF"> Shop Form</h1>
        <p> <input name="user" type="text" id="username" class="form-control" placeholder="Username" required autofocus></p>
        <p> <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
        <p><input name="passag" type="password" id="inputCPassword" class="form-control" placeholder="Confirm Password" required></p>
        <p><input name="email" type="email" id="inputEmail" class="form-control" placeholder="Email" required></p>
        <p><input name="emailag" type="email" id="inputCEmail" class="form-control" placeholder="Email Confirm" required></p>
        <input type="hidden" name="regischeck" value="true">
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        </div>
    </div>

 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/login.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
    
    <c:if test="${param.logincheck!=null}">
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
			${stat}
		</form>
    </c:if>
    <c:if test="${param.regischeck!=null}">
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
	${stat}
	</form>
    </c:if>
  </body>
</html>
