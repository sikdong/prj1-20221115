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
	
	<my:navbar></my:navbar>
	
	<div class="container-md">
		<div class="row">
			<div class="col">
			
				<c:if test="${not empty message }">
					<div class="alert alert-success">
						${message }
					</div>
				</c:if>
				
				<h1>회원 정보 수정</h1>
			
				<form id="form1" action="" method="post">
				
					<div class="mb-3">
						<label for="" class="form-label">
							아이디 
						</label>
						<input class="form-control-plaintext" type="text" value="${memberList.id }" readonly>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							닉네임
						</label>
						
						<div class="input-group">
							<input data-old-nickname="${memberList.nickName}" value="${memberList.nickName }" id="nickNameInput" class="form-control" type="text" name="nickName">
							<button id="nickNameConfirmButton" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>
						<div id="nickNameConfirmMessage" class="form-text"></div>	
					</div>
					<input type="checkbox" name="newPassword" value="true" id="newPasswordCheckbox1"> 암호 변경
					<div class="mb-3">
						<label for="" class="form-label">
							새 암호 
						</label>
						<input disabled id="passwordInput1" class="form-control" type="password" name="password">
						<div class="form-text" id="passwordText1"></div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							새 암호 확인
						</label>
						<input disabled id="passwordInput2" class="form-control" type="password" value="${memberList.password }">
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							이메일 
						</label>
						<div class="input-group">
							<input id="email" class="form-control" type="email" value="${memberList.email }" name="email" data-old-value="${memberList.email }">
							<button disabled id="emailConfirmButton" type="button" class="btn btn-outline-secondary">중복확인</button>
						</div>
						<div id="emailConfirmMessage" class="form-text"></div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							가입일시 
						</label>
						<input class="form-control-plaintext" type="text" value="${memberList.inserted }" readonly>
					</div>
				
					<input type="hidden" name="oldPassword">
				</form>
				
				<c:url value="/member/remove" var="removeUrl" />
				<form id="form2" action="${removeUrl }" method="post">
					<input type="hidden" name="id" value="${memberList.id }">
					<input type="hidden" name="oldPassword">
				</form>
				<input id="confirmInput" disabled class="btn btn-warning" type="submit" value="수정" data-bs-toggle="modal" data-bs-target="#modifyModal">
				<input class="btn btn-danger" type="submit" value="탈퇴" data-bs-toggle="modal" data-bs-target="#removeModal">
			</div>
		</div>
	</div>
	
	<%-- 수정 시 예전암호 입력 Modal --%>
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 암호 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input id="oldPasswordInput1" type="text" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="modalConfirmButton" type="button" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<%-- 탈퇴 시 예전암호 입력 Modal --%>
	<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 암호 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input id="oldPasswordInput2" type="text" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="modalConfirmButton2" type="button" class="btn btn-danger">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>



const ctx = "${pageContext.request.contextPath}"
const email = document.querySelector("#email");
const emailConfirmButton = document.querySelector("#emailConfirmButton");
const emailConfirmMessage = document.querySelector("#emailConfirmMessage");

emailConfirmButton.addEventListener("click", function(){
	const presentEmail = email.value;
		let passwordInput1 = document.querySelector("#passwordInput1").value;
		let passwordInput2 = document.querySelector("#passwordInput2").value;
	
	fetch(ctx+"/member/existEmail", {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({presentEmail})
	})
	.then(res => res.json())
	.then(data => {
		emailConfirmMessage.innerText = data.message;
		if(data.status == "not exist"){
			document.querySelector("#confirmInput").removeAttribute("disabled")
		}
	})
	
})

email.addEventListener("keyup", function(){
	const oldEmail = email.dataset.oldValue;
	const presentEmail = email.value;
	
	if(oldEmail == presentEmail){
		emailConfirmButton.setAttribute("disabled", "disabled")
		emailConfirmMessage.innerText = ""
	} else {
		emailConfirmButton.removeAttribute("disabled")
		emailConfirmMessage.innerText = "이메일 중복확인을 눌러주세요"
	}
})



<%-- 탈퇴 모달 확인 버튼 눌렀을 때 --%>
document.querySelector("#modalConfirmButton2").addEventListener("click", function() {
	const form = document.forms.form2;
	const modalInput = document.querySelector("#oldPasswordInput2");
	const formOldPasswordInput = document.querySelector(`#form2 input[name="oldPassword"]`)
	// 모달 안의 기존 암호 input 값을
	// form의 기존 암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;	
	
	// form을 submit
	form.submit();
});

<%-- 수정 모달 확인 버튼 눌렀을 때 --%>
document.querySelector("#modalConfirmButton").addEventListener("click", function() {
	const form = document.forms.form1;
	const modalInput = document.querySelector("#oldPasswordInput1");
	const formOldPasswordInput = document.querySelector(`#form1 input[name="oldPassword"]`)
	// 모달 암호 input 입력된 값을 
	// form 안의 기존암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;	
	
	// form을 submit
	form.submit();	
});

<%-- 암호 입력 일치하는지 확인 --%>
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");
passwordInput1.addEventListener("keyup", matchPassword);
passwordInput2.addEventListener("keyup", matchPassword);
function matchPassword() {
	if (passwordInput1.value == passwordInput2.value) {
		passwordText1.innerText = "패스워드가 일치 합니다.";
		document.querySelector("#confirmInput").removeAttribute("disabled")
		
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
		document.querySelector("#confirmInput").setAttribute("disabled", "disabled")
	}
}

document.querySelector("#nickNameConfirmButton").addEventListener("click" , function(){
	const nickName = document.querySelector("#nickNameInput").value;
	fetch(ctx+"/member/existNickName" , {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({nickName})
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#nickNameConfirmMessage").innerText = data.message
		if(data.status == "not exist"){
			document.querySelector("#confirmInput").removeAttribute("disabled")
		} else {
			document.querySelector("#confirmInput").setAttribute("disabled", "")
		}
	})
})

<%-- 새 패스워드 입력 체크박스 --%>
document.querySelector("#newPasswordCheckbox1").addEventListener("change", function() {
	const pwInput1 = document.querySelector("#passwordInput1");
	const pwInput2 = document.querySelector("#passwordInput2");
	if (this.checked) {
		pwInput1.removeAttribute("disabled");
		pwInput2.removeAttribute("disabled");
	} else {
		pwInput1.setAttribute("disabled", "");
		pwInput2.setAttribute("disabled", "");
	}
});


</script>
</body>
</html>








