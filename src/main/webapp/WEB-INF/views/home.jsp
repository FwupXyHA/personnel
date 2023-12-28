<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;
charset=UTF-8" %>
<html>
	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>Home</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function() {			
			// 추가
			$(".list_btn").on("click", function() {
				location.href = "/board/list";
			})
		})
	</script>
<body>
	<h1>
		Hello world!  
	</h1>

	<P>  The time on the server is ${serverTime}. </P>

	<button type="submit" class="btn btn-primary list_btn">게시판으로 >></button>

</body>
</html>
