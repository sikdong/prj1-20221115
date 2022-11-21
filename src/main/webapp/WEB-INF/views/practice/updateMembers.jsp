<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-md">
		<div class="row">
			<div class="col">
				<h1>회원 정보</h1>
				<h4>${message }</h4>
				
				<form action="" method="post">
					<div class="mb-3">
						<label for="" class="form-label">
							아이디
						</label>
						
						<div class="input-group">
							<input readonly id="userIdInput1" class="form-control" type="text" value="${member.id }">
							<button id="userIdExistButton1" class="btn btn-outline-secondary" type="button">중복확인</button>
						</div>
						
						<!-- <div id="userIdText1" class="form-text">*아이디 중복확인이 필요합니다</div> -->
						
					</div>

					<div class="mb-3">
						<label for="" class="form-label">
							암호
						</label>
						<input id="passwordInput1" class="form-control" type="text" name="password" value="${member.password }">
						<div id="passwordText1" class="form-text"></div>
					</div>
					
					<div class="mb-3">
						<label for="" class="form-label">
							암호 확인
						</label>
						<input id="passwordInput2" class="form-control" type="text" >
					</div>

					<input id="submitButton" class="btn btn-primary" type="submit" value="수정">
					<!-- disabled : 비활성화 -->
					</form>	
					<c:url value="/practice/deleteMembers" var="deleteLink">
					</c:url>
					<form action="${deleteLink }" method="post">
						<input type="hidden" name="id" value="${member.id }" />
						<input type="submit" value="삭제" />
					</form>
				
			</div>
		</div>
	</div>

</body>
</html>