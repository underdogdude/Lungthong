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

    <link href="dist/css/topic.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
  </head>

  <body id="topic">
  <sql:query dataSource="jdbc/lungthong" var="rs">
			select * from post where post_id= ${param.id};
	</sql:query>
	
  <a href= "timeline.jsp"><img src="img/profile/BACK.png" id="post_back"></a>
	<div class="container" style="padding-bottom:40px;">
    <div class="col-xs-10 col-xs-offset-1">
    <c:forEach items="${rs.rows}" var="i">
   	<div class="row" id="topic_info">  
        <p id="topicin_name" >${i.head}</p>
        <div class="row" style="margin:10px;">
            <div class="col-xs-8" align="center">
                 <img src="${i.pic}" id="product_pic" class="img-responsive">
            </div>
            <div class="col-xs-4">
               <div class="tag">${i.type}</div><br>
               <div class="tag">${i.style}</div><br>
               <div class="tag">${i.colour}</div><br>

            </div>
       </div>
       <!--<div class="row" style="margin:10px;">
            <div class="col-xs-3" align="center">
            	<img src="img/post/Group 1/Layer 1.png"/ class="img-responsive" style="max-height:100px;">
            </div>
             <div class="col-xs-5" align="center" id="post_user">
            	<p style="font-weight:bold">Username</p>
            </div>
             <div class="col-xs-4" align="center" id="post_date">
            	<p style="font-weight:bold">Post Date:</p> XXXXXXX
            </div>
      </div> --> 
  
    <c:if test="${param.edit!=null}">
			<form action="editdb.jsp">
			<input type="hidden" name="p_id" value="${param.id}">
			<textarea class="form-control" rows="2" name="com">${i.comment}</textarea>
			<input type='submit' value='edit'>
			</form>
		</c:if>
		<c:if test="${param.edit==null}">
			<textarea class="form-control" rows="2" disabled>${i.comment}</textarea> 
		</c:if>
		<div class="row" style="margin-top:10px;">
			<c:if test="${i.user_id==user}">
				<form action="delcom.jsp">
				<div class="col-xs-5" align="right">
				<button type="submit"  class="profile_btn" style="background-color:#ffdd20"><img src="img/profile/complete.png" class="img-responsive"> </button>  
				<input type="hidden" name="p_id" value="${i.post_id}">
				</div>
			</form>
			<form action="editre.jsp" >
			<div class="col-xs-2" align="center">
				<button type="submit"  class="profile_btn" style="background-color:#ffdd20"><img src="img/profile/editpost.png" class="img-responsive"> </button>
				<input type="hidden" name="p_id" value="${param.id}">
			</div>
			</form>
			<form action="lock.jsp" >
			<div class="col-xs-5" align="left">
			<button type="submit"  class="profile_btn" style="background-color:#ffdd20"><img src="img/profile/delete.png" class="img-responsive"> </button>
			</div>
			</form>
	</c:if>
		</div>
       
   	</div>
    </c:forEach>
    <sql:query dataSource="jdbc/lungthong" var="rs2">
			select * from comment where post_id= ${param.id};
	</sql:query>
	<c:forEach items="${rs2.rows}" var="j">
	<sql:query dataSource="jdbc/lungthong" var="rs3">
			select * from member where user_id= "${j.owner}";
	</sql:query>
	<c:forEach items="${rs3.rows}" var="k">
    <div class="row" style="margin-top:20px; background-color:#FF9">
        <div class="col-xs-2">
            <img src="${k.pic}" style="max-height:80px;margin-bottom: 20px;" id="cm_pic">
        </div>
        <div class="col-xs-8" style="margin-top:20px;padding-left: 60px;">
            <span style="font-size:20px;font-weight:bold"><a href= profile.jsp?id=${k.user_id}&p_id=${param.id}>${k.username}</a></span>
        </div>
         <div class="col-xs-2" style="margin-top:20px;" align="right">
        </div>
        <div class="col-xs-10 col-xs-offset-1" style="margin:10px; margin-top:-20px; background-color:#FFF">
        	${j.text}
        </div>
        
    </div>
    </c:forEach>
    </c:forEach>
    </div>
    <form action="comment_putdb.jsp">
    <input type="hidden" name="id" value="${param.id}">
    <div class="navbar navbar-fixed-bottom" id="comment_row">
         <div class="col-xs-9">
         	<input type="text" name="com" class="form-control"/>
         </div>
         <div class="col-xs-3">
         
         <button type="submit" style="background-color:#E7AE05">
         <img  id="post_btn" src="img/topic/post comment/Post.png">
          </button> 
         	
         	
         
         </div>
     </div>
     </form>
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
