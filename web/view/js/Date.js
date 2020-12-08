function now_Date(){
					var date=new Date();
					var d=(moment(date).format('YYYY MM DD HH:mm:ss')).toString();
					
					d=d.replaceAll(" ","");
					d=d.replaceAll(":","");
					return d;
				}


function dateToSeconds(date){
	var year=date.substring(0,4)*31104000; // 1866240000
	var month=date.substring(4,6)*25920000; // 31104000
	var day=date.substring(6,8)*86400;  // 25920000
	var hour=date.substring(8,10)*3600; // 86400
	var minute=date.substring(10,12)*60;//3600 
	var second=date.substring(12,14)*1; //60
	return year+month+day+hour+minute+second;
}

function date_parse(now_date,pre_date){
	var total_second=dateToSeconds(now_date)-dateToSeconds(pre_date);
	
	if(total_second<60) total_second+="초 전";
	else if(total_second>=60 && total_second<3600){
	  total_second/=60;
	  total_second=Math.floor(total_second); 
	  total_second+="분 전";
	} 
	else if(total_second>=3600 && total_second<86400){
	  total_second/=3600;
	  total_second=Math.floor(total_second); 
	  total_second+="시간 전";
	}
	else if(total_second>=86400 && total_second<25920000){
	  total_second/=86400;
	  total_second=Math.floor(total_second); 
	  total_second+="일 전";  
	}
	else if(total_second>=25920000 && total_second<31104000){
	  total_second/=25920000;
	  total_second=Math.floor(total_second); 
	  total_second+="달 전";
	}
	else{
	  total_second/=31104000;
	  total_second=Math.floor(total_second);
	  total_second+="년 전";
	}
	return total_second;
}