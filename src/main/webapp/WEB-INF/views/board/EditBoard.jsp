<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../../resources/CSS/boardDetail.css">
<script src="../../../resources/jquery/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../../views/header.jsp" %>

	<h4>*제목,작성자,내용 수정가능합니다.</h4>
	<form action="edit" method="POST">
	<table>
		<tr>
			<th>제목</th> 
				<td><textarea rows="1" cols="10"  id="boardTitle" name="boardTitle" class="focused-input">${board.boardTitle}</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.boardRegdate}</td>
		</tr>
		<tr>
			<th>작성자</th>  
			<td><input type="text" name="boardWriter" id="boardWriter" value="${board.boardWriter}"></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.boardCount}</td>
		</tr>
		<tr>
			<td colspan="2"><textarea rows="5" cols="30" id="bardContent" name="boardContent">${board.boardContent}</textarea></td>	
	
		</tr>
	</table>
		<input type="hidden" name="boardNum" id="boardNum" value="${board.boardNum}">
		<input type="hidden" name="boardPwd" id="boardPwd" value="${board.boardPwd}">
		<input type="submit" id="edit" value="수정완료">  <input type="button" onclick="location.href='/';" value="목록으로">
	</form>
	

<%@include file="../../views/footer.jsp" %>
</body>
</html>