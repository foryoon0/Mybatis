<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	
		<form action="writing" method="POST">
			<table>
				
		
				<tr>
					<th>제목</th>
					<td><textarea rows="2" cols="10" name="boardTitle" id="boardTitle" class="focused-input" required></textarea></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="boardWriter" id="boardWriter" required></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="text" name="boardPwd" id="boardPwd" required></td>	
				</tr>
				<tr>
					<td colspan="2"><textarea rows="5" cols="30"
							placeholder="글 내용을 입력하세요" name="boardContent" id="boardContent"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="질문 작성" class="btn"> 
			<input type="button" value="목록보기" class="btn" onclick="location.href='/'">
		</form>

<%@include file="../../views/footer.jsp" %>
</body>
</html>