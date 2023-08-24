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
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  
  <style>
    .search:focus {
      outline: none;
    }

    .a_link {
      color: black;
      text-decoration-line: none;
    }

    .hearder_link {
      color: black;
      text-decoration-line: none;
    }

    .hearder_label {
      cursor: pointer;
    }

  </style>

</head>
<body>

      
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
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0" onclick="qnaList()">문의사항</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0" onclick="noticeList()">공지사항</a><br>
          </p>
        </div>

        <div class="col-1 mt-4">
          <p style="font-size: 0.9em; color: rgb(36, 36, 36);"><strong>BRAND</strong></p>
          <p style="font-size: 0.9em; color: rgb(105, 105, 105);">
            <a href="https://www.nike.com" class="link-secondary link-offset-2 link-underline-opacity-0">NIKE</a><br>
            <a href="https://www.adidas.com" class="link-secondary link-offset-2 link-underline-opacity-0">ADIDAS</a><br>
            <a href="https://www.nbkorea.com" class="link-secondary link-offset-2 link-underline-opacity-0">NEWBALANCE</a><br>
            <a href="https://kr.puma.com" class="link-secondary link-offset-2 link-underline-opacity-0">PUMA</a><br>
            <a href="https://converse.co.kr" class="link-secondary link-offset-2 link-underline-opacity-0">CONVERSE</a>
          </p>
        </div>

       </div>
      </div>  <!-- footer -->

  





  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript">

    $(function(){
      
      document.getElementById('slide_hidden').style.display = 'none';
      document.getElementById('mule_hidden').style.display = 'none';
      document.getElementById('zaxy_hidden').style.display = 'none';

      document.getElementById('crocsBtn').style.color = "red";

      $('#crocsBtn').on("click",function(){

        $('#crocs_hidden').show();
        $('#slide_hidden').hide();
        $('#mule_hidden').hide();
        $('#zaxy_hidden').hide();


        document.getElementById('crocsBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
      })


      $('#slideBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#mule_hidden').hide();
        $('#zaxy_hidden').hide();
        
        document.getElementById('slide_hidden').style.display = 'block';
        
        
        document.getElementById('slideBtn').style.color = "red";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
      })


      $('#muleBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#slide_hidden').hide();
        $('#zaxy_hidden').hide();
        
        document.getElementById('mule_hidden').style.display = 'block';

        document.getElementById('muleBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
        
      })


      $('#zaxyBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#slide_hidden').hide();
        $('#mule_hidden').hide();
        
        document.getElementById('zaxy_hidden').style.display = 'block';

        document.getElementById('zaxyBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        
      })

      
    })
    
    function cartlist(){
			location.href="${ctxPath}/cartlist.do"
		}
    
    function qnaList(){
		location.href="${ctxPath}/qnaList.do"
	}
    
    function noticeList(){
		location.href="${ctxPath}/noticeList.do"
	}
    function admin_sellingList(){
		location.href="${ctxPath}/admin_sellingList.do"
	}
    function productView(){
		location.href="${ctxPath}/productView.do"
	}
    function productSerchList(){
		location.href="${ctxPath}/productSerchList.do"
	}
    function productList(){
		location.href="${ctxPath}/productList.do"
	}




  </script>

</body>
</html>