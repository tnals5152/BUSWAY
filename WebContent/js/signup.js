$(function(){
	$("#checkid").click(function(){
		if($("#inputid").val() == ""){
			alert("아이디를 입력 후 확인하세요.");
			$("#inputid").focus();
			return;
		}
		var id = $("#inputid").val();
		checkId(id);
	});
	
	$("#insertuser").click(function(){
		if($("#inputid").val() == ""){
			alert("아이디를 입력하세요.");
			$("#inputid").focus();
			return;
		}else if($("#checkMsg").html() == ""){
			alert("아이디 중복확인을 해주세요.");
			$("#inputid").focus();
			return;
		}else if($("#checkMsg").html() == "이미 사용 중인 아이디입니다."){
			alert("이미 사용중인 아이디입니다. 아이디를 다시 입력해주세요.");
			$("#inputid").val("");
			$("#inputid").focus();
			$("#checkMsg").html("");
			return;
		}
		if($("#inputpwd").val() == ""){
			alert("비밀번호를 입력하세요.");
			$("#inputpwd").focus();
			return;
		}else if($("#inputpwd").val() != $("#pwdcheck").val()){
			alert("비밀번호가 틀립니다. 일치시켜주세요.");
			$("#inputpwd").val("");
			$("#pwdcheck").val("");
			$("#inputpwd").focus();
			return;
		}else if($("#inputpwd").val().length < 8){
			alert("비밀번호는 8자리 이상으로 입력하여주세요.");
			$("#inputpwd").focus();
			return;
		}
		
		if($("#inputnickname").val() == ""){
			alert("닉네임을 입력하여주세요.");
			$("#inputnickname").focus();
			return;
		}
		if($("#inputname").val() == ""){
			alert("이름을 입력하여주세요.");
			$("#inputname").focus();
			return;
		}
		if($("#inputaddr").val() == ""){
			alert("주소를 입력하여주세요.");
			$("#inputaddr").focus();
			return;
		}
		if(!CheckEmail($("#inputemail").val())){
			if($("#inputemail").val() != ""){
				alert("이메일 형식이 잘못 되었습니다.");
				$("#inputemail").focus();
				return;
			}
		}
		
		$("#inputuserform").attr("action", "signstep");
		$("#inputuserform").attr("method", "post");
		$("#inputuserform").submit();
		
	});
	
	
	
	
});


function CheckEmail(str)
{                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     }                            
     else {                       
          return true;         
     }                            
}  




function checkId(idd){
	
	
	$.ajax("checkId",{
		type : "post",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data : {"idd":idd, "type": "signup"},
		dataType : "json",
		success:function(data){
			if(data.check == 1){
				$("#checkMsg").html("이미 사용 중인 아이디입니다.");
			}else{
				$("#checkMsg").html("사용가능한 아이디입니다.");
				$("#inputid").attr("readonly", true);
			}
			
		},
		error : function(){
			alert("[예외발생]");
		}
		
	});
}




 
