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
	document.getElementById('registerform').style.display='block';
	
}

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}