/*$(function() {

	$("#userList").click(function() {
		fetchList("user/list");
	});

	$("#addressList").click(function() {
		fetchList("address/list");
	});

});

// ajax call function to fetch addForm
function addForm(type) {
	$.ajax({
		type : "GET",
		url : type + "/form",
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}

// function ajax call to fetch the list of data
function fetchList(type) {
	$.ajax({
		type : "GET",
		url : type,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}*/

// ajax call function for edit
function editForm(type, id) {
	$.ajax({
		type : "GET",
		url : type + "/" + "edit/" + id,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}

// function ajax call to perform delete
function deleteForm(type, id) {
	$.ajax({
		type : "GET",
		url : type + "/" + "delete/" + id,
		success : function(data) {
			$(".inner-jsp").html(data);
		}
	});
}
