<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	글번호 : <input type="text" value="${question.question_id}"/> <br>
	작성자 : <input type="text" value="${question.user_name}"/> <br>
	문의 분류: <input type="text" value="${question.question_category_name}"/> <br>
	글제목 : <input type="text" value="${question.question_title}"/> <br>
	글내용 : <textarea cols="30" rows="10">${question.question_content}</textarea> <br>
	글 작성일 : <input type="text" value="${question.question_date}"/>
	<br /><a href="/jumunyo/answerQuestionList">돌아가기</a>
	
	<c:if test="${question.question_check == '답변대기'}">
	<h1>답글 작성</h1>
	<form action="/jumunyo/insertQuestion/${question.question_id}">
		<input type="hidden" name="question_category_id" value="${question.question_category_id}"/>
		<input type="hidden" name="user_id_receive" value="${question.user_id}"/>
		글 제목 : <input type="text" name="question_title" value="답변입니다."/> <br>
		글 내용 :	<textarea name="question_content" cols="30" rows="10"></textarea> <br>
		이미지 : <input type="text" name="question_image" value="no_image"/> <br>
		<input type="submit" value="답변하기"/>
	</form>
	<br /><a href="/jumunyo/questionList">돌아가기</a>
	</c:if>
	

</body>
</html>