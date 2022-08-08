<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 			<nav class="d-flex">
				
				<div class="d-flex justift-content-center">
					<nav class="d-flex align-items-center justify-content-end">
						<ul class="nav ">
							<li class="nav-item">
								<a href="/sportgram/main/view" class="nav-link">
									<img width="50" src="/static/img/home.png" />
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<img width="50" src="/static/img/photo.png" />
								</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">
									<img width="50" src="/static/img/me.png" />
								</a>
							</li>
							<li class="nav-item">
								<c:if test="${not empty userId }" >
									<div class="nav-link"> ${userName} 님 <a href="/user/sign/out"> 로그아웃 </a> </div>
								</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
			</nav>