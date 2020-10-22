
function like_user(id){
	//debugger
	$.ajax({
		url: "/jobs/"+id+"/likes",
		method: 'post',
		dataType: 'script',
		data: {}
	})
}

function unlike_user(job_id, id){
	$.ajax({
		url: "/jobs/"+id+"/likes/:id",
		method: 'delete',
		dataType: 'script',
		data: {}	
	})
}

