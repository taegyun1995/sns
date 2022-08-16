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
		
		<section class="d-flex justify-content-center my-5">
		
			<div>
			
				<div class="signupContent d-flex justify-content-center align-items-start border rounded">
				
					<div class="w-100 p-5">
						<h2 class="text-center"> SportGram </h2>
						<br>
						<div class="text-center"> 운동하는 사람들의 사진과 동영상을 <br> 공유하고싶은 분들은 가입하세요 </div>
						
						<div class="d-flex mt-3">
							<input type="text" class="form-control" placeholder="아이디"  id="loginIdInput" />
							<button class="btn btn-info btn-sm ml-2" id="duplicateBtn"> 중복확인 </button>
						</div>
						
						<div id="overlapText" class="text-danger d-none"> <small> 중복된 id입니다. </small> </div>
						<div id="possibleText" class="text-success d-none"> <small> 사용가능한 아이디 입니다. </small> </div>
						<input type="password" class="form-control mt-3" id="passwordInput" placeholder="비밀번호" />
						<input type="password" class="form-control mt-3" id="passwordConfirmInput" placeholder="비밀번호 확인" />
						<input type="text" class="form-control mt-3" id="nameInput" placeholder="이름" />
						<input type="text" class="form-control mt-3" id="phoneNumInput" placeholder="연락처" />
						
						<button type="button" class="btn btn-info btn-block mt-3" id="signupBtn"> 회원가입 </button>
						
						<div class="d-flex justify-content-center mt-4 p-3">
							<div> 계정이 있으신가요? </div>
							<a href="/user/signin/view" target="_blank" class="pl-2"> 로그인 </a>
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		
		$(document).ready(function(){
			
			var isDuplicateCheck = false;
			var isDuplicateId = true;
			
			$("#loginIdInput").on("input", function() {
				isDuplicateCheck = false;
				isDuplicateId = true;
				$("#possibleText").addClass("d-none");
				$("#overlapText").addClass("d-none");
			});
			
			$("#duplicateBtn").on("click", function(){
				let loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/user/duplicate_id",
					data:{"loginId":loginId},
					
					success:function(data) {
						
						isDuplicateCheck = true;
						
						if(data.is_duplicate) {
							$("#overlapText").removeClass("d-none");
							$("#possibleText").addClass("d-none");
							isDuplicateId = true;
						} else {
							$("#possibleText").removeClass("d-none");
							$("#overlapText").addClass("d-none");
							isDuplicateId = false;
						}
					},
					error:function() {
						alert("중복확인 에러");
					}
				});
				
			});
			
			$("#signupBtn").on("click", function(){
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name= $("#nameInput").val();
				let phoneNum = $("#phoneNumInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				// 중복체크 여부 유효성 검사 
				// if(isDuplicateCheck == false) {
				if(!isDuplicateCheck) {
					alert("중복여부 체크를 진행해주세요");
					return ;
				}
				
				// 아이디 중복여부 유효성 검사 
				// if(isDuplicateId == true) {
				if(isDuplicateId) {
					alert("중복된 아이디입니다");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return;
				}
				
				if(password != passwordConfirm) {
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
					data:{"loginId":loginId, "password":password, "name":name, "phoneNum":phoneNum},
					
					success:function(data) {
						if(data.result == "success") {
							location.href="/user/signin/view";
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