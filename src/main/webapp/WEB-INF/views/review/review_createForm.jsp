<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/style.css">
  <script type="text/javascript">
  function cart(){
	  if('${sessionScope.id}' == ''){
		  alert('먼저 로그인을 하세요');
		  location.href='/member/login';
		  return;
	  }
	  //카트테이블에 등록하고 등록확인 창 보여주기(비동기)
  }
  function order(){
	  if('${sessionScope.id}' == ''){
		  alert('먼저 로그인을 하세요');
		  location.href='/member/login';
		  return;
	  }
	  //주문서 작성으로 이동 주문생성(비동기)
  }
  </script>
</head>
<body>
 
<div class="container">
  <div class="row">
  <div class="col-sm-3">
  <h4><img src="/svg/box2-heart.svg"> 상품 정보</h4>
  <img class="img-rounded" src="/contents/storage/${dto.filename}" style="width:250px">
  <div class="caption">
    <p>상품명:${dto.pname}</p>
    <p>${dto.detail }</p>
  </div>
  </div>
  <div class="col-sm-6">
  <h4><img src="/svg/rulers.svg"> 사이즈 및 수량</h4>
  <ul class="list-group">
    <li class="list-group-item">사이즈 :
    <c:choose>
	<c:when test="${dto.cateno==1}">
     <select class="form-select" aria-label="Default select example">
  <option selected>사이즈 선택</option>
  <option value="1">L</option>
  <option value="2">M</option>
  <option value="3">S</option>
		</select>
		</c:when>    
	<c:when test="${dto.cateno==2}">
	 <select class="form-select" aria-label="Default select example" disabled="disabled">
  <option selected>사이즈 선택</option>
		</select>
	</c:when>
	<c:when test="${dto.cateno==3}">
	 <select class="form-select" aria-label="Default select example">
  <option selected>사이즈 선택</option>
  <option value="220">220</option>
  <option value="230">230</option>
  <option value="240">240</option>
  <option value="240">250</option>
  <option value="240">260</option>
		</select>
	</c:when>
    </c:choose>
    <li class="list-group-item">가격 : ${dto.price }
    <li class="list-group-item">재고 : ${dto.stock }
    <li class="list-group-item">수량 : <input type="number" name="quantity" min=0 max=20 value="1" >     
    <li class="list-group-item">
    
    	<a href="javascript:cart()">
    	 <img class='btn' src="/svg/cart4.svg"/></a>
    	 <a href="javascript:order()">
         <img class='btn' src="/svg/bag-heart-fill.svg"/></a> 
         <a href="javascript:history.back()">
         <img class='btn' src="/svg/arrow-return-left.svg"/></a>
 
  </ul>
  </div>
  </div>
</div>

<form class="form-horizontal" 
      action="/contents/detail"
      method="post"
      enctype="multipart/form-data"
      >
 
  <input type='hidden' name='contentsno' value="${dto.contentsno}">

  <div class="form-group">
    <label class="control-label col-sm-2" for="wname">작성자</label>
    <div class="col-sm-6">
      <input type="text" name="wname" id="wname" class="form-control">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control" value="${dto.title}">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-6">
    <textarea rows="5" cols="5" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  
 <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
 <div class="form-group">
    <label class="control-label col-sm-2" for="filenameMF">비밀번호</label>
    <div class="col-sm-6">
      <input type="file" name="filenameMF" id="filenameMF" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">등록</button>
    <button type="reset" class="btn">취소</button>
   </div>
 </div>
</form>
 
 
 
 
</body>
</html>