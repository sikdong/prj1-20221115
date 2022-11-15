<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
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
			<h3>회원 정보</h3>
				
			<div class="mb-3">
				<label for="" class="form-label">
					아이디 
				</label>
				<input class="form-control" type="text" value="${memberList.id }" readonly>
			</div>
			
			<div class="mb-3">
				<label for="" class="form-label">
					암호 
				</label>
				<input class="form-control" type="text" value="${memberList.password }" readonly>
			</div>
			<div class="mb-3">
				<label for="" class="form-label">
					이메일 
				</label>
				<input class="form-control" type="email" value="${memberList.email }" readonly>
			</div>
			<div class="mb-3">
				<label for="" class="form-label">
					가입일시 
				</label>
				<input class="form-control" type="text" value="${memberList.inserted }" readonly>
			</div>
<c:url value="/member/modify" var="updateMemberLink">
	<c:param name="id" value="${memberList.id }"></c:param>
</c:url>
<a class="btn btn-warning" href="${updateMemberLink }">회원정보 수정</a>
<c:url value="/member/remove" var="deleteMemberLink">
	<c:param name="id" value="${memberList.id }"></c:param>
</c:url>
<c:url value="/member/remove" var="removeUrl" />
	<form action="${removeUrl }" method="post" id="deleteMemberInfoForm" >
		<input type="hidden" name="id" value="${memberList.id }">
	</form>
		<input class="btn btn-danger" type="submit" value="탈퇴" data-bs-toggle="modal" data-bs-target="#deleteInfoConfirmModal">
		</div>
	</div>
</div>	
	

<!--회원 정보 삭제 확인 Modal -->
<div class="modal fade" id="deleteInfoConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" >회원 탈퇴 확인 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        회원을 탈퇴하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-warning btn-sm" id="deleteMemberButton">확인</button>
      </div>
    </div>
  </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
document.querySelector("#deleteMemberButton")
	.addEventListener("click", function(){
	document.querySelector("#deleteMemberInfoForm").submit();
})
</script>
</body>
</html>