function show_hide() {
    if(document.getElementById("full").style.height != 'auto') 
    {
    	document.getElementById("full").style.height = 'auto';
        document.getElementById("full").style.opacity = '1';
        document.getElementById("full").style.visibility = 'visible';
        document.getElementById("link").innerHTML = 'Rút gọn';
        document.getElementById("link").className = 'close button';
    }
    else
    {
    	
    	document.getElementById("full").style.opacity = '0';
    	document.getElementById("full").style.visibility = 'hidden';
      	document.getElementById("link").innerHTML = 'Xem Tiếp.....';
        document.getElementById("link").className = 'open button';
        document.getElementById("full").style.height = '0';
     }
    return false;
 }