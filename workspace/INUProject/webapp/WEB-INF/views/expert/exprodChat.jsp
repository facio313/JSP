<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2023. 2. 18.      작성자명      최초작성
* Copyright (c) 2023 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/INUProject/resources/css/chat.css">
<div id="container" style=" margin-top: 100px; margin-bottom: 100px;">
<div class="row mt-3">
	<div class="col-auto">
		<input class="btn btn-primary controlBtn beforeConnect" type="button" value="connect" id="connBtn"
			data-url="${pageContext.request.contextPath }/realtime/full/sockJS"
		/>
		<input class="btn btn-danger controlBtn afterConnect" type="button" value="disconnect" id="disconnBtn" disabled />
	</div>

	<div class="col-auto">
		<input class="btn btn-success controlBtn afterConnect" type="button" value="SEND" id="sendBtn" disabled />
	</div>
</div>  
<div id="messageArea" style="width: 400px;">
</div>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/chat.css">
<div id="container" >
	<aside>
		<header>
			<input type="text" placeholder="search">
		</header>
		<ul>
			<li>
				<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_05.jpg" alt="">
				<div>
					<h2>Prénom Nom</h2>
					<h3>
						<span class="status green"></span>
						online
					</h3>
				</div>
			</li>
			
		</ul>
	</aside>
	<main>
		<header>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/chat_avatar_01.jpg" alt="">
			<div>
				<h2>Chat with Vincent Porter</h2>
				<h3>already 1902 messages</h3>
			</div>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_star.png" alt="">
		</header>
		<ul id="chat">
			
		</ul>
		<footer>
			<!-- <textarea placeholder="Type your message"></textarea> -->
			<input type="text" class="form-control controlBtn afterConnect" name="text" disabled id="textIpt"/>
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt="">
			<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt="">
			<input class="btn btn-success controlBtn afterConnect" type="button" value="SEND" id="sendBtn" disabled />
		</footer>
	</main>
	</div>
</div>
<script src="${pageContext.request.contextPath }/resources/js/sockjs-client/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/packages/realtime/websocketView.js"></script>