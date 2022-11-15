<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="active" %>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<style>
#searchTypeSelect{
	width:auto;
}
#color {
	color : white;
}	
</style>

<nav class="navbar navbar-expand-lg bg-light mb-3">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        <c:url value="/practice/list" var="customerListLink"></c:url>
          <a class="nav-link ${active eq 'list'?'active':'' }" href="${customerListLink }">고객 목록</a>
        </li>
        <li class="nav-item">
        <c:url value="/practice/register" var="registerLink"></c:url>
          <a class="nav-link ${active eq 'register'?'active':'' }" href="${registerLink }">고객 신규 가입</a>
        </li>
      </ul>
      <form action="${customerListLink }" class="d-flex" role="search">
      	<select name="column" id="searchTypeSelect" class="form-select">
      		<option value="all">전체</option>
      		<option value="city" ${param.column == 'City'? 'selected':'' }>도시</option>
      		<option value="country"${param.column == 'Country'? 'selected':'' }>나라</option>
      	</select>
      
        <input value="${param.keyword }" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
        <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>
  </div>
</nav>