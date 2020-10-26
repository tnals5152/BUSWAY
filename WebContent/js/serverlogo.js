$(function(){
	$("#storevolog").click(function(){
		$("#adminlogoutspan").fadeIn(200);
	});
	
	
	$("#adminlogoutspan .adminlogout").click(function(){
		location.href="adminlogout?type=adminlogout";
	});
	$("#adminlogoutspan .close").click(function(){
		$("#adminlogoutspan").fadeOut(200);
	});
	
	
	
	
	
});

