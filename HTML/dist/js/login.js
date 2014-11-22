window.onload=fade;
function fade(){
	sleep(2000);
	document.getElementById('spinner').style.display='none';
	document.getElementById('button').style.display='block';
}
function showlogin(){
	document.getElementById('button').style.display='none';
	document.getElementById('loginform').style.display='block';
	
}
function showregister(){
	document.getElementById('logo').style.display='none';
	document.getElementById('loginform').style.display='none';
	document.getElementById('button').style.display='none';
	document.getElementById('choosebutton').style.display='block';
	
}
function showCustomer(){
	
	document.getElementById('choosebutton').style.display='none';
	document.getElementById('customerform').style.display='block';
}
function showShop(){
	document.getElementById('choosebutton').style.display='none';
	document.getElementById('shopform').style.display='block';
}
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}