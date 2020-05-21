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
	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>성명</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>등급</td>
		</tr>
		<c:forEach var="buisness" items="${businessList}">
		<c:if test="${buisness.user_level == 2}">
		<tr>
			<td>${buisness.user_id}</td>
			<td>${buisness.user_account}</td>
			<td><a href="businessInformation/${buisness.user_id}">${buisness.user_name}</a></td>
			<td>${buisness.user_tell}</td>
			<td>${buisness.user_date}</td>
			<td>${buisness.user_level}</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	
		<c:if test="${paging.startPage != 1 }">
			<a href="businessList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="businessList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="businessList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
		<br> <a href="main">돌아가기</a>
		
</body>
</html>