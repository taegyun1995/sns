<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
		
		<section class="d-flex justify-content-center">
			<section class="col-4 border">
			
				<h1 class="sportgram text-center pt-3"> SportGram </h1>
			
				<div class="text-center">
					<div class="pt-4"> 운동하는 사람들의 사진과 동영상을 공유하고 </div>
					<div> 싶은 분들은 가입하세요 </div>
				</div>
				
				<input type="text" class="inform form-control col-12 mt-4" id="loginId" placeholder="아이디" />
				<input type="password" class="inform form-control col-12 mt-3" id="password" placeholder="비밀번호" />
				<input type="password" class="inform form-control col-12 mt-3" id="passwordconfirm" placeholder="비밀번호 확인" />
				<input type="text" class="inform form-control col-12 mt-3" id="name" placeholder="이름" />
				<input type="text" class="inform form-control col-12 mt-3" id="phoneNum" placeholder="연락처" />
				
				<button type="button" class="btn btn-info form-control mt-3" id="signupBtn"> 회원가입 </button>
				
				<div class="d-flex justify-content-center pt-2 pb-5">
					<div> 계정이 있으신가요? </div>
					<a href="/user/signin/view" target="_blank" class="pl-2"> 로그인 </a>
				</div>
				
			</section>
			
		</section>
		
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		
		$(document).ready(function(){
			
			$("#signupBtn").on("click", function(){
				
				let id = $("#loginId").val();
				let pw = $("#password").val();
				let pw2 = $("#passwordconfirm").val();
				let name= $("#name").val();
				let phoneNum = $("#phoneNum").val();
				
				if(id == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				if(pw == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(pw != pw2) {
					alert("비밀번호가 일치하지 않습니다.")
					return;
				}
				
				if(name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				
				if(phoneNum == "") {
					alert("연락처를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":id, "password":pw, "name":name, "phoneNum":phoneNum},
					
					success:function(data) {
						if(data.result == "success") {
							location.href="/sportgram/user/signin/view";
						} else {
							alert("회원가입 실패");
						}
					},
					
					error:function() {
						alert("회원가입 에러");
					}
					
				});
				
			});
			
		});
	
	
	
	</script>
	
	
</body>
</html>