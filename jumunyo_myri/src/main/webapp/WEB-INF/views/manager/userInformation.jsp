<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원정보</h1>

<form action="<%= request.getContextPath() %>/updateUser" method="post">
	회원번호 : <input type="text" name="user_id" value="${user.user_id}"/> <br/>
	이름 : <input type="text" name="user_name" value="${user.user_name}"/> <br/>
	아이디 : <input type="text" name="user_account" value="${user.user_account}"/> <br/>
	주소 : <input type="text" name="user_address" value="${user.user_address}"/> <br/>
	연락처 : <input type="text" name="user_tell" value="${user.user_tell}"/> <br/>
	닉네임 : <input type="text" name="user_nickname" value="${user.user_nickname}"/> <br/>
	권한 : 
	<c:choose>
			<c:when test="${user.user_level == 2}">
				<input type="text" value="일반회원"/> <br/>
				<input type="hidden" name="user_level" value="${user.user_level}" />
			</c:when>
			<c:when test="${user.user_level == 1}">
				<input type="text" value="사업자"/> <br/>
				<input type="hidden" name="user_level" value="${user.user_level}" />
			</c:when>
	</c:choose>
	포인트 : <input type="text" name="user_point" value="${user.user_point}"/> <br/>
	이메일 : <input type="text" name="user_email" value="${user.user_email}"/> <br/>
	가입일 : <input type="text" name="user_date" value="${user.user_date}"/> <br/>
	<input type="submit" value="수정"/>
</form>

	<c:if test="${user.user_level == 1}">
	<h1>매장정보</h1>
	
		회원 번호 : <input type="text" value="${restaurants.user_id}"/> <br>
		매장 번호 : <input type="text" value="${restaurants.restaurant_id}"/> <br>
		매장 이름 : <input type="text" value="${restaurants.restaurant_name}"/> <br>
		매장 연락처 : <input type="text" value="${restaurants.restaurant_tell}"/> <br>
		매장 주소지 : <input type="text" value="${restaurants.restaurant_address}"/> <br>
		매장 대표자 : <input type="text" value="${restaurants.restaurant_owner}"/> <br>
		사업자등록번호 : <input type="text" value="${restaurants.restaurant_businessnumber}"/> <br>
		사업자 등록증 : <input type="text" value="${restaurants.restaurant_businessnumber_img}"/> <br>
		카테고리 : <input type="text" value="${restaurants.category_name}"/> <br>
		입 승인 상태 : 
		<c:choose>
		 	<c:when test="${restaurants.restaurant_accept == 1}">
		 		<input type="text" value="승인"/> <br>
		 	</c:when>
		 	<c:otherwise>
		 		<input type="text" value="미승인"/> <br>
		 	</c:otherwise>
		</c:choose>
		매장 평점 : <input type="text" value="${restaurants.restaurant_grade}"/> <br>
		입점 신청 날짜 : <input type="text" value="${restaurants.restaurant_date}"/> <br>
	</c:if>

<a href="/jumunyo/userList">돌아가기</a>

</body>
</html>