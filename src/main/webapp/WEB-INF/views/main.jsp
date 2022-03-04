<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/CSS/board.css">
<title>Insert title here</title>
</head>
<body>
<%@include file="../views/header.jsp" %>

		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="board" items="${board}" varStatus="b">
				<tr>
					<td>${board.boardNum}</td>
					<td><a href="<c:url value='/board/ReadBoard/${board.boardNum}'/>">${board.boardTitle}</a></td>
					<td>${board.boardWriter}</td>
					<td>${board.boardRegdate}</td>
					<td>${board.boardCount}</td>
				</tr>
			</c:forEach>
	</table>
	
	<c:if test="${totalCnt != null}">
		<c:choose>
			<c:when test="${totalCnt>100}">
				<c:if test="${(section)*50<totalCnt}"> <!--   >>(다음 섹션이 존재한다.)    -->
					<c:forEach var="page" begin="1" end="10" step="1" >
						<c:if test="${section >1 && page==1}"> <!--  이전 섹션 표시 << -->
							<a href="?section=${section-1}&pageNum=10"> << </a>
						</c:if>
							<a href="?section=${section}&pageNum=${page}">${(section-1)*10+page}</a>
						<c:if test="${page==5}"> <!--  다음 섹션 표시 >> -->
							<a href="?section=${section+1}&pageNum=1"> >> </a>
						</c:if>
					</c:forEach>
				</c:if>
				<c:if test="${(section)*50>totalCnt}"> <!--   (다음 섹션이 없다!!) -->
					<c:forEach  var="page" begin="1" end="${((totalCnt+9)-(section-1)*50)/5}" step="1" >
						<c:if test="${section >1 && page==1}"> <!--  이전 섹션 표시 << -->
							<a href="?section=${section-1}&pageNum=10"> << </a>
						</c:if>
							<a href="?section=${section}&pageNum=${page}">${(section-1)*5+page}</a>
					</c:forEach>
				</c:if>
			</c:when>	
			<c:when test="${totalCnt==100}">
				<c:forEach var="page" begin="1" end="10" step="1">
					<a href=?section=${section}&pageNum=${page}">${page}</a>
				</c:forEach>
			</c:when>	
			<c:when test="${totalCnt<100}">
				<c:forEach var="page" begin="1" end="${(totalCnt+5)/5}" step="1">
					<a href="?section=${section}&pageNum=${page}">${page}</a>
				</c:forEach>
			</c:when>	
		</c:choose>
	</c:if>
	
		<br>
		<a href="<c:url value='/board/WriteBoard' />">[글작성]</a>

<%@include file="../views/footer.jsp" %>
</body>
</html>