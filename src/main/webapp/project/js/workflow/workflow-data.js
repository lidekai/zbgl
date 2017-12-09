/*
*接受后台传来的数据
 */
var getWorkflowData;
$.ajax({
		type : "POST",
		async:false,
		url:$("#getWorkflowList").val(),
		dataType : "json",
		success:function(data){
		    	getWorkflowData=data;
		},
		error:function(jqXHR){
		      alert("发生错误"+jqXHR.status);
		}
})

/*
*向后台传送的数据
 */
