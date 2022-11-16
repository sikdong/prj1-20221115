<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<my:navbar active="signup"></my:navbar>
	
	<div class="container-md">
		<div class="row">
			<div class="col">
				<h1>회원가입</h1>
				
				<form action="" method="post">
					<div class="mb-3">
						<label for="" class="form-label">
							아이디
						</label>
						
						<div class="input-group">
							<input pattern="\d{3}" id="userIdInput1" class="form-control" type="text" name="id">
							<button id="userIdExistButton1" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>
						
						<div id="userIdText1" class="form-text">*아이디 중복확인이 필요합니다</div>
						
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							닉네임
						</label>
						
						<div class="input-group">
							<input id="nickNameInput" class="form-control" type="text" name="nickName">
							<button id="nickNameConfirmButton" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>
						
						<div id="nickNameConfirmMesssage" class="form-text">*닉네임 중복확인이 필요합니다</div>
						
					</div>

					<div class="mb-3">
						<label for="" class="form-label">
							암호
						</label>
						<input id="passwordInput1" class="form-control" type="text" name="password">
						<div id="passwordText1" class="form-text"></div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							암호 확인
						</label>
						<input id="passwordInput2" class="form-control" type="text" >
					</div>

					<div class="mb-3">
						<label for="" class="form-label">
						이메일
						</label>
						
						<div class="input-group">
							<input id="presentEmailInput" class="form-control" type="email" name="email">
							<button id="presentEmailConfirmButton" type="button" class="btn btn-outline-secondary">중복확인</button>
						</div>
						
						<div id="emailConfirmMessage" class="form-text">*이메일 중복확인이 필요합니다</div>
					</div>

					<input id="submitButton" disabled class="btn btn-primary" type="submit" value="가입">
					<!-- disabled : 비활성화 -->
				
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}"

let availableNickname = false;
let availableId = false;
let availableEmail = false;
let availablePassword = false;

function enableSubmitButton(){
	const submitButton = document.querySelector("#submitButton")
	if(availableNickname && availableId && availableEmail && availablePassword){
		submitButton.removeAttribute("disabled")
	} else {
		submitButton.setAttribute("disabled", "disabled")
	}
} 

document.querySelector("#nickNameConfirmButton").addEventListener("click", function(){
	const nickName = document.querySelector("#nickNameInput").value;
	
	fetch(ctx+"/member/existNickName", {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({nickName})
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#nickNameConfirmMesssage").innerText = data.message
		if(data.status == "not exist"){
			availableNickname =true;
			enableSubmitButton();
		}
	})
})

document.querySelector("#userIdExistButton1").addEventListener("click", function(){
	//입력된 userId를
	const userId=document.querySelector("#userIdInput1").value;
	
	//fetch 요청 보내고
	fetch(ctx+"/member/existId/"+userId)
	.then(res => res.json())
	.then(data => {
	//응답 받아서 메세지 출력
		document.querySelector("#userIdText1").innerText = data.message
		if(data.message == "회원가입 가능한 아이디 입니다"){
			availableId =true;
			enableSubmitButton();
		}
	})
	
	
})

document.querySelector("#presentEmailConfirmButton").addEventListener("click", function(){
	const presentEmail = document.querySelector("#presentEmailInput").value;
	fetch(ctx + "/member/existEmail", {
		method : "post",
		headers : {
		"Content-Type" : "application/json"
		},
		body : JSON.stringify({presentEmail})
		<%--presentemail 은 위에 변수명이 같고 controller에서도 같은 이름으로 받아야 생략 가능함 --%>
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#emailConfirmMessage").innerText = data.message;
		if(data.status == "not exist"){
			availableEmail =true;
			enableSubmitButton();
		}
	})
})
/* 패스워드 일치하는지 확인  */
const passwordText1 = document.querySelector("#passwordText1");
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");

function matchPassword(){
	const value1 = passwordInput1.value;
	const value2 = passwordInput2.value;
	
	if(value1 == value2){
		passwordText1.innerText = "패스워드가 일치합니다"
			availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다. 다시 입력해주세요"
	}
			enableSubmitButton();
}
passwordInput1.addEventListener("keyup", matchPassword);
passwordInput2.addEventListener("keyup", matchPassword);

</script>

</body>
</html>









