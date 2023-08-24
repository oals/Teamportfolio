<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/01debed61a.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  
  <style>
    .search:focus {
      outline: none;
    }

    .hearder_link {
      color: black;
      text-decoration-line: none;
    }

    .hearder_label {
      cursor: pointer;
    }

    .payment {
      position: fixed;
      left: 60%;
      bottom: 0.5%;
    }
    
    .underline{
      BORDER-BOTTOM: lightgray 1px solid;
      BORDER-LEFT: medium none;
      BORDER-RIGHT: medium none;
      BORDER-TOP: medium none;
      FONT-SIZE: 9pt
    }
    .underline:focus{
      outline: none;
    }
    
      textarea {
        width: 100%;
        height: 5rem;
        resize: none;
        margin-bottom: 5px;
      }
      ::placeholder {
        font-size: inherit !important;
      }
  </style>

</head>
<body>

  <div class="main">
    <form action="${ctxPath}/user_register_insert.do" method="post" id="registerForm">

    <div class="container">

      <div class="logo row p-1">

        <div class="col-4 p-2 m-auto">
          <a href="#">
          <img src="https://image.a-rt.com/art/system/site/202207/1658299296317.png">
          </a>
        </div>

        <div class="col-4 mt-4">
         <div class="border-2 border-bottom border-secondary row d-flex justify-content-center">
          <div class="col-10">
            <input type="search" class="search border border-0 w-100 h-100" id="search" placeholder="검색어를 입력하세요.">
          </div>
          <div class="col-2 d-flex justify-content-end">
            <div class="d-flex m-2">
             <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
             <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>
             </svg>
            </div>
            <div class="d-flex m-2">
             <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
             <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
             </svg>
            </div>
          </div>
         </div>
        </div>
     <div class="col-4">
          <div class="m-auto d-flex justify-content-between w-25">

			<c:choose>
			<c:when test="${sessionScope.login_chk == 'true'}">
				<small>${sessionScope.user_id}님 안녕하세요</small>
				  <a href="${ctxPath}/logout.do" class="hearder_link">  <!-- 로그아웃 버튼 -->
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
	              <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
	              <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">logout</label>
	          </div>
	          </a>

			</c:when>
			<c:otherwise>
				  <a href="${ctxPath}/login_page.do" class="hearder_link">  <!-- 로그인 버튼 -->
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
	              <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
	              <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">LOGIN</label>
	          </div>
	          </a>
	
	          <a href="${ctxPath}/user_register.do" class="hearder_link">
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">JOIN</label>
	          </div>
	          </a>
			
			
			</c:otherwise>
			</c:choose>
        



          <a href="#" class="hearder_link" onclick="cartlist()">
          <div class="row p-3 d-block align-content-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
              </svg>
              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">CART</label>
          </div>
          </a>





