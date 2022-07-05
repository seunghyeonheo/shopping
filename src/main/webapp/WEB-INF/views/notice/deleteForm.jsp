<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script>
	function listM() {
		var url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
	</script>
<title>homepage</title>
</head>
<style type="text/css">
  #red{
  	color : red;
  }
  </style>
<body>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
<form class="form-horizontal" 
      action="/notice/delete"
      method="post"
      >
 
 <input type="hidden" name="noticeno" value="<%=request.getParameter("noticeno") %>">

   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">삭제</button>
    <button type="reset" class="btn" onclick="location.href='list'">취소</button>
   </div>
 </div>
</form>
</div>
</body>
</html>