<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap" class="col-7">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center p-5">
		
			<div class="py-5">
			
				<div class="p-1">
				
					<div class="input-box border rounded">
						<textarea class="form-control border-0" rows="5" id="contentInput"> </textarea>
						<div class="d-flex mt-2 justify-content-between border-top">
							<input type="file" class="btn"/>
							<button type="button" class="btn btn-info m-1" id="uploadBtn"> 업로드</button>
						</div>
					</div>
					
					<div class="mt-4">
						<c:forEach var="postDetail" items="${postList }" >
							<div>
							
								<div class="d-flex justify-content-between p-2">
									<div> ${postDetail.user.name } </div>
									<div> <i class="bi bi-three-dots"> </i> </div>
								</div>
								
								<div>
									<div> <img src="/static/img/audience.png" class="w-100" /> </div>
								</div>
								
	
								<div class="d-flex p-2">
									<div class="heart-size"> <i class="bi bi-heart"> </i> </div>
									<div class="ml-1"> n개 </div>
								</div>
		
								<div class="p-2">
									<div> ${postDetail.post.content } </div>
								</div>	
												
								<div class="p-2">
									<div class="mb-2 border-bottom"> <small> 댓글 </small> </div>
									
									<div class="mt-2">
										<div> user_commet ORDER BY `updatedAt` DESC LIMIT 3 </div>
										<div> user_commet2 ORDER BY `updatedAt` DESC LIMIT 3 </div>
									</div>
									
									<div class="input-group input-group-sm mt-2">
										<input type="text" class="form-control">	
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroup-sizing-sm">
												<button type="button" class="btn"> 작성 </button>
											</span>
										</div>
									</div>
									
								</div>
								
							</div>
						</c:forEach>
					</div>
					
				</div>
				
			</div>
			
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#uploadBtn").on("click", function() {
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:{"content":content},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("메모 작성 실패");
						}
					},
					error:function() {
						alert("에러 발생!!");
					}
					
				});
			});
			
		});
	
	
	</script>
	
	
</body>
</html>