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
	<div class="container-md">
	<my:navbar active="memberList"></my:navbar>
		<div class="row">
			<div class="col">

				<c:if test="${not empty message }">
					<div class="alert alert-success">
						${message }
					</div>
				</c:if>
				
				<h3>회원 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>비밀번호</th>
							<th>이메일</th>
							<th>회원가입 날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="member">
							<tr>
							<c:url value="/member/info" var="memberInfoLink">
								<c:param name="id" value="${member.id }"></c:param>
							</c:url>
								<td>
									<a href="${memberInfoLink }">
										${member.id }
									</a>
								</td>
								<td>
									${member.password }
								</td>	
									
								<%-- 	

									<c:if test="${board.countReply > 0 }">
										<span class="badge rounded-pill text-bg-light">
											<i class="fa-regular fa-comment-dots"></i>
											${board.countReply }
										</span>
									</c:if>
									파일 수 출력
									<c:if test="${board.countFile > 0 }">
										<span class="badge rounded-pill text-bg-light">
											<i class="fa-regular fa-file"></i>
											${board.countFile }
										</span>
									</c:if>
									
								</td>	 --%>			
								<td>${member.email }</td>
								<td>${member.inserted }</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>