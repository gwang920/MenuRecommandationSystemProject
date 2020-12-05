<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>메뉴 추천 시스템! 오늘 뭐 eat지?</title>
<link rel="stylesheet" href="view/main.css" type="text/css" />

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>

<script src="view/js/alertify.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0d6e6a070335aaa5e70c85e9c45b206&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0d6e6a070335aaa5e70c85e9c45b206"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0d6e6a070335aaa5e70c85e9c45b206&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0d6e6a070335aaa5e70c85e9c45b206&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,500,700,900"
	rel="stylesheet">

<link rel="stylesheet" href="view/css/alertify.core.css" />
<link rel="stylesheet" href="view/css/alertify.default.css" />
<link rel="stylesheet" href="view/css/alertify.bootstrap.css" />


<title>메뉴 추천 시스템, 오늘 뭐 EAT지?</title>
<!--
Elegance Template
https://templatemo.com/tm-528-elegance
-->
<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css" href="view/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="view/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="view/css/fullpage.min.css">
<link rel="stylesheet" type="text/css" href="view/css/owl.carousel.css">
<link rel="stylesheet" href="view/css/animate.css">
<link rel="stylesheet" href="view/css/templatemo-style.css">
<link rel="stylesheet" href="view/css/responsive.css">


<style>
#menu_add_table>tbody{
	align: center;

}
.auto_menu {
	width:auto;
	height: expression(this.scrollHeight > 99 ? "411px" : "auto");
	max-height: 411px;
	overflow-x: hidden;
	overflow-y: auto;

	

}
#dialogoverlay {
	display: none;
	opacity: .8;
	position: fixed;
	top: 0px;
	left: 0px;
	background: #FFF;
	width: 100%;
	z-index: 10;
}

#dialogbox {
	display: none;
	position: fixed;
	background: #000;
	border-radius: 7px;
	width: 550px;
	z-index: 10;
}

#dialogbox>div {
	background: #FFF;
	margin: 8px;
}

#dialogbox>div>#dialogboxhead {
	background: #666;
	font-size: 19px;
	padding: 10px;
	color: #CCC;
}

#dialogbox>div>#dialogboxbody {
	background: #333;
	padding: 20px;
	color: #FFF;
}

#dialogbox>div>#dialogboxfoot {
	background: #666;
	padding: 10px;
	text-align: right;
}

#wheel_back {
	font-size: 70px;
}

@media ( max-width : 800px ) {
	.the_wheel, .the_wheel thead, .the_wheel tbody, .the_wheel tr,
		.the_wheel th, .the_wheel td {
		display: block;
	}
	.the_wheel tr {
		border-bottom: 1px solid #ddd;
	}
	.the_wheel th, .the_wheel td {
		border-top: none;
		border-bottom: none;
	}
}

.back_ground {
	background-image: url("view/images/img01.jpg");
}

#eat_font {
	font-size: 50px;
}

#star_click:hover{
	color:#0080ff
}

 input[type=text] {
 padding: 10px;
 text-align: left;
 margin: 0px;
 font-size:15px;
}

