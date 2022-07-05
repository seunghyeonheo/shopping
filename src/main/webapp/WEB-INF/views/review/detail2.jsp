<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript">
	function cart() {
		if ('${sessionScope.id}' == '') {
			alert('먼저 로그인을 하세요');
			location.href = '/member/login';
			return;
		}
		//카트테이블에 등록하고 등록확인 창 보여주기(비동기)
	}
	function order() {
		if ('${sessionScope.id}' == '') {
			alert('먼저 로그인을 하세요');
			location.href = '/member/login';
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
				<h4>
					<img src="/svg/box2-heart.svg"> 상품 정보
				</h4>
				<img class="img-rounded" src="/contents/storage/${dto.filename}"
					style="width: 250px">
				<div class="caption">
					<p>상품명:${dto.pname}</p>
					<p>${dto.detail }</p>
				</div>
			</div>
			<div class="col-sm-6">
				<h4>
					<img src="/svg/rulers.svg"> 사이즈 및 수량
				</h4>
				<ul class="list-group">
					<li class="list-group-item">사이즈 : <c:choose>
							<c:when test="${dto.cateno==1}">
								<select class="form-select" aria-label="Default select example">
									<option selected>사이즈 선택</option>
									<option value="1">L</option>
									<option value="2">M</option>
									<option value="3">S</option>
								</select>
							</c:when>
							<c:when test="${dto.cateno==2}">
								<select class="form-select" aria-label="Default select example"
									disabled="disabled">
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
					<li class="list-group-item">수량 : <input type="number"
						name="quantity" min=0 max=20 value="1">
					<li class="list-group-item"><a href="javascript:cart()"> <img
							class='btn' src="/svg/cart4.svg" /></a> <a href="javascript:order()">
							<img class='btn' src="/svg/bag-heart-fill.svg" />
					</a> <a href="javascript:history.back()"> <img class='btn'
							src="/svg/arrow-return-left.svg" /></a>
				</ul>
			</div>
		</div>
	</div>
	

    
<script>
	function list() {
		let url = '/review/detail';
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href= url;
	}


	function update() { //수정페이지로 이동
		let url = '/review/update/${dto.contentsno}';
		location.href = url;
	}
	function del() {//삭제페이지로 이동
		let url = '/review/delete/${dto.contentsno}';
		url += '?oldfile=${dto.filename}'
		location.href = url;
	}
	function reply() {//답변페이지로 이동
		let url = '/review/reply/${dto.contentsno}';
		location.href = url;
	}
</script>
</head>

<form class="form-horizontal" 
      action="/review/detail">
      
      
<body>
	


	<div class='center'>

		<div class="col-lg-7">

			<!-- panel start-->
			<div class="panel panel-default" >

				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> 후기
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
				</div>


				<div class="panel-body">

					<ul class="chat list-group">
						<li class="left clearfix" data-rno="5">
							<div>
								<div class="header">
									<strong class="primary-font">user1</strong> <small
										class="pull-right text-muted">2019-05-12</small>
								</div>
								<p>Good job!</p>

							</div>
						</li>
					</ul>
					<!-- ul end  -->
				</div>

				<div class="panel-footer"></div>

			</div>
			<!-- panel end-->
		</div>
		<!--  col-lg-12 end -->
	</div>
	<!-- row end -->
	
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal"
        aria-hidden="true">&times;</button>
      <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
    </div>
    <div class="modal-body">
      <div class="form-group">
        <label>내용</label> 
        <textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea> 
      </div>      
    </div>
<div class="modal-footer">
<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
</div>          </div>
  <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
 
	
 <!-- 페이지 로딩시 댓글 목록 처리-->
 <!-- jstl는 internal javascript에서 사용가능 -->
 <script>
  let rnum = "${dto.rnum}"; 
  let sno = "${sno}";
  let eno = "${eno}";
 <!-- 댓글용 paging, 게시판 검색 -->
  let nPage = "${nPage}";
  let nowPage = "${param.nowPage}";
  let colx = "${param.col}";
  let wordx = "${param.word}";
 </script>
 <!-- 댓글처리 관련 Javascript 파일 추가-->
<script src="/js/producer.js"></script> <!-- promise를 생성 -->
 
<script src="/js/consumer.js"></script> <!-- promise를 사용 -->

</body>
</form>
</html>