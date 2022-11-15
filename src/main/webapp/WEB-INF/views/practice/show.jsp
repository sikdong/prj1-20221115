<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my"  tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>

<h2>(${customerList.id } 번 고객 세부사항 정보)</h2> <br />
<h3>이름 : ${customerList.name }</h3> <br />
<h3>별칭 : ${customerList.contactName }</h3> <br />
<h3>주소 : ${customerList.address }</h3> <br />
<h3>도시 : ${customerList.city }</h3> <br />
<h3>우편 : ${customerList.postalCode }</h3> <br />
<h3>나라 : ${customerList.country }</h3> <br />

<c:url value="/practice/update" var="updateCustomerLink">
	<c:param name="id" value="${customerList.id }"></c:param>
</c:url>
<a class="btn btn-primary" href="${updateCustomerLink}">수정</a>
<c:url value="/practice/delete" var="deleteLink">
</c:url>
<form id="deleteForm" action="${deleteLink }" method="post">
	<input type="hidden" name="id" value="${customerList.id }" />
</form>
	<input class="btn btn-danger" type="submit" value="삭제" 
	data-bs-toggle="modal"
	data-bs-target="#boardDeleteModal"> 
	<%-- data-bs-target에 모달 id 적어넣을것, submit input 폼에서 따로 빼놓을 것 --%>
<hr />
<div id="message">
${message }
</div>
<input type="hidden" value="${customerList.id }" id="customerId"/>
<textarea name="" id="comment" cols="30" rows="5">
</textarea>
<button id="commentEnroll">댓글 등록</button>

<div class="row">
	<div class="col">
		<div id="commentContainer">
		</div>
	</div>
</div>



<!-- 게시물 삭제 확인 모달 -->
<div class="modal fade" id="boardDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        게시물을 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button id="deleteConfirmButton" type="button" class="btn btn-danger">확인</button>
      </div>
    </div>
  </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
<script>
const ctx = "${pageContext.request.contextPath}";

//게시물 수정 확인 모달
document.querySelector("#deleteConfirmButton").addEventListener("click", function(){
	document.querySelector("#deleteForm").submit();
})

showComment();

document.querySelector("#commentEnroll").addEventListener("click", function() {
	const customerInfoId = document.querySelector("#customerId").value;
	const content = document.querySelector("#comment").value;
	const data = {customerInfoId, content};
	fetch(`\${ctx}/comment/enroll`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
 	.then(res=>res.json())
	.then(data => {
		document.querySelector("#message").innerText = data.message
		document.querySelector("#comment").value=''
	})
	.then(() =>showComment());
});



function showComment(){
	const customerInfoId = document.querySelector("#customerId").value;
	fetch(`\${ctx}/comment/show/\${customerInfoId}`)
	.then(res => res.json())
	.then(list =>{
		const commentContainer = document.querySelector("#commentContainer");
		commentContainer.innerHTML="";
		for(const comment of list){
			const deleteCommentButton = `deleteCommentButton\${comment.id}`;
			const commentDiv = 
				`\${comment.content}
				\${comment.inserted}
				<button id="\${deleteCommentButton}" class="btn btn-warning btn-sm" 
							data-comment-id="\${comment.id}">댓글 삭제</button>
				<hr>`;
			commentContainer.insertAdjacentHTML("beforeend", commentDiv);
			document.querySelector("#"+deleteCommentButton).addEventListener("click", function(){
				deleteComment(this.dataset.commentId);
			
			});
		};	
		
	});
};
		
//댓글 삭제 
function deleteComment(commentId){
				
		fetch(`\${ctx}/comment/remove/\${commentId}` , {
			method : "delete"
		})
		.then(res => res.json())
		.then(data => {
			document.querySelector("#message").innerText = data.message;
		})
		.then(() =>showComment());
	};	
		



</script>
</html>