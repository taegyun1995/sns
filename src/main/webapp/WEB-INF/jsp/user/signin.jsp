<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<hr>
		
		<section>
			<form id="loginForm" class="d-flex justify-content-center ">
				<div class="logincontent border">
					<h1 class="signinword text-center pt-5"> 로그인 </h1>
					
					<h3 class="signinword pt-5 pl-3"> 아이디 </h3>
					<input type="text" class="inform form-control ml-3 col-10" id="idInput" placeholder="아이디" />
					
					<h3 class="signinword pt-5 pl-3"> 비밀번호 </h3>
					<input type="password" class="inform form-control ml-3 mb-5 col-10" id="pwInput" placeholder="비밀번호" />
					
					<div class="d-flex justify-content-center pt-2">
					<button type="submit" class="userlogin btn btn-info form-control col-10" id="signinBtn" > 로그인 </button>
					</div>
					
					<div class="d-flex justify-content-center pt-2 pb-5">
						<div> 계정이 없으신가요? </div>
						<a href="/user/signup/view" target="_blank" class="pl-2"> 회원가입 </a>
					</div>
									
				</div>
			</form>
		</section>
		
		
		
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
				
				e.preventDefault();
				
				let id = $("#idInput").val();
				let pw = $("#pwInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.")
					return;
				}
				
				if(pw == "") {
					alert("비밀번호를 입력하세요.")
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":id, "password":pw},
					
					success:function(data){
						if(data.result == "success") {
							location.href="/sportgram/main/view";
						} else {
							alert("아이디 / 비밀번호를 확인해주세요.");
						}
					},
					error:function(){
						alert("로그인 에러 발생!!");
					}
					
				});
						
			});
			
		});
	
	
	</script>
	
</body>
</html>