
$(function() {
	$("#findid").click(function() {

		let mname = $("#mname").val(); //#에 들어가는 값: form의 id와 일치해야됨.
		let email = $("#email").val();



		let url =
			"http://localhost:8000/member/find_id?mname=" + mname + "&email=" + email;

		fetch(url)
			.then((response) => response.json())
			.then((data) => alert("아이디는" + data.id + "입니다"))

	}
	)
}




)