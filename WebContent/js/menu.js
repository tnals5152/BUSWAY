
$(function(){
	
	
	
	$("#nav>li>a>span").mouseover(function(){
		$("#nav>li>ul").fadeIn(200);
		$("#nav>li>ul").mouseleave(function(){
			$("#nav>li").mouseleave(function(){
				$("#nav>li>ul").css("display", "none");
				$("#nav>li>ul").css("z-index", "100");
			});
			
		});
		$("#nav>li").mouseleave(function(){
			$("#nav>li>ul").css("display", "none");
		}); 
	});
	
	
	
});


function findStore(){
	alert("매장을 먼저 선택하세요.");
	document.location.href="findStore.jsp";
}