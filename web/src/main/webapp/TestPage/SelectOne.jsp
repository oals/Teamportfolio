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


아이디 <input type="text" value="${user_info.id}" readonly><br>
비밀번호 <input type="text" value="${user_info.pw}" readonly><br>
이름 <input type="text" value="${user_info.name}" readonly><br>
나이 <input type="text" value="${user_info.age}" readonly><br>
이메일 <input type="text" value="${user_info.email}" readonly><br>

<a>돌아가기</a>

</body>
</html>