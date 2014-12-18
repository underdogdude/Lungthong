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

  <body id="timeline">
	<div class="container">
    	<div class="row navbar-fixed-top" id="top">
        <img src="img/Topmenu/logo_longthong1.png" id="profile_icon"/>
        <sql:query dataSource="jdbc/lungthong" var="usernameq">
			select * from member where user_id="${user}";
		</sql:query>
        <p id="username_text">${usernameq.rows[0].username}</p>
         <a href= "profile_setting.jsp"><img src="img/Topmenu/profile button.png" id="setting_icon"></a>
        </div>
        	<sql:query dataSource="jdbc/lungthong" var="type">
				SELECT count(*) as you , type FROM lungthong.post  group by type order by you desc ;
			</sql:query>
			<sql:query dataSource="jdbc/lungthong" var="hot">
				 select * from post where type="${type.rows[0].type}";
			</sql:query>
        	<sql:query dataSource="jdbc/lungthong" var="hotname">
				 select * from member where user_id="${hot.rows[0].user_id}";
			</sql:query>	
		<div class="col-xs-10 col-xs-offset-1" id="main">
        	<h1 style="font-weight:bold">HOT TOPIC</h1>
           	<div class="hottopic row">
            <img src="img/timeline/topic1/Shape 1.png" id="top_star">
            	<div class="col-xs-5" align="center"><a href= comment.jsp?id=${hot.rows[0].post_id}><img src="${hot.rows[0].pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-7">
                <h1 id="topic_name"><a href= comment.jsp?id=${hot.rows[0].post_id}  style="color: white;"> ${hot.rows[0].head}</a></h1>
                
               <div class="tag">${hot.rows[0].type}</div>
                <div class="tag">${hot.rows[0].style}</div>
                <div class="tag">${hot.rows[0].colour}</div>
                
                <p class="price">Price:${hot.rows[0].minp}-${hot.rows[0].maxp}</p>
                <p class="price">Post By ${hotname.rows[0].username}</p>
                </div>
            </div> 
            <hr>
            
            <sql:query dataSource="jdbc/lungthong" var="rs">
				select * from post where stat="yes";
			</sql:query>
			<h1 style="font-weight:bold">TIMELINE</h1>
            <c:forEach items="${rs.rows}" var="i">
        
            <div class="topic row">
            	<div class="col-xs-5" align="center"><a href= comment.jsp?id=${i.post_id} ><img src="${i.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-7">
                <h1 id="topic_name" ><a href= comment.jsp?id=${i.post_id} style="color: white;">${i.head}</a></h1>
                <div class="tag">${i.type}</div>
                <div class="tag">${i.style}</div>
               <div class="tag">${i.colour}</div>
                
                <p class="price">Price:${i.minp}-${i.maxp}</p>
                <sql:query dataSource="jdbc/lungthong" var="name">
					select * from member where ${i.user_id};
				</sql:query>
                <p class="price">Post By ${name.rows[0].username}</p>
                </div>
            </div> 
            </c:forEach>
				
     	</div>
		</div>
       
      
       

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
