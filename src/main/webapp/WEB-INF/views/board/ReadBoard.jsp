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
	<%@include file="../../views/header.jsp"%>


	<table>
		<tr>
			<th>제목</th>
			<td><textarea rows="1" cols="10" id="boardTitle"
					name="boardTitle" readonly class="focused-input">${board.boardTitle}</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.boardRegdate}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.boardWriter}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.boardCount}</td>
		</tr>
		<tr>
			<td colspan="2"><textarea rows="5" cols="30"
					id="qnaBoardContent" name="qnaBoardContent" readonly>${board.boardContent}</textarea></td>

		</tr>
	</table>
	<input type="hidden" name="boardPwd" id="boardPwd"
		value="${board.boardPwd}">
	<input type="hidden" name="boardNum" id="boardNum"
		value="${board.boardNum}">
	<input type="button" id="edit" value="수정" onclick="password()">
	<input type="button" value="삭제" onclick="deleteConfirm()">
	<input type="button" onclick="location.href='/';" value="목록으로">


	<script>
		//게시글 삭제 location.href='/board/deleteBoard/${boardNum}';
		function deleteConfirm() {
			let pass = prompt('삭제를 원하시면 패스워드를 입력하세요.', '');
			let confirm = document.getElementById("boardPwd").value;

			if (pass == confirm) {
				location.href='/board/deleteBoard/${boardNum}';
			}
			else {
				alert("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
			}
		}

		//게시글 수정
		function password() {
			let pass = prompt('수정을 원하시면 패스워드를 입력하세요.', '');
			let confirm = document.getElementById("boardPwd").value;

			if (pass == confirm) {
				location.href = '/board/editBoard/${boardNum}';
			} else {
				alert("패스워드가 일치하지 않습니다. 다시 입력해 주세요.");
			}
		}
	</script>

	<%@include file="../../views/footer.jsp"%>
</body>
</html>