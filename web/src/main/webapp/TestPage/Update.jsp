<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String user_name = request.getParameter("user_name");
	String user_age = request.getParameter("user_age");
	String user_email = request.getParameter("user_email");
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
       <form action="/web/main/updateTry.do">
          <div class="d-flex justify-content-center mt-5" style="border:1px solid rgb(182, 182, 182); height: 600px; ">
            <div class="w-75 mt-5">
                <table class="table mt-3 table table-hover mt-5">
                    <div class="text-center">
                        <%=user_id %>회원님의 정보입니다
                    </div>
                    <tbody>
                      <tr>
                        <th scope="row" class="text-center">아이디</th>
                            <td><input type="text" value=<%=user_id %> name="user_id" class="form-control"></td>
                      </tr>
                      <tr>
                        <th scope="row" class="text-center">비밀번호</th>
                            <td><input type="text" value=<%=user_pw %> name="user_pw" class="form-control"></td>
                      </tr>
                      <tr>
                        <th scope="row" class="text-center">이름</th>
                           <td><input type="text" value=<%=user_name %> name="user_name" class="form-control"></td>
                      </tr>
                      <tr>
                        <th scope="row" class="text-center">나이</th>
                            <td><input type="text" value=<%=user_age %> name="user_age" class="form-control"></td>
                      </tr>
                      <tr>
                        <th scope="row" class="text-center">이메일</th>
                            <td><input type="text" value=<%=user_email %> name="user_email" class="form-control"></td>
                      </tr> 
                    </tbody>
                  </table>
                    <div class="row col-md-12 mt-5">
                        <button class="btn btn-secondary mt-5">수정완료 </button>
                    </div>
              </div>
          </div>
        </form>
    </div>
</body>
</html>