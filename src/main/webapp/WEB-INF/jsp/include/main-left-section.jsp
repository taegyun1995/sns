<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
			<section id="left-content" class="pl-4 pr-4 pt-2 pb-4">
			
				<div class="d-flex align-items-center border border-info rounded p-2">	
					<div class="pr-2"> <img width="80" src="/static/img/me.png" /> </div>
					<div class="pr-2"> <img width="80" src="/static/img/me.png" /> </div>
					<div class="pr-2"> <img width="80" src="/static/img/me.png" /> </div>
					<div class="pr-2"> <img width="80" src="/static/img/me.png" /> </div>
				</div>
					
				<div class="d-flex align-items-center border border-info rounded mt-3">
					<div class="p-2"> <img width="70" src="/static/img/me.png" /> </div>
					<div class="p-2"> user_name </div>
				</div>
				
				<div class="story-content border border-info rounded">
					<div> user_post_image </div>
				</div>
					
				<div class="d-flex pt-2">
					<div class="content-like d-flex align-items-center">
						<div> <img width="30" src="/static/img/like.png" /></div>
						<div class="ml-3"> n </div>
						<div> 명이 좋아합니다. </div>
					</div>
					
					<div class="content-switch d-flex justify-content-end align-items-center">
						<button class="btn ml-2"> ⬅︎ </button>
						<button class="btn ml-2"> ➡︎ </button>
					</div>
				</div>
				
				<div class="content pb-1"> user_post_content </div>
				
				<div class="border border-info rounded"> user_commet ORDER BY `updatedAt` DESC LIMIT 3 </div>
					
				<div class="d-flex pt-2">
					<div class="comment-look">
						<div> <a href="#"> user_commet 전체보기 </a> </div>
						<div> `updatedAt`시간 전 </div>
					</div>
					
					<div class="input-group input-group-sm">
						<input type="text" class="form-control">	
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-sm">
								<button type="button" class="btn"> 작성 </button>
							</span>
						</div>
					</div>
				</div>
			
			</section>