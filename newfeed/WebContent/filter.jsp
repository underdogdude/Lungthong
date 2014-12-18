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

    <link href="dist/css/search.css" rel="stylesheet">
    <link href="starter-template.css" rel="stylesheet">
    <script src="assets/js/ie-emulation-modes-warning.js"></script>
    
    <script src="http://code.jquery.com/jquery-2.0.3.min.js" data-semver="2.0.3" data-require="jquery"></script>
  	<script type="text/javascript" src="http://www.appelsiini.net/projects/chained/jquery.chained.js?v=0.9.10"></script>
  	<script src="script.js"></script>
  	
  </head>

  <body>
	<div id="timeline">
    	<div class="row navbar-fixed-top" id="top">
            <img src="img/Topmenu/logo_longthong1.png" id="profile_icon"/>
            <sql:query dataSource="jdbc/lungthong" var="usernameq">
				select * from member where user_id="${user}";
			</sql:query>
        	<p id="username_text">${usernameq.rows[0].username}</p>
            <a href= "profile_setting.jsp"><img src="img/Topmenu/profile button.png" id="setting_icon"></a>
       </div>
        	<form>
            <div id="search_menu">
                <div class="row">
               	<div class="col-xs-8" id="dropdownbox">
                <div class="col-xs-4">
                    <select class="form-control" id="type" name="type">
   	 					<option value="' or '1'='1">all</option>
    					<option value="Tops">Tops</option>
    					<option value="Bottoms">Bottoms</option>
    					<option value="Shoes">Shoes</option>
    					<option value="Accessories">Accessories</option>
  					</select>
               </div>
               <div class="col-xs-4">
                    <div class="col-md-3 col-xs-6">
       				<select class="form-control" id="style" name="style">
						<option value="' or '1'='1" class="' or '1'='1">All</option>
    					<option value="' or '1'='1" class="Tops">All</option>
    					<option value="T-shirt" class="Tops">T-Shirt</option>
    					<option value="Shirt" class="Tops">Shirt</option>
    					<option value="Jacket" class="Tops">Jacket</option>
    					<option value="' or '1'='1" class="Bottoms">All</option>
    					<option value="Jeans" class="Bottoms">Jeans</option>
    					<option value="Shorts" class="Bottoms">Shorts</option>
    					<option value="Skirt" class="Bottoms">Skirt</option>
    					<option value="Trousers" class="Bottoms">Trousers</option>
    					<option value="' or '1'='1" class="Accessories">All</option>
    					<option value="Hat" class="Accessories">Hat</option>
    					<option value="Cap" class="Accessories">Cap</option>
    					<option value="Watch" class="Accessories">Watch</option>
    					<option value="' or '1'='1" class="Shoes">All</option>
    					<option value="Sandals" class="Shoes">Sandals</option>
    					<option value="Sneakers" class="Shoes">Sneakers</option>
    					<option value="Boots" class="Shoes">Boots</option>
  					</select>
               </div>
               <div class="col-xs-4"> 
                    <select class="form-control" name= "colour">
						<option value="' or '1'='1">All</option>
						<option value="Red">Red</option>
						<option value="Green">Green</option>
						<option value="Blue">Blue</option>
						<option value="Black">Black</option>
						<option value="Grey">Grey</option>
						<option value="Orange">Orange</option>
						<option value="Yellow">Yellow</option>
						<option value="Purple">Purple</option>
		</select>
                 </div>
                </div>
                 <div class="col-xs-4">
                    <button type="submit" class="btn-info btn-block btn-lg search_btn"><span class="glyphicon glyphicon-search"></span> Search</button>
                 </div>
                 </div>
            </div>
        </div>
		</form>
	

        <div class="col-xs-10 col-xs-offset-1" style="margin-top:150px;">
        
        
        <c:if test="${param.colour !=null }">
        <form>
        <sql:query dataSource="jdbc/lungthong" var="rs">
			SELECT * FROM lungthong.post where (type='${param.type}') and (style= '${param.style}') and (colour= '${param.colour}') and stat="yes";
		</sql:query>
		<c:forEach items="${rs.rows}" var="i">
            <div class="searchtopic row">
            	<div class="col-xs-5" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-7">
                <h1 id="topic_name"><a href= comment.jsp?id=${i.post_id} style="color:black;">${i.head}</a></h1>
                
                <span class="label label-info">${i.type}</span>
                <span class="label label-info">${i.style}</span>
                <span class="label label-info">${i.colour}</span>
                
                <p class="price">Price: ${i.minp} - ${i.maxp}</p>
                <sql:query dataSource="jdbc/lungthong" var="name">
				 select * from member where user_id="${hot.rows[0].user_id}";
			</sql:query>
                <p class="price">Post By ${name.rows[0].username}</p>
                </div>
            </div>
            </c:forEach>
            </form>
          </c:if>  
             	
     	</div>
		</div>
       
      </div>  
     

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>