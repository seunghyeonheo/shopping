
$(function() {
	$("#findpasswd").click(function() {

		let mname = $("#mname").val(); //#에 들어가는 값: form의 id와 일치해야됨.
		let id = $("#id").val();



		let url =
			"http://localhost:8000/member/find_passwd?mname=" + mname + "&id=" + id;

		fetch(url)
			.then((response) => response.json())
			.then((data) => alert("비밀번호는" + data.passwd + "입니다"))

	}
	)
}




)