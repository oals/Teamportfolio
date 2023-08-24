<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
		<form action="/web/main/registerTry.do">
          <div style="position: relative;">
            <div style="border:1px solid rgb(179, 179, 179); width:420px; height:580px; position: absolute; top:100px; left:380px; border-radius: 10px;">
                <h5 class="text-center mt-5 mb-3" style="font-weight: 800;">회원가입<br><small style="color:gray">Gello 계정 가입</small></h5>
                
                <div class="row d-flex justify-content-center m-2 ">
                    <div class="col-md-7">
                        <input type="text" name="user_id" class="form-control m-1" placeholder="아이디를 입력해주세요">                
                    </div>
                    <div class="col-md-5">
                        <button class="btn btn-secondary">중복확인</button>
                    </div>

                    <div class="col-md-7 mt-4">
                        <input type="password" name="user_pw" class="form-control m-1" placeholder="비밀번호를 입력해주세요">   
                    </div>
                    <div class="col-md-5"></div>

                    <div class="col-md-7 mt-2">
                        <input type="password" class="form-control m-1" placeholder="비밀번호 확인">   
                    </div>
                    <div class="col-md-5"></div>

                    <div class="col-md-7 mt-4">
                        <input type="text" name="user_name" class="form-control m-1" placeholder="이름을 입력해주세요">
                    </div>
                    <div class="col-md-5"></div>

                    <div class="col-md-7 mt-3">
                        <input type="password"  name="user_age" class="form-control m-1" placeholder="나이를 입력해주세요">
                    </div>
                    <div class="col-md-5"></div>

                    <div class="col-md-7 mt-3">
                        <input type="password" name="user_email" class="form-control m-1" placeholder="admin123@naver.com ">
                       
                    </div>
                    <div class="col-md-5 mt-3">
                        <button class="btn btn-secondary">중복확인</button>
                    </div>
                    <div>
                        <div class="row text-center mt-5">
                            <button class="btn btn-secondary">회원가입</button>
                        </div>
                        
                    </div>
                </div>
                </form>
            </div>
          </div>
    </div>
</body>
</html>
