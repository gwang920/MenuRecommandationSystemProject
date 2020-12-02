function makeRowPre(food_id, food_name, index,type) {
	alertify.alert("메뉴데이터 메뉴를 클릭해주세요");
	var rowSentence = "<tr id=" + index + type+"><td>" + food_name + "</td></tr>";
	$('#menu_add_table > tbody').append(rowSentence);	
	var tagOrder = "#" + index+type;
	$(document).on("click", tagOrder, function (event) {
		var tr = $(this);
		if (user_id != null) {
			$.ajax({
				url: "AddPre.mc",
				type: "POST",
				data: {
					"id": user_id, "name": food_id
				},
				success: function (data) {
					if (data == "success") {
						$('#menu_add_table > tbody > ' + tagOrder).remove();
					}
					else alertify.alert("이미 존재하는 메뉴입니다.");
				},
				error: function () {
					alertify.alert("로그인이 필요합니다---");
				}
			});
		}
		else {
			
			$('#menu_add_table > tbody > ' + tagOrder).remove();
			FoodList.push({ 'fillStyle': '#EAEAEA', 'text': food_name });
			numSegments++;
		}
	});
}

function delRowPre(food_id, food_name, index,type) {
	alertify.alert("Ignore테이블을 가져옵니다.");
	var rowSentence = "<tr id=" + index + type+"><td>" +  food_name + "</td></tr>";
	$('#menu_add_table > tbody').append(rowSentence);
	var tagOrder = "#" + index+type;
	$(document).on("click", tagOrder, function (event) {
		var tr = $(this);
		if (user_id != null) {
			$.ajax({
				url: "delPre.mc",
				type: "POST",
				data: {
					"id": user_id, "name": food_id
				},
				success: function (data) {
					if (data == "success") {
						alert("successfully delete food in Ignore");
						$('#menu_add_table > tbody > ' + tagOrder).remove();
					}
					else alertify.alert("로그인이 필요합니다1");
				},
				error: function () {
					alertify.alert("로그인이 필요합니다2");
				}
			});
		}
		else {
			$('#menu_add_table > tbody > ' + tagOrder).remove();
		}
	});
}


function makeRowIgnore(food_id, food_name, index) {
	alertify.alert("Ignore테이블을 가져옵니다.");
	var rowSentence = "<tr id=" + index + "><td>" +  food_name + "</td></tr>";
	$('#menu_add_table > tbody').append(rowSentence);
	var tagOrder = "#" + index;
	$(document).on("click", tagOrder, function (event) {
		var tr = $(this);
		if (user_id != null) {
			$.ajax({
				url: "AddPre.mc",
				type: "POST",
				data: {
					"id": user_id, "name": food_id
				},
				success: function (data) {
					if (data == "success") {
						alert("successfully delete food in Ignore");
						$('#menu_add_table > tbody > ' + tagOrder).append();
					}
					else alertify.alert("로그인이 필요합니다1");
				},
				error: function () {

					alertify.alert("로그인이 필요합니다2");
				}
			});
		}
		else {
			$('#menu_add_table > tbody > ' + tagOrder).remove();
		}
	});
}

var foodMenulist;

// food 리스트를 가져온다. (pre , ig에 없는 메뉴만)
$('.p_add').click(function () {
	alertify.alert("추가할 메뉴를 클릭해주세요");
	$('#menu_add_table > tbody').empty();
	$.ajax({
		url: "menu_add_table_add_list.mc",
		type: "POST",
		data: {
			"id": user_id
		},
		success: function (data) {
			var index = 0;
			alert(data);
			foodMenulist = JSON.parse(data)
			$.each(foodMenulist, function () {
				makeRowPre(this.id, this.name, index,"plus");
				index = index + 1;
			})
			$('#menu_select_default_img').remove();
			$('.portfolio-item .thumb-inner').css('visibility', 'visible');
		},
		error: function () {
			alert("fail load list data");
		}
	});
});

// pre 데이터를 가져온다.
$('.p_delete').click(function () {
	alertify.alert("삭제할 메뉴를 클릭해주세요");
	var foodlist;
	$('#menu_add_table > tbody').empty();
	$.ajax({
		url: "add_pre_roullet.mc",
		type: "POST",
		data: {
			"id": user_id
		},
		success: function (data) {
			var index = 0;
			foodlist = JSON.parse(data);
			$.each(foodlist, function () {
				delRowPre(this.id, this.name, index,"del");
				index = index + 1;
			})
			$('#menu_select_default_img').remove();
			$('.portfolio-item .thumb-inner').css('visibility', 'visible');
		}
	});
});