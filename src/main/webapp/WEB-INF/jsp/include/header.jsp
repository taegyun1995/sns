<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
   			<header class="d-flex justify-content-between align-items-center mt-3">
				<h2 class="ml-3"> Sportgram </h2>
				
				<c:if test="${not empty userId}" >
					<div class="mr-3"> ${userName }님 <a href="/user/sign/out"> 로그아웃 </a> </div>
				</c:if>
			</header>