<!--           <a href="#" class="hearder_link">
          <div class="row p-3 d-block align-content-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-shop-window" viewBox="0 0 16 16">
              <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z"/>
              </svg>
              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">STORE</label>
          </div>
          </a> -->
          
          <c:if test="${sessionScope.admin == 'true'}">
          <a href="#" class="hearder_link" onclick="admin_sellingList()">
          <div class="row p-3 d-block align-content-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-shop-window" viewBox="0 0 16 16">
              <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z"/>
              </svg>
              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">Admin</label>
          </div>
          </a>
          </c:if>
          </div>
        </div>

     </div>  <!-- logo -->
    </div>  <!-- container -->
     
      <nav class="navbar navbar-expand-lg p-1" style="background-color: rgb(240, 36, 36);">
        <div class="container-fluid">
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <div class="col-2"></div>
            <ul class="navbar-nav me-auto col-4 justify-content-start">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: yellow; margin-right: 1em;">BRAND</a>
              </li>
              <li class="nav-item P-2">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-right: 1em;">MEN</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-right: 1em;">WOMEN</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-right: 1em;">KIDS</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white;">SALE</a>
              </li>
            </ul>
            <ul class="navbar-nav me-auto col-4 justify-content-end">
              <li class="nav-item P-2">
                <a class="nav-link active" aria-current="page" href="#" style="color: white;"><strong>기획전</strong></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-left: 0.8em;"><strong>이벤트/쿠폰</strong></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-left: 0.8em;"><strong>고객센터</strong></a>
              </li>
            </ul>
            <div class="col-2"></div>
          </div>
        </div>
      </nav>


      <div class="main mt-5 mb-5">
        
        <div class="row d-flex">
            <div class="col-3"></div>

            <div class="col-6 row justify-content-center">
                <h3 class="mb-5 mt-5 text-center"><strong>온라인 회원가입</strong></h3>
            
                <h5 class="mb-3 mt-2"><strong>약관동의</strong></h5>

                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    <div class="row d-flex">
                        <div class="col-12 m-auto">
                            <div class="container">
                              <div class="w-75 m-auto form-check">
                                <div class="mt-3">
                                  <input type="checkbox" id="chk_all" value="A" class="form-check-input"/> 
                                  <label for=""><strong>전체 약관에 동의합니다</strong></label>
                                </div>
                                  <div class="mt-3">
                                  <input type="checkbox" id="chk1" class="chk form-check-input" value="A" />
                                  <label for=""><label for="" style="color: red;">[필수]</label> 사이트 이용약관 </label>
                                  <textarea name="" id="" cols="30" rows="3" class="form-control mt-3">이 약관은 (주)에이비씨마트코리아 회사(이하 "회사"라 함)가 운영하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
                                  </textarea
                                  >
                                </div>
                                <div class="mt-3">
                                  <input type="checkbox" id="chk2" class="chk form-check-input" value="B" />
                                  <label for=""><label for="" style="color: red;">[필수]</label> 전자상거래 이용약관 </label>
                                  <textarea name="" id="" cols="30" rows="3" class="form-control mt-3">이 약관은 ㈜에이비씨마트코리아(이하 "당사"라 함)가 운영하는 통합 사이버몰인 A-RT닷컴(http://www.a-rt.com) (이하 "닷컴"이라 함)을 통하여 제공하는 전자지급결제대행서비스, 결제대금예치서비스 및 선불전자지급수단(‘포인트’, ‘쿠폰’)의 발행 및 관리 서비스(이하 통칭하여 ‘전자금융거래서비스’라 합니다)를 이용자가 이용하는 경우, ‘회사’와 이용자간 전자금융거래의 법률관계를 정함에 그 목적이 있습니다.</textarea
                                  >
                                </div>
                                <div class="mt-3">
                                  <input type="checkbox" id="chk3" class="chk form-check-input" value="C" />
                                  <label for=""><label for="" style="color: red;">[필수]</label> 개인정보 수집 및 이용 동의</label>
                                  <textarea name="" id="" cols="30" rows="3" class="form-control mt-3">개인정보처리자는 정보주체의 동의를 받은 경우에만 개인정보를 수집할 수 있으며, 그 수집 목적의 범위 내에서만 이용할 수 있습니다. 따라서, 정보주체에게 동의를 받을 경우에는 1) 개인정보 수집 및 이용 목적, 2) 수집하려는 개인정보의 항목, 3) 개인정보의 보유 및 이용 기간, 4) 동의를 거부할 권리가 있다는 사실 및 불이익이 있을 경우 그 내용 이 필수로 알려져야 합니다. 만일, 동의를 받지 않고 개인정보를 수집하거나 이용할 경우에는 5년 이하의 징역 또는 5천만원 이하의 벌금에 처할 수 있습니다.</textarea
                                  >
                                </div>
                                <div class="mt-3 mb-4">
                                  <input type="checkbox" id="sellect1" class="sellect form-check-input" value="sel1" />
                                  <label for="">[선택] 마케팅 정보 수신동의 </label>
                                  <textarea name="" id="" cols="30" rows="3" class="form-control mt-3">개인정보가 제공되는 비즈니스 파트너사, 제공 정보, 제공된 정보의 이용목적은 아래와 같습니다. 회원님들 중 이 개인정보의 제3자 마케팅 활용동의서 등에 동의하신 회원님들의 정보만이 제공되며, 제공된 정보는 명시된 이용목적을 벗어나 이용되지 않고, 개인정보의 유출 등 사고가 일어나지 않도록 더욱 철저한 보안이 이루어지도록 노력하고 있습니다.</textarea
                                    >
                                  </div>
                              </div>
                          </div>
                        </div>
                    </div>

                </div>

            </div>    <!-- col-8 -->


            <div class="col-3"></div>
        </div>

        <div class="row d-flex mt-5">
            <div class="col-3"></div>

            <div class="row col-6">

                <div>
                    <h5 class="mb-3"><strong>회원 정보</strong></h5>
                    <div class="bg-opacity-10 border border-2 border-start-0 border-end-0">

                      <div class="mt-5 mb-5 row justify-content-start">

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>아이디 <label style="color: red;">*</label></strong></label>
                          <input type="text" class="col-6 underline p-1" id="user_id" name="user_id" placeholder="아이디를 입력해 주세요" style="font-size: 1rem;">&nbsp;
                          <input type="button" id="chkIdBtn" class="col-2 btn btn-outline-secondary rounded-0 btn-sm" value="중복체크">
                          <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>비밀번호 <label style="color: red;">*</label></strong></label>
                          <input type="text" class="col-8 underline p-1" id="user_pw" name="user_pw" placeholder="비밀번호를 입력해 주세요" style="font-size: 1rem;">
                          <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>비밀번호 확인 <label style="color: red;">*</label></strong></label>
                          <input type="text" class="col-8 underline p-1" id="user_pw2" name="user_pw2" placeholder="비밀번호를 재입력해 주세요" style="font-size: 1rem;">
                          <div class="col-1"></div> 
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>닉네임 </strong></label>
                          <input type="text" class="col-8 underline p-1" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요" style="font-size: 1rem;">
                          <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>이름 <label style="color: red;">*</label></strong></label>
                          <input type="text" class="col-8 underline p-1" id="name" name="name" placeholder="한글, 영문, 숫자만 입력해주세요" style="font-size: 1rem;">
                          <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"><strong>이메일 </strong></label>
                          <input type="text" class="col-8 underline p-1" id="email" name="email" placeholder="이메일 주소를 입력해 주세요" style="font-size: 1rem;">
                          <div class="col-1"></div>
                        </div>
                      
                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                           <label class="col-2 align-self-center"><strong>주소 <label style="color: red;">*</label></strong></label>
                           <input type="text" class="col-2 underline p-1" id="address" name="address">&nbsp;
                           <input type="button" class="col-2 btn btn-outline-secondary rounded-0 btn-sm" value="우편번호 찾기">
                           <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                          <label class="col-2 align-self-center"></label>
                          <input type="text" class="col-8 underline p-1">
                          <div class="col-1"></div>
                        </div>

                        <div class="row d-flex m-2 mb-3">
                          <div class="col-1"></div>
                            <label class="col-2 align-self-center"><strong>전화번호 </strong></label>
                            <input type="text" class="col-8 underline p-1" id="phone" name="phone" placeholder="전화번호를 '-' 없이 입력해 주세요" style="font-size: 1rem;">
                            <div class="col-1"></div>
                         </div>
                      </div>

                    </div>
                </div>

                
                
               
            </div>    <!-- col-5 -->





            <div class="col-3"></div>
        </div>


        <div class="row d-flex m-5">
          <div class="col-3"></div>
          <div class="row col-6 mb-5">
            <div class="d-flex justify-content-center">
              <button type="button" class="btn btn-lg btn-secondary m-1 rounded-0" style="width: 20%; height: 90%;">취소</button>
              <button type="submit" class="registerBtn btn btn-lg btn-dark m-1 rounded-0" id="next" style="width: 20%; height: 90%;">회원가입</button>
           </div>
          </div>
          <div class="col-3"></div>
      </div>    
      
      </div>
      <!-- end main -->

      

      <div class="p-2 bg-secondary bg-opacity-10 border border-start-0 border-end-0">
        <div class="d-flex">
          <div class="col-2"></div>
          <div class="col-5">
            <div class="d-flex">
              <p class="m-1" style="font-size: 0.9em;"><strong>통합고객센터</strong></p>
              <p class="m-1" style="font-size: 0.9em;">1588-1234</p>
              <p class="m-1" style="color: rgb(144, 143, 143); font-size: 0.9em;"">월~금 09:00 ~ 12:00 / 13:00 ~ 18:00 (주말,공휴일 휴무)</p>
            </div>
          </div>
          <div class="col-1">
            <div class="m-1">
              <a href="#" class="link-body-emphasis link-offset-2 link-underline-opacity-0" style="font-size: 0.9em;"><strong>NOTICE</strong></a>
            </div>
          </div>
        </div>
      </div>





      <!-- footer -->

      <div>
       <div class="row mb-3">
        <div class="col-2"></div>
        <div class="col-5">
          <img src="https://image.a-rt.com/art/system/site/202207/1658299296317.png" style="width: 18%;" class="mb-3 mt-3">
          <p style="font-size: 0.7em; color: rgb(105, 105, 105);">
            (주)에이비씨마트 코리아 대표이사 ｜ 이기호 주소 ｜ 서울특별시 중구 을지로 100, B동 21층 (을지로 2가, 파인에비뉴)<br>
            사업자등록번호 ｜ 201-81-76174 통신판매업신고 ｜ 제 2015-서울중구-1036호<br>
            개인정보보호 책임자 ｜ 박영수 이메일 ｜ abcmartcs@abcmartkorea.com
          </p>
          <p style="font-size: 0.7em;">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">사업자정보확인</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">개인정보처리방침</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">이용약관</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">멤버십 이용약관</a>
          </p>
        </div>
        <div class="col-1 mt-4">
          <p style="font-size: 0.9em; color: rgb(36, 36, 36);"><strong>HELP</strong></p>
          <p style="font-size: 0.9em; color: rgb(105, 105, 105);">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">고객센터</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">매장찾기</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">입점/제휴문의</a>
          </p>
        </div>

        <div class="col-1 mt-4">
          <p style="font-size: 0.9em; color: rgb(36, 36, 36);"><strong>BRAND</strong></p>
          <p style="font-size: 0.9em; color: rgb(105, 105, 105);">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">HAWKINS</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">SPERRY</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">DANNER</a>
          </p>
        </div>

        
        
       </div>
      </div>  <!-- footer -->

        </form>
  </div>  <!-- main -->
  



