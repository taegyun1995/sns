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
		<hr>
		
		<section class="d-flex justify-content-center px-5">
		
			<div class="py-5">
			
				<div class="p-1">
				
					<div class="input-box border rounded">
						<textarea class="form-control border-0" rows="5" id="contentInput"> </textarea>
						
						<div class="d-flex justify-content-between mt-2">
							<a href="#" id="imageIcon"> <i class="bi bi-image"></i> </a>
							<input type="file" class="btn d-none" id="fileInput">
							<button type="button" class="btn btn-info m-1" id="uploadBtn"> 업로드</button>
						</div>
					</div>
					
					<div class="mt-4">
						<c:forEach var="postDetail" items="${postList }" varStatus="status">
							<div class="border px-2 my-3">
							
								<div class="d-flex justify-content-between p-2">
									<div> ${postDetail.user.name } </div>
									<div>
									<%-- 로그인한 사용자 userId 가 해당 게시글의 사용자 userId 가 일치하는 경우에 해당 버튼 노출 --%>
										<c:if test="${userId eq postDetail.user.id }">
										 <%-- 삭제 버튼 --%>
											<a href="#"  data-toggle="modal" data-target="#moreModal" class="more-btn" data-post-id="${postDetail.post.id }">
												<i class="bi bi-three-dots"></i>
											</a>
										</c:if>
									</div>
								</div>
								
								<div>
									<div> <img src="${postDetail.post.imagePath }" class="w-100" /> </div>
								</div>
								
	
								<div class="d-flex p-2">
									<c:choose>
										<c:when test="${postDetail.like }" >
											<a href="#" class="unlike-btn" data-post-id="${postDetail.post.id }">
												<span class="heart-size text-danger"> <i class="bi bi-heart-fill"> </i> </span>
											</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="like-btn" data-post-id="${postDetail.post.id}">
												<span class="heart-size"> <i class="bi bi-heart"> </i> </span>
											</a>
										</c:otherwise>
									</c:choose>
									<div class="ml-1"> 좋아요 ${postDetail.likeCount}개</div>
								</div>
		
								<div class="p-2">
									<div> ${postDetail.post.content } </div>
								</div>	
												
								<div class="p-2">
									<div class="mb-2 border-bottom"> <small> 댓글 </small> </div>
									
									<div class="mt-2">
										<c:forEach var="commentDetail" items="${postDetail.comment }" >
											<div> <b> ${commentDetail.user.name} </b>  ${commentDetail.comment.content } </div>
										</c:forEach>
									</div>
									
									<div class="input-group input-group-sm mt-2">
										<input type="text" class="form-control" id="commentInput${postDetail.post.id }">	
										<div class="input-group-prepend">
											<span class="input-group-text">
												<button type="button" class="btn btn-success comment-btn" data-post-id="${postDetail.post.id }" > 작성 </button>
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
		
		<!-- Modal -->
		<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      
		      <div class="modal-body text-center">
		        <a href="#" id="deleteBtn">삭제하기</a>
		      </div>
		      
		    </div>
		  </div>
		</div>
	
	</div>
	
	<script>
		$(document).ready(function(){
			
			$(".more-btn").on("click", function(){
				// 이벤트가 발생한 버튼에서 post-id를 얻어온다.
				let postId = $(this).data("post-id");
				
				// 삭제하기 버튼에 해당 post-id를 저장한다. (data-post-id 속성에 값을 넣는다.)
				// <a href="#" id="deleteBtn" data-post-id="8"> 삭제하기 </a>
				$("#deleteBtn").data("post-id", postId);
				
				
			});
			
			$("#deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("삭제 에러");
					}
				});
				
			});
			
			$(".unlike-btn").on("click", function(e){
				e.preventDefault();
				// data-post-id
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 취소 실패..");
						}
					},
					error:function() {
						alert("좋아요 취소 에러!!");
					}
				});
				
			});
			
			$(".like-btn").on("click", function(e) {
				e.preventDefault();
				
				// 현재 클릭된 태그 객체를 얻어와서 postId를 얻어온다.
				// data-post-id="10"
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("좋아요 실패");
						}
					},
					error:function() {
						alert("좋아요 에러")
					}
				});
			});
			
			$("#imageIcon").on("click", function(e) {
				// fileInput을 클릭한 효과를 만들어야 한다.
				e.preventDefault();
				$("#fileInput").click();
			});
			
			$("#uploadBtn").on("click", function(e) {
				e.preventDefault();
				let content = $("#contentInput").val().trim();
				
				if(content == "") {
					alert("내용을 입력해주세요.");
					return;
				}
				
				// 파일 선택 유효성 검사
				// $("#fileInput")[0].files[0]
				if($("#fileInput")[0].files.length == 0) {
					alert("이미지를 선택하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					
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
			
			$(".comment-btn").on("click", function(){
				// 이벤트가 일어난 버튼에서 postId를 얻어 온다.
				let postId = $(this).data("post-id");
				// 작성한 댓글 가져오기				
				// #commentInput5
				let content = $("#commentInput" + postId).val();
				
				$.ajax({
					type:"post",
					url:"/post/comment/create",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if(data.result == "success"){
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
					},
					error:function() {
						alert("댓글 작성 에러");
					}
				});		
				
			});
			
			
			
		});
	
	
	</script>
	
	
</body>
</html>