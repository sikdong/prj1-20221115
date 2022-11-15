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
<style>
body {
background-color : ivory;
}
h2 {
	text-align : center;
}
.message{
background-color : teal;
color : white;
height : 50px;
}
</style>

</head>
<body>
<my:customerNavBar active="list"></my:customerNavBar>

<h2>고객 명단<i class="fa-regular fa-rectangle-list"></i></h2>
<div class="message">${message }</div>
<c:url value="/practice/register" var="registerPage">
</c:url>
<ul class="nav">

  <!-- 신규 등록 버튼 -->
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${registerPage }">신규 등록</a>
  </li>
  
  <!-- 고객 삭제 버튼 -->
  <li class="nav-item">
    <a class="nav-link" href="#"></a>
  </li>
  
  <li class="nav-item">
    <a class="nav-link" href="#"></a>
  </li>
</ul>
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>고객 이름</th>
			<th>주소</th>
			<th>도시</th>
			<th>국가</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${showList }" var="customer">
		<tr>
			<td>${customer.id }</td>
			
			 <c:url value="/practice/show" var="showPage">
			 	<c:param name="id" value="${customer.id }"></c:param>
			 </c:url>
			 
			<td>
			 <a href="${showPage}">
			${customer.name }
			 </a>
			</td>
			
			
			<td>${customer.address }</td>
			<td>${customer.city }</td>
			<td>${customer.country }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
  <c:if test="${pageButtonInfo.currentPageNumber > 6 }">
  	 <li class="page-item">
  	 <c:url value="/practice/list" var = "firstPage">
  	 	<c:param name="page" value="1" ></c:param>
  	 	<c:param name="column" value="${param.column }"></c:param>
  	 	<c:param name="keyword" value="${param.keyword }"></c:param>
  	 </c:url>
      <a class="page-link" href="${firstPage }" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
  <c:forEach begin="${pageButtonInfo.leftPageNumber }" end="${pageButtonInfo.rightPageNumber }" var="pageNumber">
	  <c:url value="/practice/list" var="pageLink">
	  	<c:param name="page" value="${pageNumber}"></c:param>
	  	<c:param name="column" value="${param.column }"></c:param>
  	 	<c:param name="keyword" value="${param.keyword }"></c:param>
	  </c:url>
    <li class="page-item  ${pageButtonInfo.currentPageNumber == pageNumber?'active' :'' }">
    <a class="page-link" href="${pageLink }">${pageNumber}</a></li>
  </c:forEach>
   <c:if test="${pageButtonInfo.currentPageNumber <= 6 }">
    <li class="page-item">
    <c:url value="/practice/list" var="lastPage">
    	<c:param name="page" value="${pageButtonInfo.lastPageNumber }"></c:param>
    	<c:param name="column" value="${param.column }"></c:param>
  	 	<c:param name="keyword" value="${param.keyword }"></c:param>
    </c:url>
      <a class="page-link" href="${lastPage }" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li> 
   </c:if>
  </ul>
</nav>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>