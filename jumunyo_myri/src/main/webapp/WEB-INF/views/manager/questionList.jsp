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
			<td>문의 번호</td>
			<td>문의 분류</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>답변여부</td>
		</tr>
		<c:forEach var="question" items="${questionList}">
		<tr>
			<td>${question.question_id}</td>
			<td>${question.question_category_name}</td>
			<td><a href="getQuestion/${question.question_id}">${question.question_title}</a></td>
			<td>${question.user_name}</td>
			<td>${question.question_date}</td>
			<td>${question.question_check}</td>
		</tr>
		</c:forEach>
	</table>

	<c:if test="${paging.startPage != 1 }">
			<a href="QuestionList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="QuestionList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="QuestionList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>

</body>
</html>