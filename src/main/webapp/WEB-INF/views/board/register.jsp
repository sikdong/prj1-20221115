<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	

	<my:navbar active="register"></my:navbar>
	
	<h1>게시물 작성</h1>
	<form id="registerForm" action="" method="post" enctype="multipart/form-data">
	
	<div class="mb-3">
	<label for="" class="form-label">
	제목 
	</label>
	<input required="required" class="form-control" type="text" name="title"> 
	</div>
	
	<div class="mb-3">
	<label for="" class="form-label">
	본문 
	</label>
	 <br>
	<textarea required="required" class="form-control" name="content"></textarea>
	</div>
	
	<div class="mb-3">
		<label for="" class="form-label">파일</label>
		<input multiple type="file" name="files" class="form-control" accept="image/*">
	</div>
	
	<div class="mb-3">
		<label for="" class="form-label">작성자 </label>
	<input value="<sec:authentication property="name"/>" required class="form-control" type="text" readonly name="writer"> 
	</div>
	<br>
	
	</form>
	<input type="submit" value="등록" data-bs-toggle="modal" data-bs-target="#registerModal">
	
	<div class="modal fade" id="registerModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">등록 확인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">게시물을 등록하시겠습니까?</div>
				<div class="modal-footer">
					<button id="registerButton" type="button"
						class="btn btn-primary">확인</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
	// 등록 확인 모달
		document.querySelector("#registerButton").addEventListener(
				"click", function() {
					document.querySelector("#registerForm").submit();
				});
</script>

</body>
</html>