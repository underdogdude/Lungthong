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

    
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body>
	<div class="container" style="padding-bottom:70px;">
    	<div class="row navbar-fixed-top" id="top">
        <img src="img/Topmenu/logo_longthong1.png" id="profile_icon"/>
        <sql:query dataSource="jdbc/lungthong" var="usernameq">
			select * from member where user_id="${user}";
		</sql:query>
        <p id="username_text">${usernameq.rows[0].username}</p>
        <a href= "profile_setting.jsp"><img src="img/Topmenu/profile button.png" id="setting_icon"></a>
        </div>
        
        
		<div class="col-xs-10 col-xs-offset-1" id="main">
        	<h1 style="font-weight:bold">In Progress</h1>
            
            <sql:query dataSource="jdbc/lungthong" var="rs">
				select * from post where user_id=${user} and stat="yes";
			</sql:query>
			<c:forEach items="${rs.rows}" var="i">
                <div class="inprogess row">
                    <div class="col-xs-5" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail_his img-responsive" /></a></div>
                    <div class="col-xs-7">
                    <h1 id="topic_name"><a href= comment.jsp?id=${i.post_id} style="color:black">${i.head}</a></h1>
                    
                    <span class="label label-info">${i.type}</span>
                    <span class="label label-info">${i.style}</span>
                    <span class="label label-info">${i.colour}</span>
                    
                    <p class="price">Price:${i.minp} - ${i.maxp}</p>
                	<p class="price">Post By ${usernameq.rows[0].username}</p>
                    </div>
                </div> 
              </c:forEach>
           
            <hr>
             <h1 style="font-weight:bold">Complete</h1>
             
             <sql:query dataSource="jdbc/lungthong" var="rs2">
				select * from post where user_id=${user} and stat="complete";
			</sql:query>
			<c:forEach items="${rs2.rows}" var="i">
            <div class="complete row">
            	<div class="col-xs-5" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail_his img-responsive" /></a></div>
                <div class="col-xs-7">
                <h1 id="topic_name"><a href= comment.jsp?id=${i.post_id} style="color:black">${i.head}</a></h1>
                <span class="label label-info">${i.type}</span>
                <span class="label label-info">${i.style}</span>
                <span class="label label-info">${i.colour}</span>
                
                <p class="price">Price:${i.minp} - ${i.maxp}</p>
                <p class="price">Post By ${usernameq.rows[0].username}</p>
                </div>
            </div> 
			</c:forEach>	
     	</div>
		</div>
       
      </div>  
       

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>