<script
  src="https://code.jquery.com/jquery-3.7.0.js"
  integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
  crossorigin="anonymous"></script>
<script>
  const all_chk = document.querySelectorAll(".chk");
      const chk_once = document.querySelector("#chk_all");
      const next_btn = document.querySelector("#next");

      chk_once.addEventListener("change", () => {
        if (chk_once.checked) {
          all_chk.forEach((chk) => {
            chk.checked = true;
          });

          document.querySelector(".sellect").checked = true;
          document.querySelector("#next").disabled = false;
        } else {
          all_chk.forEach((chk) => {
            chk.checked = false;
          });
          document.querySelector(".sellect").checked = false;
          document.querySelector("#next").disabled = true;
        }
      });

      all_chk.forEach((chk) => {
        chk.addEventListener("change", () => {
          let total_chk = 0;
          all_chk.forEach((chk) => {
            if (chk.checked) total_chk++;
          });
          if (total_chk == all_chk.length) {
            chk_once.checked = true;
            document.querySelector("#next").disabled = false;
          } else {
            chk_once.checked = false;
            document.querySelector("#next").disabled = true;
          }
        });
      });

      next_btn.addEventListener("click", () => {});
      
      
      
      

      $(function(){
			
         $('#chkIdBtn').click(function(e){
           e.preventDefault();	//submit() 기능 중지
          
           var user_id = $('#user_id').val()
           console.log('id: '+user_id)
				
			 	if (user_id.length==0 || user_id==''){
			 		alert("ID를 입력하세요.")
					
			 		$('#user_id').focus()	// 커서를 id항목으로 위치
			 		return;
			 	}
				
			 	// 중복체크 요청(Ajax방식)
			 	$.ajax({
			 		type: 'post',
			 		async: false,
			 		url: '${ctxPath}/checkId.do',
			 		dataType: "text",
			 		data: {user_id: user_id},
			 		success: function(data, textStatus){
			 			console.log(data)
			 			if (data === 'usable'){
			 				alert('사용가능한 아이디입니다.')
			 				$('.registerBtn').prop('disabled', false); // 회원가입 활성화
			 			} else {
			 				alert('이미 등록된 아이디입니다.');
			 				$('.registerBtn').prop('disabled', true); // 회원가입 비활성화
			 			}	
			 		}
					
			 	});	//end ajax
				
			 }); //chkIdBtn()
			
			$('.registerBtn').click(function(e){
				e.preventDefault();
				
				let user_pw = $('#user_pw').val()
				let user_pw2 = $('#user_pw2').val()
				
				if ($('#user_id').val() == '' || $('#user_id').val().length==0){
					alert('아이디는 필수 항목입니다.')
					$('#user_id').focus();
					return;
				}
				
				if ($('#user_pw').val() == '' || $('#user_pw').val().length==0){
					alert('비밀번호는 필수 항목입니다.')
					$('#user_pw').focus();
					return;
				}
				
				if ($('#user_pw2').val() == '' || $('#user_pw2').val().length==0){
					alert('비밀번호 확인은 필수 항목입니다.')
					$('#user_pw2').focus();
					return;
				}
				
				if (user_pw != user_pw2){
					alert('입력한 비밀번호와 일치하지 않습니다.')
					$('#user_pw').focus()
					return;
				}
	
				
				if ($('#name').val() == '' || $('#name').val().length==0){
					alert('이름은 필수 항목입니다.')
					$('#name').focus();
					return;
				}

        		if ($('#address').val() == '' || $('#address').val().length==0){
					alert('주소는 필수 항목입니다.')
					$('#address').focus();
					return;
				}
				
				
				
				$('#registerForm').submit()
			});
			
		}); // end Function
      
      
      
      
      
      
</script>

</body>
</html>
