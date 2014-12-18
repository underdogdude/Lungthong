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
  <form id="profile">
  <sql:query dataSource="jdbc/lungthong" var="rs">
		select * from member where user_id=${user};
	</sql:query>
	<c:forEach var="i" items="${rs.rows}">
  <a href= "timeline.jsp"><img src="img/profile/BACK.png" class="profile_back"></a>
	<div class="container" align="center">
    
    <div class="row" style="background-color:rgba(255, 225, 133,0.5);;margin:20px;padding:10px;margin-bottom:70px;color: white">
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
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Password</label>
          <div class="col-xs-8">
            <input class="form-control" type="password" id="sm" value="${i.password}" disabled="disabled">
          </div>
        </div>
		<!------------------------------------------>        
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Name</label>
          <div class="col-xs-8">
            <input name="name" class="form-control" type="text" id="sm" value="${i.name}" >
          </div>
        </div>
        <!------------------------------------------>        
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Surname</label>
          <div class="col-xs-8">
            <input name="surname" class="form-control" type="text" id="sm" value="${i.surname}" >
          </div>
        </div>
		<!------------------------------------------>         
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Tel</label>
          <div class="col-xs-8">
            <input name="tel" class="form-control" type="text" id="sm" value="${i.tel}">
          </div>
        </div>
		<!------------------------------------------>         
        <div class="form-group form-group-xs">
          <label class="col-xs-4 control-label profile_text" for="sm">Social</label>
          <div class="col-xs-8">
            <input name="social" class="form-control" type="text" id="sm" value="${i.social}" >
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
            <input name="add" class="form-control" type="text" id="sm" value="${i.address}" >
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
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
       </c:if>
		<c:if test="${score==1}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
		</c:if>
		<c:if test="${score==2}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 1.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
		</c:if>
		<c:if test="${score==3}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 1.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
		</c:if>
		<c:if test="${score==4}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 2.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 1.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
		</c:if>
		<c:if test="${score==5}">
			<img class="star" id="star1" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star2" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star3" src="img/profile/Shape 2.png"/>
       		<img class="star" id="star4" src="img/profile/Shape 2.png"/>
      		<img class="star" id="star5" src="img/profile/Shape 2.png"/>
      		<p>Vote from <span style="font-weight: bolder;color: red">${i.voter}</span> user</p>
		</c:if>
       </div>
       </div>
       </c:forEach>
       
       <div class="col-xs-6 col-xs-offset-3" style="margin-top:-60px;">
       		<!--for my profile-->
			<div class="col-xs-6" >
        	 <%-- <img src="img/profile/change.png" class="profile_btn img-responsive">--%>
			<button type="submit"  class="profile_btn btn btn-block" >
                	<img src="img/profile/change.png" class=" img-responsive">
                </button>
			</div>
			</form>
      	    <div class="col-xs-6" >
          	<%--<img src="img/profile/Logout.png" class="profile_btn img-responsive">--%>
         	<form action="logout.jsp">
          		<button type="submit"  class="profile_btn btn btn-block" >
                	<img src="img/profile/Logout.png" class=" img-responsive">
               </button>
         </form>
         	</div>
        
       </div>
        
   		</div>
   </div>
   </div>  
       
    <c:if test="${param.name!=null || param.tel!=null || param.social!=null || param.add!=null}">
  		<sql:update dataSource="jdbc/lungthong" var="rs">
			UPDATE `lungthong`.`member` SET `name`='${param.name}', `surname`='${param.surname}', `address`='${param.add}', `tel`='${param.tel}', `social`='${param.social}' WHERE `user_id`='${user}';
		</sql:update>
		<c:redirect url="profile_setting.jsp"/>
	</c:if>

	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
