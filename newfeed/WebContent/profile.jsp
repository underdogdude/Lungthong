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

  <body>
  	<sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member where user_id=${param.id};
	</sql:query>
  <a href= "timeline.jsp"><img src="img/profile/BACK.png" class="profile_back"></a>
	<div class="container" align="center">
    
    <c:forEach items="${rs.rows}" var="i">
    
    <div class="row" style="background-color:#FBF87B;margin:20px;padding:10px;margin-bottom:70px;">
    <img id="profile_pic" class="img-responsive img-circle"  src="${i.pic}"/>
    
    	<div class="row" id="info_row" align="center">
        
         <h1>User Profile</h1>
         
         <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Username</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="${i.username}" disabled>
          </div>
        </div>
        <br>
		<!------------------------------------------>
        <%--<div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Password</label>
          <div class="col-xs-8">
            <input class="form-control" type="password" id="sm" value="${i.password}" disabled>
          </div>
        </div> --%>
		<!------------------------------------------>        
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Name</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="${i.name}  ${i.surname}" disabled>
          </div>
        </div>
		<!------------------------------------------>         
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">${i.tel}</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="${i.tel}" disabled>
          </div>
        </div>
		<!------------------------------------------>         
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Social</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="${i.social}" disabled>
          </div>
        </div>
		<!------------------------------------------>         
        <%-- <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Line</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="@big14531" disabled>
          </div>
        </div>--%>
		<!------------------------------------------>         
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Address</label>
          <div class="col-xs-8">
            <input class="form-control" type="text" id="sm" value="${i.address}" disabled>
          </div>
        </div>
		<!------------------------------------------>         
       </div>
       
       <div  id="starbox">
       <p class="profile_text" style="text-align: center;">Star Rate</p>
       <fmt:formatNumber var="score"
			value="${i.score/i.voter}"
		maxFractionDigits="0"/>
       
       <c:if test="${i.score==0}">
       		<c:set var="score" value="0"/>
       		<img class="star" id="star1" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>from ${i.voter}
       </c:if>
		<c:if test="${score==1}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>from ${i.voter}
		</c:if>
		<c:if test="${score==2}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>from ${i.voter}
		</c:if>
		<c:if test="${score==3}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>from ${i.voter}
		</c:if>
		<c:if test="${score==4}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 2.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>from ${i.voter}
		</c:if>
		<c:if test="${score==5}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 2.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 2.png"/>from ${i.voter}
		</c:if>
       </div>
     
       
       </c:forEach>
       <div class="col-xs-6 col-xs-offset-3" >
       		<!--for my profile-->
       		 <form>
       		<div class="col-xs-6 col-xs-offset-3">
            <%-- <img src="img/profile/vote.png" class="profile_btn img-responsive">--%>
            <input type="hidden" name="id" value="${param.id}">
            <input type="submit" name="vote" value="Vote">
            </div>
        	</form>
        	<c:if test="${param.vote!=null}">
        		<form action="score.jsp">
        		<br>
        		<input type="hidden" name="idscore" value="${param.id}">
        		<select name="scoresl">
  					<option value="1">1</option>
  					<option value="2">2</option>
  					<option value="3">3</option>
  					<option value="4">4</option>
  					<option value="5">5</option>
				</select>
				<input type="submit" value="Vote!!">
				</form>
        	</c:if>
       </div>
        
   		</div>
   </div>
   </div>  
       

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
