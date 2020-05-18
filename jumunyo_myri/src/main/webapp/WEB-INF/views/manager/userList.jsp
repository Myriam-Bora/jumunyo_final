<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>

	<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
	<input type="submit" name="search" class="btn1"  value="검 색" >

	<table border="1">
		<tr>
			<td>회원번호</td>
			<td>아이디</td>
			<td>성명</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>등급</td>
		</tr>
		<c:if test="${userList.size() == 0}">
		<tr>
			<td colspan="6">회원목록이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="user" items="${userList}">
		<tr>
			<td>${user.user_id}</td>
			<td>${user.user_nickname}</td>
			<td><a href="userInformation/${user.user_id}">${user.user_name}</a></td>
			<td>${user.user_tell}</td>
			<td>${user.user_date}</td>
			<c:choose>
				<c:when test="${user.user_level == 2}"><td>일반회원</td></c:when>
				<c:when test="${user.user_level == 1}"><td>사업자</td></c:when>
			</c:choose>
		</tr>
		</c:forEach>
	</table>
	
		<c:if test="${paging.startPage != 1 }">
			<a href="userList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="userList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="userList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>

</body>
</html>