<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <%
 String check = (String) session.getAttribute("loginCheck");
 %>
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
                    <a class="nav-link" href="/web/main/select.do">유저 조회</a>
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
          
          <div style="background-color:rgb(163, 163, 163); height: 550px; position: relative;">
            <div style="position:absolute; left:30%;top:120px;">
                <h3 class="text-center" style="color:white; font-weight: 800;">WE PROVIDE INNOVATIVE SOLUTIONS <br>TO EXPAND YOUR BUSINESS </h3>
            </div>
            <div style="position:absolute; left:32%;top:240px;">
                <samll class="text-center" style="color:white;">we have earend a requtation of being food at what we do. <br> let us take your online shop to new dimension in success!</small>
            </div>
                <div style="border: 1px solid white; border-radius: 15px; position:absolute; left:29%;top:340px;" class="p-3" > 
                   <button type="button" class="btn btn-outline-secondary" style="background-color: rgb(163, 163, 163);border:none ">let's find theme for you</button>
                </div>
                <div style="border: 1px solid white; border-radius: 15px; position:absolute; left:51%;top:340px;" class="p-3" > 
                    <button type="button" class="btn btn-outline-secondary" style=" background-color: rgb(163, 163, 163); border:none" >let's find theme for you</button>
                 </div>
                    <div style="position: absolute; top:580px; left: 500px;">
                        <small style="color: gray;">UILD PERPFECT STORE</small>
                    </div>
                    <div style="position: absolute; top:610px; left: 400px;">
                        <h2 style="font-weight: 800;">  Unlimited power and <br> comization possibilities</h2>
                    </div>
          </div>
          <div class="align-items" style="position:absolute; top:790px; left: 620px;;">
            <div class="d-flex justify-content-center">
				<c:choose>
					<c:when test="<%= check != null %>">
						
						<form action="/web/main/Logout.do">
							<button class="btn btn-outline-secondary" style=" background-color: rgb(163, 163, 163); color:white;font-weight: 100;"  >Logout!</button>
						</form>
					</c:when>
					
					<c:otherwise> 
						<form action="/web/main/Login.do">
							<button class="btn btn-outline-secondary" style=" background-color: rgb(163, 163, 163); color:white;font-weight: 100;"  >Login!</button>
						</form>
					</c:otherwise>
				</c:choose>
            </div>
          </div>

</body>
</html>