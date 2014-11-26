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
        
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
       
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
        <h1 style="color:#FFF"> Customer Form</h1>
        <p> <input type="text" id="username" class="form-control" placeholder="Username" required autofocus></p>
        <p> <input type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
        <p><input type="password" id="inputCPassword" class="form-control" placeholder="Confirm Password" required></p>
        <p><input type="email" id="inputEmail" class="form-control" placeholder="Email" required></p>
        <p><input type="email" id="inputCEmail" class="form-control" placeholder="Email Confirm" required></p>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        </div>
        
         <div class="col-xs-8 col-xs-offset-2" id="shopform" style="display:none">
        <form class="form" role="form" >
        <h1 style="color:#FFF"> Shop Form</h1>
        <p> <input type="text" id="username" class="form-control" placeholder="Username" required autofocus></p>
        <p> <input type="password" id="inputPassword" class="form-control" placeholder="Password" required></p>
        <p><input type="password" id="inputCPassword" class="form-control" placeholder="Confirm Password" required></p>
        <p><input type="email" id="inputEmail" class="form-control" placeholder="Email" required></p>
        <p><input type="email" id="inputCEmail" class="form-control" placeholder="Email Confirm" required></p>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        </form>
        </div>
    </div>

 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="dist/js/login.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
