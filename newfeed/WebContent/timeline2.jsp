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
  <form>
  	<c:if test="${user==null }">
  		<br><br><br><br><br><br><br><br><br><br>5555555555555555555555555555555555555555555555555555555555555555<img src="WebContent/dukeWaving.png">
		
	</c:if>
  	<sql:query dataSource="jdbc/lungthong" var="rs">
			select * from post where stat="yes";
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
	<div class="container">
    	<div class="row navbar-fixed-top" id="top" align="right">
        <a href= "profile_setting.jsp"><img src="img/icon/setting.png" id="setting_icon"></a>
        </div>
		<div class="col-xs-10 col-xs-offset-1" id="main">
           	<div class="mytopic row">
            	<div class="col-xs-4" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-8">
                <h1 id="mytopic_name"><a href= comment.jsp?id=${i.post_id} style="color:white">${i.head}</a></h1>
                <h3>
                <span class="label label-info">${i.type}</span>
                <span class="label label-info">${i.style}</span>
                <span class="label label-info">${i.colour}</span>
                </h3>
                <h3 id="mytopic_price">Price ${i.minp} - ${i.maxp}</h3>
                </div>
            </div> 
            </div> 
				
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
    </c:forEach>
    </form>
  </body>
</html>
