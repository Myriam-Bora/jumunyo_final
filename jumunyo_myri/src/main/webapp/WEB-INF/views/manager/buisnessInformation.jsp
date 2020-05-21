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
	
	<form action="/jumunyo/businessAcknowledge/${restaurants.user_id}" method="post">
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
			<c:when test="${restaurants.restaurant_accept == 0}">
				<input type="text" value="미승인"/> <br/>
			</c:when>
			<c:when test="${restaurants.restaurant_accept == 1}">
				<input type="text" value="승인"/> <br/>
			</c:when>
		</c:choose>
		입점 신청 날짜 : <input type="text" value="${restaurants.restaurant_date}"/> <br>
		<input type="submit" value="승인"/>
	</form>
	<a href="/jumunyo/businessList">돌아가기</a>

</body>
</html>