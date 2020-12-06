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