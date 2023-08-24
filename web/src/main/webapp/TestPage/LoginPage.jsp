<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
              <a class="navbar-brand" href="#">Gello!</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">홈</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">소개</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">유저 조회</a>
                  </li>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Dropdown
                    </a>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Action</a></li>
                      <li><a class="dropdown-item" href="#">Another action</a></li>
                      <li><hr class="dropdown-divider"></li>
                      <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                  </li>
                </ul>
                <form class="d-flex" role="search">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="btn btn-outline-secondary" type="submit">Search</button>
                </form>
              </div>
            </div>
          </nav>

	<form action="/web/main/LoginTry.do">
          <div style="position: relative;">
            <div style="border:1px solid rgb(179, 179, 179); width:420px; height:400px; position: absolute; top:150px; left:370px;border-radius: 10px;">
                <h5 class="text-center mt-5" style="font-weight: 800;">로그인<br><small style="color:gray">Gello 계정 사용</small></h5>
                <div class="row d-flex justify-content-center mt-1 ">
                    <div class="w-75 col-md-11">
                        <input type="text" class="form-control m-1" placeholder="아이디를 입력해주세요" name ="user_id">
                    </div>
                    <div class="w-75 col-md-11">
                        <input type="password" class="form-control m-1" placeholder="비밀번호를 입력해주세요" name="user_pw">
                    </div>
                </div>
                <div class="text-center mt-1" style="color:red; font-weight:600">${error}</div>
                
                <div class="m-2 text-center" >
                    <a href="#" >이메일을 잊으셧나요?</a>
                </div>
                <div class="m-2 text-center">
                    <br>내 컴퓨터가 아닌가요? 게스트 모드를 사용하여 <br>비공개로 로그인하세요. <a href="#">자세히 알아보기</a>
                </div>
                <div class=" d-flex justify-content-center">
                    <button class="btn btn-outline-secondary m-1">로그인</button>
                  </form>
                    <a href="/web/main/register.do" class="btn btn-outline-secondary m-1">회원가입</a>
                </div>
            </div>
          </div>
    </div>
</body>
</html>