<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
 			<nav class=" d-flex">
 			
				<div id="search" class="input-group input-group-sm p-4 pl-5">
				  <div class="input-group-prepend">
				    <span class="input-group-text">
				    	<a href="#">
				    		<img width="15" src="/static/img/searching.png" />
				    	 </a>
				    </span>
				  </div>
				  <input type="text" class="form-control">
				</div>
				
				<div id="menu" class="d-flex justift-content-center">
					<nav class="d-flex align-items-center justify-content-end">
						<ul class="nav ">
							<li class="nav-item">
								<a href="#" class="nav-link">
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
										<div> ${userName} 님 <a href="/user/sign/out"> 로그아웃 </a> </div>
									</c:if>
							</li>
						</ul>
					</nav>
				</div>
				
			</nav>