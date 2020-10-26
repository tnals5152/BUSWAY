$(function(){
	
	
	/*
	if('<%=logtry%>' == 'tried'){
		alert("아이디 또는 비밀번호가 틀립니다.\n다시 입력해주세요.");
		subPage();
		
	}else(){
		alert("ddddd");
	}
	if('<%=find%>' == 'find'){
		subPage();
	}*/
	
	$("#onlogin").click(function(e){
		e.preventDefault();
		subPage();
	});
	
	$("#loginpop").click(function(e){
		e.preventDefault();
		subPage();
	});
	
	$("#loginpopup .close").click(function(e){
		e.preventDefault();
		$("body").css("background-color", "white");
		$("#loginpopup").fadeOut(400);
	});
	
	function subPage(){
		$("body").css("background-color", "gray");
		$("#loginpopup").fadeIn(400);
		$("#id").focus();
	}
	
	
	
	$("#forloginbar").mouseover(function(){
		$("#loginid").fadeIn(200);
		$("#loginid").mouseleave(function(){
			$("#loginid").css("display", "none");
		});
		$("#forloginbar").mouseleave(function(){
			$("#loginid").css("display", "none");
		});
	});
	
	
	
	$("#onlogout").click(function(e){
		e.preventDefault();
		subPage2();
	});
	
	$("#logoutpopup .close").click(function(e){
		e.preventDefault();
		$("body").css("background-color", "white");
		$("#logoutpopup").fadeOut(400);
	});
	
	function subPage2(){
		$("body").css("background-color", "gray");
		$("#logoutpopup").fadeIn(400);
	}
	
	/* $("#forlogoutbar").click(function(e){
		e.preventDefault();
		subPage2();
	}); */
	
	
	$("#forlogoutbar").mouseover(function(){
		$("#logoutid").fadeIn(200);
		$("#logoutid").mouseleave(function(){
			$("#logoutid").css("display", "none");
		});
		$("#forlogoutbar").mouseleave(function(){
			$("#logoutid").css("display", "none");
		});
	});
	
	
	
	$("#forloginbar").mouseover(function(){
		$("#loginid").fadeIn(200);
		$("#loginid").mouseleave(function(){
			$("#loginid").css("display", "none");
		});
		$("#forloginbar").mouseleave(function(){
			$("#loginid").css("display", "none");
		});
	});
	
	$(".leavebutton").click(function(){
	});
	
	subPageFunc = subPage;//jQuery함수를 javascript에서 쓰기
});


function enterkey(){
	if(window.event.keyCode == 13){
		login();
	}
}
function login(){
	var f = document.frm;
	if(f.id.value == ""){
		alert("ID를 입력하세요");
		return false;
	}
	if(f.pwd.value == ""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	f.nowPage.value = location.pathname;
	f.searchquery.value = location.search;
	f.action = "login";
	f.submit();
}


function logout(){
	
	document.location.href = "logout";
}

function admin_login(){
	document.location.href = "adminLogin.jsp";
}
function mypage(){
	document.location.href = "mypage?type=mybus";
}
function sign(){
	document.location.href="signstep?type=1";
}

function find_id(){
	document.location.href="findidpwd.jsp";
}

function leave(){
	var result = confirm("정말 탈퇴하시겠습니까? 되돌릴 수 없습니다.");
	if(result){
		document.location.href = "leave";
	}else{
		return;
	}
}
	