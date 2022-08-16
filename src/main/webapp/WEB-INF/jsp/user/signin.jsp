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
		
		<section class="d-flex justify-content-center my-5">
			<div class="d-flex align-items-center mr-5">
				<img src="/static/img/sport.png" width="400" height ="350" />
			</div>
			
			<div>
				<div class="border rounded">
					<div class="w-100 p-5">
						<h2 class="text-center"> 로그인 </h2>
						<br>
						
						<form id="loginForm">
							<input type="text" class="inform form-control mt-3" placeholder="아이디" id="loginIdInput" />
							<input type="password" class="inform form-control mt-3" placeholder="비밀번호" id="passwordInput" />
							
							<button type="submit" class="btn btn-info btn-block mt-4"> 로그인 </button>
							<hr>
						</form>
						
						<div class="d-flex justify-content-center">
							<div> 계정이 없으신가요? </div>
							<a href="/user/signup/view" target="_blank" class="pl-2"> 회원가입 </a>
						</div>
					</div>	
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
				// 해당 이벤트가 가지고 있는 기능을 비활성화
				
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.")
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.")
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signin",
					data:{"loginId":loginId, "password":password},
					
					success:function(data){
						if(data.result == "success") {
							location.href="/post/main/view";
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