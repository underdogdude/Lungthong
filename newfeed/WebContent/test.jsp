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
    
  </head>

  <body>
	<div class="container">
    	<div class="row navbar-fixed-top" id="top">
            <img src="img/Topmenu/logo_longthong1.png" id="profile_icon"/>
            <p id="username_text">Username</p>
            <img src="img/Topmenu/profile button.png" id="setting_icon">
       
        
            <div id="search_menu">
                <div class="row">
               	<div class="col-xs-8" id="dropdownbox">
                <div class="col-xs-4">
                    <select class="form-control" name="type" >
                    <option selected disabled>Type</option>
                    <option value="">shirt</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    </select>
               </div>
               <div class="col-xs-4">
                    <select class="form-control" name="style" >
                    <option selected disabled>Style</option>
                    <option value="">shirt</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    </select>
               </div>
               <div class="col-xs-4"> 
                    <select class="form-control" name="color" >
                    <option selected disabled>Color</option>
                    <option value="">shirt</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    </select>
                 </div>
                </div>
                 <div class="col-xs-4">
                    <button type="submit" class="btn-info btn-block btn-lg search_btn"><span class="glyphicon glyphicon-search"></span> Search</button>
                 </div>
                 </div>
            </div>
        </div>

	

        <div class="col-xs-10 col-xs-offset-1" style="margin-top:150px;">
        
        
        
            <div class="searchtopic row">
            	<div class="col-xs-5" align="center"><img src="img/icon/logo_longthong.png" class="thumbnail img-responsive" /></div>
                <div class="col-xs-7">
                <h1 id="topic_name">Topic Name</h1>
                
                <span class="label label-info">Tag1</span>
                <span class="label label-info">Tag2</span>
                <span class="label label-info">Tag3</span>
                
                <p class="price">Price</p>
                <p class="price">Post Date</p>
                <p class="price">Post By</p>
                </div>
            </div>
            
            <div class="searchtopic row">
            	<div class="col-xs-5" align="center"><img src="img/icon/logo_longthong.png" class="thumbnail img-responsive" /></div>
                <div class="col-xs-7">
                <h1 id="topic_name">Topic Name</h1>
                
                <span class="label label-info">Tag1</span>
                <span class="label label-info">Tag2</span>
                <span class="label label-info">Tag3</span>
                
                <p class="price">Price</p>
                <p class="price">Post Date</p>
                <p class="price">Post By</p>
                </div>
            </div>
            
            <div class="searchtopic row">
            	<div class="col-xs-5" align="center"><img src="img/icon/logo_longthong.png" class="thumbnail img-responsive" /></div>
                <div class="col-xs-7">
                <h1 id="topic_name">Topic Name</h1>
                
                <span class="label label-info">Tag1</span>
                <span class="label label-info">Tag2</span>
                <span class="label label-info">Tag3</span>
                
                <p class="price">Price</p>
                <p class="price">Post Date</p>
                <p class="price">Post By</p>
                </div>
            </div>
            
            
            
            
            
              	
     	</div>
		</div>
       
      </div>  
     

	

  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="dist/js/bootstrap.min.js"></script>
    <script src="assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>