/*
 * $(function() { $("#sumitUserForm").submit(function(e) { e.preventDefault();
 * ajaxPost(); });
 * 
 * });
 * 
 * function ajaxPost() {
 * 
 * var formData = { userId : $("#userId").val(), userName :
 * $("#userName").val(), userPassword : $("#userPassword").val(), roleId :
 * $("#roleId").val() } $.ajax({ type : 'Post', contentType :
 * "application/json", url : 'user/add', data : JSON.stringify(formData),
 * dataType : 'json', success : function(result) { alert('done') } });
 *  }
 *  // sending data in json format so contentType is required function
 * saveRequestedData(type) { $.ajax({ url : type + '/' + 'add', type : "POST",
 * dataType : 'json', data : formToJson($("form")), contentType :
 * 'application/json', success : function(data) { alert(data.message); } }); }
 */

$(function() {
	$("#btnUploadImage").click(function(e) {
		e.preventDefault();
		console.log('Image upload.............')
		var formData = new FormData();
		var file = $('#upload-file-input')[0].files[0];

		formData.append("myFileKey", file);

		var id = $("#editId").val();
		console.log(id);

		$.ajax({
			url : '/user/upload',
			type : 'POST',
			data : formData,
			enctype : 'multipart/form-data',
			contentType : false,
			cache : false,
			processData : false,
			success : function(response) {
			},
			error : function() {
			}

		})

	});

});