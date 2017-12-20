<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../config/config.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>系统公告</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${layui}/css/layui.css" media="all" />
</head>
<body>
	<form class="layui-form">
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">系统公告</label>
			<div class="layui-input-block">
			<input type="hidden" id="id" value="${notice.id }">
				<textarea id="content" cols="5" rows="20" class="layui-textarea">${notice.content }</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

<script type="text/javascript" src="${layui}/layui.js"></script>
<script type="text/javascript">
	layui.use('form', function(){
	  var form = layui.form();
	  var $ = layui.jquery;
	  //监听提交
	  form.on('submit(formDemo)', function(data){
	    //layer.msg(JSON.stringify(data.field));
	    var content = $("#content").val();
	    var id = $("#id").val();
	    $.ajax({
	    	url:'notice.do?changeNotice',
	    	type:'POST',
	    	data:{"id":id,"content":content},
	    	dataType:'json',
	    	success:function(d){
	    		if(d.code==0){
	    			layer.msg(d.msg,{icon:6});
	    		}else{
	    			layer.msg(d.msg,{icon:5});
	    		}
	    	},
	    	error:function(){
	    		layer.msg("提交失败！");
	    	}
	    })
	    return false;
	  });
  });
</script>
</body>
</html>
