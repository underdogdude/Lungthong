<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8" />
  <title></title>
  <link href="style.css" rel="stylesheet" />
  <script src="http://code.jquery.com/jquery-2.0.3.min.js" data-semver="2.0.3" data-require="jquery"></script>
  <script type="text/javascript" src="http://www.appelsiini.net/projects/chained/jquery.chained.js?v=0.9.10"></script>
  <script src="script.js"></script>
</head>

<body>
	<form>
	<h1>New feed</h1>
  <select class="form-control" id="type" name="type">
    <option value="' or '1'='1">all</option>
    <option value="Tops">Tops</option>
    <option value="Bottoms">Bottoms</option>
    <option value="Shoes">Shoes</option>
    <option value="Accessories">Accessories</option>
  </select>
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
	<select name= "colour">
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
	<input type="submit"  value ="Search"><br>
	</form>
	<c:if test="${param.colour !=null }">
	<form action="comment.jsp">
	<sql:query dataSource="jdbc/lungthong" var="rs">
			sELECT * FROM lungthong.post where (type='${param.type}') and (style= '${param.style}') and (colour= '${param.colour}');
	</sql:query>
	<c:forEach items="${rs.rows}" var="i">
		<div class="container">
    	<div class="row navbar-fixed-top" id="top" align="right">
        </div>
		<div class="col-xs-10 col-xs-offset-1" id="main">
           	<div class="mytopic row">
            	<div class="col-xs-4" align="center"><a href= comment.jsp?id=${i.post_id}><img src="${i.pic}" class="thumbnail img-responsive" /></a></div>
                <div class="col-xs-8">
                <h1 id="mytopic_name"><a href= comment.jsp?id=${i.post_id}>${i.head}</a></h1>
                <h3>
                <span class="label label-info">${i.type}</span>
                <span class="label label-info">${i.style}</span>
                <span class="label label-info">${i.colour}</span>
                <span class="label label-info">${i.size}</span>
                </h3>
                <h3 id="mytopic_price">Price ${i.minp} - ${i.maxp}</h3>
                </div>
            </div> 	
     	</div>
		</div>
	</c:forEach>
</form>
</c:if>
</body>
</html>