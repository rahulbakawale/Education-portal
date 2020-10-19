
function like_user(id){
	//debugger
	$.ajax({
		url: "/jobs/"+id+"/likes",
		method: 'post',
		dataType: 'script',
		data: {}
	})
}

