<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  
</head>
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
        <div style="background-color:rgb(255, 255, 255); height: 550px; position: relative;">
            <table class="table mt-3 table table-hover">
                <thead class="table-light">
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">아이디</th>
                    <th scope="col">비밀번호</th>
                    <th scope="col">이름</th>
                    <th scope="col">나이</th>
                    <th scope="col">이메일</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${user_info}">
                  <tr>
                    <th scope="row">1</th>
                    <th scope="row">${item.id}</th>
                    <td>${item.pw}</td>
                    <td>${item.name}</td>
                    <td>${item.age}</td>
                    <td>${item.email}</td>
                    <td>
                       <a class="btn btn-outline-secondary" href="/web/main/update.do?user_id=${item.id}&user_pw=${item.pw}&user_name=${item.name}&user_age=${item.age}&user_email=${item.email}">수정</a>
                       <a  class="btn btn-outline-secondary" href="/web/main/delete.do?user_id=${item.id}">삭제</a>
                    </td>
                  </tr>
                    </c:forEach>
                </tbody>
              </table>
        </div>
    </div>
</body>
</html>