.star_rating {font-size:0; letter-spacing:-4px; color:#f5f5dc}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#f5f5dc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#0080ff;}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item {color:#282828;};
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#map {color:#282828;}

#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#282828;}


    .wrap {position: absolute;left: 0;bottom: 40px;width: 600px;height:400px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 600px;height: 400px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: linear-gradient( to top, #e2f6fd,#fafdfe ); opacity:0.8;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 70px;background: #eee;border-bottom: 1px solid #ddd;font-size: 35px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative; margin-left:5%; font_family:fantasy;}
    .info .desc {position: relative; text-align:center; margin: 13px 5px 0 90px;height: 100px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;  font-size: 20px;}
    .desc .jibun {color: #888;margin-top: -2px; font-size: 20px;}
    .desc .score {color: #888; margin-top:-2px; font-size:25px;}
    #go_to_review {border-bottom: 1px solid #bcbcbc; width:280px; margin-left:103px; font-weight:bold;}
    #review_title {border-bottom: 1px solid #bcbcbc; width:65px; margin-left:5px; font-weight:bold; font-size:30px}
    .info .img {position: absolute;top: 6px;left: 5px;width: 140px;height: 140px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 25%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB; font-size: 20px;}
</style>

</head>
<body>
	<div id="video">
		<div class="preloader">
			<div class="preloader-bounce">
				<span></span> <span></span> <span></span>
			</div>
		</div>

		<header id="header">
			<div class="container-fluid">
				<div class="navbar">
					<br> <a href="#slide01" id="logo"
						title="Elegance by TemplateMo">
						<span id="eat_font">오늘 </span><span>뭐 </span><span
						id="eat_font">eat지?</span> </a>
					<div class="navigation-row">
						<nav id="navigation">
							<button type="button" class="navbar-toggle">
								<i class="fa fa-bars"></i>
							</button>
							<div class="nav-box navbar-collapse">
								<ul class="navigation-menu nav navbar-nav navbars" id="nav">
									<li data-menuanchor="slide01" class="active"><a
										href="#slide01">Home</a></li>
									<li data-menuanchor="slide02"><a href="#slide02">Setting</a></li>
									<li data-menuanchor="slide03"><a href="#slide03">Roullets</a></li>
									<li data-menuanchor="slide04"><a href="#slide04">Maps</a></li>

									<c:choose>
										<c:when test="${loginInfo == null }">
											<li data-menuanchor="slide05"><a href="#slide05">Login</a></li>
											<li data-menuanchor="slide06"><a href="#slide06">Join</a></li>
										</c:when>
										<c:otherwise>
											<li data-menuanchor="slide05"><a href="logout.mc">Logout</a></li>
											<li data-menuanchor="slide06"><a href="#slide06">Mypage</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>

		<video autoplay muted loop id="myVideo">
			<source src="" type="video/mp4">
		</video>

		<div id="fullpage" class="fullpage-default">
			<div class="section animated-row" data-section="slide01">
				<div class="section-inner">
					<div class="welcome-box">
						<span class="welcome-first animate" data-animate="fadeInUp">식사
							시간만 되면 고민하셨죠?</span>
						<h1 class="welcome-title animate" data-animate="fadeInUp">‘오늘
							뭐 먹지?’</h1>
						<p class="animate" data-animate="fadeInUp">이제, 저희가 결정해드립니다.</p>
						<div class="next-section span" data-animate="fadeInUp">
							<c:choose>
								<c:when test="${loginInfo == null }">
									<a href="#slide05">Login</a>
									<a href="#slide06">Join</a>
								</c:when>
								<c:otherwise>
									<a href="logout.mc">Logout</a>
									<a href="#slide06">Mypage</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>


			<div class="section animated-row" data-section="slide02">
				<div class="section-inner">
					<div class="about-section">
						<div class="row justify-content-center">
							<div class="col-lg-8 wide-col-laptop">
								<div class="row">
									<div class="col-md-6">
										<div class="about-contentbox">
											<div class="animate" data-animate="fadeInUp">
												<span>메뉴를</span>
												<h1>선택하세요</h1>
												<p></p>
											</div>
											<div class="facts-list owl-carousel">
												<div class="item animate go_to_roullet"
													 data-animate="fadeInUp">
													<div class="counter-box">
														<i class="fa fa-desktop counter-icon" aria-hidden="true"></i><span
															class="count-number">룰렛 돌리기</span>
													</div>
												</div>

												<div class="item animate p_add" data-animate="fadeInUp">
													<div class="counter-box">
														<i class="fa fa-desktop counter-icon" aria-hidden="true"></i><span
															class="count-number">추가</span>
													</div>
												</div>
												<div class="item animate p_delete" data-animate="fadeInUp">
													<div class="counter-box">
														<i class="fa fa-desktop counter-icon" aria-hidden="true"></i><span
															class="count-number">삭제</span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="col-md-6 auto_menu">
										<div>
											<div class="portfolio-item">
												
												<div class="thumb">
													<img id="menu_select_default_img" src="images/img01.jpg"
														alt="">
												</div>
												<div>
													<table id="menu_add_table" style="margin:auto; text-align:center; font-size:20pt;">
														<tbody >

														</tbody>

													</table>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="section animated-row" data-section="slide03">
				<div class="section-inner">
					<div class="about-section">
						<div class="row justify-content-center">
							<div class="col-lg-8 wide-col-laptop">
								<div class="row">
									<div class="col-md-6">
										<div class="about-contentbox">
											<div class="animate" data-animate="fadeInUp">

												<div align="center">
													<table cellpadding="20" cellspacing="0" border="0"
														display:table-cell>
														<tr>
															<td>
																<div class="power_controls">
																	<br /> <br />
																	<table class="power" cellpadding="10" cellspacing="0">
																		<tr>
																			<th align="center"></th>
																		</tr>
																		<tr>
																			<td width="78" align="center" id="pw3"
																				onClick="powerSelected(3);"></td>
																		</tr>
																		<tr>
																			<td align="center" id="pw2"
																				onClick="powerSelected(2);"></td>
																		</tr>
																		<tr>
																			<td align="center" id="pw1"
																				onClick="powerSelected(1);"></td>
																		</tr>
																	</table>
																	<br /> <img id="spin_button"
																		src="view/images/button1.jpg" alt="Spin" /> <br /> <br />
																	&nbsp;&nbsp;<a href="#" text-align="center"
																		id="resetWheel"returnfalse;">&nbsp;
																		Reset
																	</a>
																</div>
															</td>
															<td id="wheel_back" width="438" height="582"
																class="the_wheel" align="center" valign="center">▼
																<canvas id="canvas" width="434" height="434">
																</canvas>
															</td>
															<td width="438" height="582" class="the_wheel"
																valign="center" align="center">
																<canvas align="right" id="myCanvas" width="434"
																	height="434">
																</canvas>
																<h3 id="food_name" style="text-align: center;"></h3>
																<h1 id="start_check" style="text-align: center;">&nbsp;</h1>
															</td>
														</tr>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section animated-row" data-section="slide04">
				<div class="section-inner">
					<div class="row justify-content-center">
						<div class="col-md-7 wide-col-laptop">
							
							<div class="animate" data-animate="fadeInUp">
								<div class="map_wrap">
									<div id="map" style="width:100%;height:100%;"></div>
									<div id="menu_wrap" class="bg_white">
										<ul id="placesList"></ul>
										<div id="pagination"></div>
									</div>
								</div>
								
								<div class="input-field">
									
									<input type="text" class="form-control" name="map_address"
										id="map_address" required placeholder="지역을 입력해주세요. 예) 강남역">
									
								</div>
								
								<button class="btn" id="btn_map_search" type="submit">검색하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- 로그인 페이지 -->
			<div class="section animated-row" data-section="slide05">
				<c:choose>
					<c:when test="${loginInfo == null }">
						<jsp:include page="login.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="loginok.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</div>
			
			<!-- 회원가입 페이지  -->
			<div class="section animated-row" data-section="slide06">
				<c:choose>
					<c:when test="${loginInfo== null }">
						<jsp:include page="join.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="user_update.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- 비밀번호 찾기 페이지 -->
			<c:choose>
				<c:when test="${loginInfo== null }">
					<div class="section animated-row" data-section="slide07">
						<jsp:include page="find_pwd.jsp"></jsp:include>
					</div>
				</c:when>
			</c:choose>

		</div>
			<script>
				var user_id = '${loginInfo.id}'; //따옴표 씌우기
				function delete1() {
					$('html, body').animate({
						scrollTop : target.offset().top - top_space
					}, 1500, 'easeInOutExpo');
				};
				
				var numSegments = 0;
				var FoodList;
				var flag = 0;
				var theWheel;
			
				function makeRoullet() {
					//Create new wheel object specifying the parameters at creation time.
					theWheel = new Winwheel({
						'numSegments' : numSegments, // Specify number of segments.
						'outerRadius' : 212, // Set outer radius so wheel fits inside the background.
						'textFontSize' : 28, // Set font size as desired.
						'segments' : FoodList// Define segments including colour and text.
						,
						'animation' : // Specify the animation to use.
						{
							'type' : 'spinToStop',
							'duration' : 15,
							'spins' : 8,
							'callbackFinished' : alertPrize,
							'callbackSound' : playSound, // Function to call when the tick sound is to be triggered.
							'soundTrigger' : 'pin' // Specify pins are to trigger the sound, the other option is 'segment'.
						},
						'pins' : {
							'number' : 16
						// Number of pins. They space evenly around the wheel.
						}
					});

					location.href = "#slide03";
				}

				$('.go_to_roullet').click(function() {
					if (user_id != null) {
						var foodJson;
						$.ajax({
							url : "add_pre_roullet.mc",
							type : "POST",
							data : {
								"id" : user_id
							},
							success : function(data) {

								var index = 0;
								FoodList=new Array();
								numSegments=0;
								foodJson = JSON.parse(data);
								$.each(foodJson, function() {

									if (numSegments % 2 == 0) {
										numSegments++;

										FoodList.push({
											'fillStyle' : '#EAEAEA',
											'text' : this.name
										});

									} else {
										numSegments++;
										FoodList.push({
											'fillStyle' : '#F6F6F6',
											'text' : this.name
										});

									}
									makeRoullet();
									draw('img01');

								})

							}
						});

					} else {
						makeRoullet();
						draw('img01');
					}

				});
				
				
				var score_count;
				function get_score(place_name,place_address){
					var score_info;
					$.ajax({
						url : "getScore.mc",
						type : "POST",
						data : {
							"place_name" : place_name, "place_address":place_address
						},
						async : false,
						success : function(data) {
							score_count=data[0].count;
							score_info=(data[0].score/score_count).toFixed(1);
						}
					});
					if(score_info===undefined){
						score_info="아직 평점이 없는 식당입니다!";
						score_count=undefined;
					}else{
						score_info=score_info+"/5.0";
					}
					return score_info;
				};
				
				// overlay 설정
				var overlay=null;
				var places_place_name;
				var places_road_address;
				var places_address_name;
				var places_phone=document;
				$(document).ready(function(){
				      $(document).on("click","#placesList > .item",function(event){
				    	  var idx=$(this).index();
				    	   places_place_name= document.getElementById("places_place_name"+idx).innerText;
				    	   places_road_address=document.getElementById("places_road_address"+idx).textContent;
				    	   places_address_name=document.getElementById("places_address_name"+idx).textContent;
				    	   places_phone=document.getElementById("places_phone"+idx).textContent;
				    	  
				    	  // 주소-좌표 변환 객체를 생성합니다
				    	  var geocoder = new kakao.maps.services.Geocoder();
						  // 주소로 좌표를 검색합니다
						  geocoder.addressSearch(places_address_name, function(result, status) {
							  // 정상적으로 검색이 완료됐으면 
							  if (status === kakao.maps.services.Status.OK) {
							        var foodName=document.getElementById('food_name').innerHTML;
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							        var content = '<div class="wrap">' + 
							                   '    <div class="info">' + 
							                   '        <div class="title" id="place_title">' + 
							                               places_place_name + 
							                   '            <div class="close" id="closeOverlay" title="닫기"></div>' + 
							                   '        </div>' + 
							                   '        <div class="body">' + 
							                   '            <div class="img">' +
							                   '                <img src="view/images/food/' + foodName + '.PNG"  style="max-width: 100%; height: auto;">' +
							                   '           </div>' + 
							                   '            <div class="desc">' + 
							                   '                <div class="ellipsis" id="place_road_address">'+places_road_address+'</div>' + 
							                   '                <div class="jibun ellipsis" id="place_address">'+places_address_name+'</div>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '  				<div class="score">평점</div>' +
							                   '  				<div class="score" id="get_score">'+get_score(places_place_name,places_road_address)+'</div>' +
							                   '  				<span class="star_rating"><a href="#" >★</a><a href="#" >★</a><a href="#" >★</a><a href="#">★</a><a href="#">★</a></span><div id="star_click" style="font-size: 19px;">평점하기</div>' +
							                   '				<br>'+ 
							                   '  				<div class="score" id="go_to_review">리뷰를 확인해 보세요!</div>' + 	
							                   '        	</div>' + 
							                   '        </div>' + 
							                   '    </div>' +  
							                   '</div>';
									
							                   
									if(overlay!=null){
									   overlay.setMap(null);   
									}

							       // 마커 위에 커스텀오버레이를 표시합니다
							       // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							       overlay = new kakao.maps.CustomOverlay({
							           content: content,
							           map: map,
							           position: coords  
							       });
							       
							       
							       coords = new kakao.maps.LatLng((parseFloat(result[0].y)+0.004).toString(), result[0].x);
							       
							       map.setLevel(4);
							       map.setCenter(coords);
							       
							       // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							       overlay.setMap(map);
									$(document).on("click","#closeOverlay",function(event){
										overlay.setMap(null);  
									});
									
							               } 
							           });  
							          });
							      });
				
				function get_Content(){
					var plc=document.getElementById("place_road_address").innerText;
					var contents;
					$.ajax({
						url:"select_review.mc",
						type:"POST",
						data:{"place_address":plc},
						async:false,
						success:function(data){
							alert(data);
							contents=data;
						}
					});
					return contents;
				}
				// 리뷰 보기
				$(document).ready(function(){
					$(document).on("click","#go_to_review",function(event){
				    	  var places_place_name= document.getElementById("place_title").innerText;
				    	  var places_address_name=document.getElementById("place_address").textContent;
				    	  var contents=get_Content();
				    	  // 주소-좌표 변환 객체를 생성합니다
				    	  var geocoder = new kakao.maps.services.Geocoder();
						  // 주소로 좌표를 검색합니다
						  geocoder.addressSearch(places_address_name, function(result, status) {
							  // 정상적으로 검색이 완료됐으면 
							  if (status === kakao.maps.services.Status.OK) {
							        var foodName=document.getElementById('food_name').innerHTML;
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							        var content = '<div class="wrap">' + 
							                   '    <div class="info">' + 
							                   '        <div class="title">' + 
							                               places_place_name + 
							                   '            <div class="close" id="closeOverlay" title="닫기"></div>' + 
							                   '        </div>' + 
							                   '        <div class="body">' + 
							                   '            	<div>' +
							                   '                <span class="ellipsis" id="review_title" style="text-align:left; font-size: 30px;">Review</span><span><a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query='+places_place_name+'"target="_blank"  style="font-size: 30px;" class="link">&nbsp➡네이버 검색!</a></span>' + 
							                   ' 				<br>' +		
							                   ' 				<br>' +		
							                   '                <div class="jibun ellipsis" id="review_content" style="text-align:left; font-size: 15px;">'+contents[0].content+ '</div>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '                <br>' + 
							                   '  				<div></div>' +
							                   '  				<input type="text" id="review_content" style="width:300px; line-height=200px;" required minlength="2" maxlength="40" size="15"><span id="load_review" style="font-size:25px;"> 클릭</span>' +
							                   '                <br>' + 
							                   '                <br>' +  	
							                   '        	</div>' + 
							                   '        </div>' + 
							                   '    </div>' +  
							                   '</div>';
									
							                   
									if(overlay!=null){
									   overlay.setMap(null);   
									}

							       // 마커 위에 커스텀오버레이를 표시합니다
							       // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
							       overlay = new kakao.maps.CustomOverlay({
							           content: content,
							           map: map,
							           position: coords  
							       });
							       
							       
							       coords = new kakao.maps.LatLng((parseFloat(result[0].y)+0.004).toString(), result[0].x);
							       
							       map.setLevel(4);
							       map.setCenter(coords);
							       
							       // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
							       overlay.setMap(map);
									$(document).on("click","#closeOverlay",function(event){
										overlay.setMap(null);  
									});
									
							               } 
							           });  
						 
					});
				});
				
				
				
				// 평점하기
				var star_idx;
				$(document).ready(function(){
					$(document).on("click",".star_rating a",function(event){
					     $(this).parent().children("a").removeClass("on");
					     $(this).addClass("on").prevAll("a").addClass("on");
					     star_idx=$(this).index();
					     return false;
					});
				});
				
				// 평점올리기
				$(document).ready(function(){
					$(document).on("click","#star_click",function(event){
						var form={place_name:places_place_name
								,place_address: places_road_address
								,score: star_idx+1
								,count:1}
						if(score_count!==undefined){
							$.ajax({
								url : "scoreUpdateImpl.mc",
								type : "POST",
								data : form,
								async : false,
								success : function(data) {
									alertify.alert("평점등록완료!");
								}
							});
						}else{
							$.ajax({
								url : "scoreInsertImpl.mc",
								type : "POST",
								data : form,
								async : false,
								success : function(data) {
									alertify.alert("평점등록완료!");
								}
							});
						}
						document.getElementById('get_score').innerHTML =get_score(places_place_name,places_road_address);
						
					});
				});
				
				
				$(document).ready(function(){
					$(document).on("click","#load_review",function(){
						var date=new Date();
						var d=(moment(date).format('YYYY MM DD HH:mm:ss')).toString();
						var content=document.getElementById('review_content').value;
						// int 타입 null 설정 안된다(?)
						var form={
							review_id:0,
							time:d,
							content:content,
							user_id:user_id,
							is_deleted:"FALSE",
							place_name:places_place_name,
							place_address: places_road_address
						};
						$.ajax({
							url: "upload_review.mc",
							type: "POST",
							data: form,
							async:false,
							success:function(data){
								alert("리뷰 전송 완료");
							}
						});
					});
				});
				
				
				
				// 키워드로 장소 검색
				$("#btn_map_search").click(function(){
					if(overlay!=null){
						   overlay.setMap(null);   
						}
					searchPlaces();
				});
				

				$("#spin_button").click(function() {
					startSpin();
				});

				$("#resetWheel").click(function() {
					draw('img01');
					resetWheel();
				});

				$("#start_check").click(function() {
					location.href = "#slide04";
				});

				// -----------------------------------------------------------------
				// This function is called when the segment under the prize pointer changes
				// we can play a small tick sound here like you would expect on real prizewheels.
				// -----------------------------------------------------------------
				let audio = new Audio('tick.mp3'); // Create audio object and load tick.mp3 file.

				function playSound() {
					// Stop and rewind the sound if it already happens to be playing.
					audio.pause();
					audio.currentTime = 0;

					// Play the sound.
					audio.play();
				}

				// -------------------------------------------------------
				// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
				// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
				// -------------------------------------------------------
				function alertPrize(indicatedSegment) {
					alertify.alert("당첨! " + indicatedSegment.text);
					roullet_result = indicatedSegment;

					draw(indicatedSegment.text);

					document.getElementById('food_name').innerHTML = indicatedSegment.text;
					document.getElementById('start_check').innerHTML = '검색하기';
				}

				// =======================================================================================================================
				// Code below for the power controls etc which is entirely optional. You can spin the wheel simply by
				// calling theWheel.startAnimation();
				// =======================================================================================================================
				let wheelPower = 0;
				let wheelSpinning = false;

				// -------------------------------------------------------
				// Function to handle the onClick on the power buttons.
				// -------------------------------------------------------
				function powerSelected(powerLevel) {
					// Ensure that power can't be changed while wheel is spinning.
					if (wheelSpinning == false) {
						// Reset all to grey incase this is not the first time the user has selected the power.
						document.getElementById('pw1').className = "";
						document.getElementById('pw2').className = "";
						document.getElementById('pw3').className = "";

						// Now light up all cells below-and-including the one selected by changing the class.
						if (powerLevel >= 1) {
							document.getElementById('pw1').className = "pw1";
						}

						if (powerLevel >= 2) {
							document.getElementById('pw2').className = "pw2";
						}

						if (powerLevel >= 3) {
							document.getElementById('pw3').className = "pw3";
						}

						// Set wheelPower var used when spin button is clicked.
						wheelPower = powerLevel;

						// Light up the spin button by changing it's source image and adding a clickable class to it.
						document.getElementById('spin_button').src = "view/images/button1.jpg";
						document.getElementById('spin_button').className = "clickable";
					}
				}

				// -------------------------------------------------------
				// Click handler for spin button.
				// -------------------------------------------------------
				function startSpin() {
					// Ensure that spinning can't be clicked again while already running.
					if (wheelSpinning == false) {
						// Based on the power level selected adjust the number of spins for the wheel, the more times is has
						// to rotate with the duration of the animation the quicker the wheel spins.
						if (wheelPower == 1) {
							theWheel.animation.spins = 3;
						} else if (wheelPower == 2) {
							theWheel.animation.spins = 8;
						} else if (wheelPower == 3) {
							theWheel.animation.spins = 15;
						}

						// Disable the spin button so can't click again while wheel is spinning.
						document.getElementById('spin_button').src = "view/images/button1.jpg";
						document.getElementById('spin_button').className = "";

						// Begin the spin animation by calling startAnimation on the wheel object.
						theWheel.startAnimation();

						// Set to true so that power can't be changed and spin button re-enabled during
						// the current animation. The user will have to reset before spinning again.
						wheelSpinning = true;
					}
				}

				// -------------------------------------------------------
				// Function for reset button.
				// -------------------------------------------------------
				function resetWheel() {
					theWheel.stopAnimation(false); // Stop the animation, false as param so does not call callback function.
					theWheel.rotationAngle = 0; // Re-set the wheel angle to 0 degrees.
					theWheel.draw(); // Call draw to render changes to the wheel.

					document.getElementById('pw1').className = ""; // Remove all colours from the power level indicators.
					document.getElementById('pw2').className = "";
					document.getElementById('pw3').className = "";
					document.getElementById('food_name').innerHTML="";
					document.getElementById('start_check').innerHTML="";

					wheelSpinning = false; // Reset to false to power buttons and spin can be clicked again.
				}

				// Create new wheel object specifying the parameters at creation time.
				function draw(FoodName) {
					//이미지 객체 생성
					var imgClo = new Image();
					//페이지 로드후 이미지가 로드 되었을 때 이미지 출력
					imgClo.addEventListener('load', function() {
						//로드된 이미지를 캔버스에 출력
						var ctx = document.getElementById('myCanvas')
								.getContext("2d");
						//canvas.drawImage() 함수를 사용하여 이미지 출력
						//drawImage ( image sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
						ctx.drawImage(imgClo, 20, 30, 400, 400);
					}, false);
					//이미지 경로 설정
					imgClo.src = "view/images/food/" + FoodName + ".PNG";
				}
			</script>


			<script type="text/javascript" src="view/js/menu.js"></script>
			<script src="view/js/kakaoMap_request.js"></script>
			<script src="view/js/kakaoMap_overlay.js"></script>
			<script src="view/js/kakaoMap_geolocation.js"></script>
			<script src="view/js/jquery.js"></script>
			<script src="view/js/bootstrap.min.js"></script>
			<script src="view/js/fullpage.min.js"></script>
			<script src="view/js/scrolloverflow.js"></script>
			<script src="view/js/owl.carousel.min.js"></script>
			<script src="view/js/jquery.inview.min.js"></script>
			<script src="view/js/form.js"></script>
			<script src="view/js/custom.js"></script>
			<script src="view/js/Winwheel.js"></script>
</body>
</html>