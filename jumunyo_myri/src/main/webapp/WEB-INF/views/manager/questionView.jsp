<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<br> <a href="/jumunyo/questionAnswerList">돌아가기</a>

</body>
</html>