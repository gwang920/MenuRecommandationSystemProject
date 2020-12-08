function get_Exp(address){
	var exp="";
	$.ajax({
		url:"select_Expression.mc",
		type:"POST",
		data:{"place_address":address},
		async:false,
		success:function(data){
			exp=data;
		}
	});
	return exp;
}
var motion_set={
		"like":" 👍",
		"sad":" 😭",
		"eyeheart":" 😍",
		"heart":" 💓",
		"smile":" 😀"
};

function make_exp_set(places_road_address,exp_id,user_id,flag,motion_cnt,motion){
	var temp="";
	if(flag===true){
		temp='<span style="font-size:20px;" class="exp_on" id="exp_id" name="'+exp_id+' '+motion+' '+user_id+' '+places_road_address+'">'+motion_set[motion]+"  "+'<span style="font-size:18px;">'+motion_cnt+'</span></span>';
	}else{
		temp='<span style="font-size:20px; " id="exp_id" name="'+exp_id+' '+motion+' '+user_id+' '+places_road_address+'">'+motion_set[motion]+"  "+'<span style="font-size:18px; ">'+motion_cnt+'</span></span>';
	}
	return temp;
}


function arrParse(arr){
	var str="";
	for(var i=3;i<arr.length;i++){
		str+=arr[i];
		if(i!==arr.length-1) str+=" ";
	}
	return str;
}

$(document).ready(function(){
	$(document).on("click","#exp_id",function(evnet){
		var getName=$(this).attr("name");
		var getClass=$(this).attr("class");
		var arr=getName.split(" ");
		var exp_id=arr[0];
		var motion=arr[1];
		var review_id=arr[2];
		var place_address=arrParse(arr);
		if(getClass==="exp_on"){
			$(this).removeClass('exp_on');
			$(this).children()[0].innerHTML=$(this).children().html()-1;
			
			$.ajax({
				url:"delete_Expression.mc",
				type:"POST",
				data:{
					"review_id":exp_id,
					"user_id":user_id,
					"place_address":place_address,
					"motion":motion,
				},
				async:false,
				success:function(data){
				}
			});
			
		}else{
			$(this).addClass("exp_on");
			$(this).children()[0].innerHTML=$(this).children().html()*1+1;
			$.ajax({
				url:"upload_expression.mc",
				type:"POST",
				data:{
					"review_id":exp_id,
					"user_id":user_id,
					"place_address":place_address,
					"motion":motion,
				},
				async:false,
				success:function(data){
				}
			});
		}
	});
})
