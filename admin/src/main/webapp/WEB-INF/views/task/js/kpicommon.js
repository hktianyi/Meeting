var msg = msg;
var showtype=showtype;
$(function () {
    if(msg) App.bubble(200, msg);
    //审核人员查看
    if(showtype==1){
    	$("#tbbut").hide();
    	$("#shenhebut").show();
    	//状态：0已保存；1提交待审核中；2审核成功；3审核失败；
        if($("#status").val()==2){
        	App.bubble2(100,'已审核成功不能修改！',10000);
        	$("input").attr("disabled","disabled");
        	$("button").attr("disabled","disabled");
    	}else{
        	$("input").removeAttr("disabled");
        	$("button").removeAttr("disabled");
    	}
    }else{
    	$("#tbbut").show();
    	$("#shenhebut").hide();
    	//状态：0已保存；1提交待审核中；2审核成功；3审核失败；
        if($("#status").val()==1 || $("#status").val()==2){
        	if($("#status").val()==1) App.bubble2(100,'审核中不能修改！',10000);
        	else App.bubble2(100,'已审核成功不能修改！',10000);
        	$("input").attr("disabled","disabled");
        	$("button").attr("disabled","disabled");
    	}else{
        	$("input").removeAttr("disabled");
        	$("button").removeAttr("disabled");
    	}
    }
});

function save(type){
	$("#status").val(type);
    $("#form").submit();
}
function shenhe(type){
	$("#status").val(type);
	$("#form").attr("action",_path+"/kpi/shenhe");
    $("#form").submit();
}