layui.config({
	base : "js/"
}).use(['form','layer','jquery','laypage'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

	//加载页面数据
	var newsData = '';
	getData(1);
	
	//查询
	$(".search_btn").click(function(){
		var name = $(".search_input").val();
		if( name!= ''){
			var index = layer.msg('查询中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
            	$.ajax({
					url : "book.do?search",
					type : "post",
					data : {name:name},
					dataType : "json",
					success : function(d){
						var booksData = d.data;
						newsList(booksData);
					}
				});
                layer.close(index);
            },2000);
		}else{
			layer.msg("请输入需要查询的内容");
		}
	})

	//添加文章
	//改变窗口大小时，重置弹窗的高度，防止超出可视区域（如F12调出debug的操作）
	$(window).one("resize",function(){
		$(".newsAdd_btn").click(function(){
			var index = layui.layer.open({
				title : "添加文章",
				type : 2,
				content : "book.do?toBookAdd",
				success : function(layero, index){
					setTimeout(function(){
						layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
							tips: 3
						});
					},500)
				}
			})			
			layui.layer.full(index);
		})
	}).resize();

	//推荐文章
	$(".recommend").click(function(){
		var $checkbox = $(".news_list").find('tbody input[type="checkbox"]:not([name="show"])');
		if($checkbox.is(":checked")){
			var index = layer.msg('推荐中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
                layer.close(index);
				layer.msg("推荐成功");
            },2000);
		}else{
			layer.msg("请选择需要推荐的文章");
		}
	})

	//审核文章
	$(".audit_btn").click(function(){
		var $checkbox = $('.news_list tbody input[type="checkbox"][name="checked"]');
		var $checked = $('.news_list tbody input[type="checkbox"][name="checked"]:checked');
		if($checkbox.is(":checked")){
			var index = layer.msg('审核中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
            	for(var j=0;j<$checked.length;j++){
            		for(var i=0;i<newsData.length;i++){
						if(newsData[i].newsId == $checked.eq(j).parents("tr").find(".news_del").attr("data-id")){
							//修改列表中的文字
							$checked.eq(j).parents("tr").find("td:eq(3)").text("审核通过").removeAttr("style");
							//将选中状态删除
							$checked.eq(j).parents("tr").find('input[type="checkbox"][name="checked"]').prop("checked",false);
							form.render();
						}
					}
            	}
                layer.close(index);
				layer.msg("审核成功");
            },2000);
		}else{
			layer.msg("请选择需要审核的文章");
		}
	})

	//批量删除
	$(".batchDel").click(function(){
		var $checkbox = $('.news_list tbody input[type="checkbox"][name="checked"]');
		var $checked = $('.news_list tbody input[type="checkbox"][name="checked"]:checked');
		if($checkbox.is(":checked")){
			layer.confirm('确定删除选中的信息？',{icon:3, title:'提示信息'},function(index){
				var index = layer.msg('删除中，请稍候',{icon: 16,time:false,shade:0.8});
	            setTimeout(function(){
	            	//删除数据
	            	for(var j=0;j<$checked.length;j++){
	            		for(var i=0;i<newsData.length;i++){
							if(newsData[i].newsId == $checked.eq(j).parents("tr").find(".news_del").attr("data-id")){
								newsData.splice(i,1);
								newsList(newsData);
							}
						}
	            	}
	            	$('.news_list thead input[type="checkbox"]').prop("checked",false);
	            	form.render();
	                layer.close(index);
					layer.msg("删除成功");
	            },2000);
	        })
		}else{
			layer.msg("请选择需要删除的文章");
		}
	})

	//全选
	form.on('checkbox(allChoose)', function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		child.each(function(index, item){
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});

	//通过判断文章是否全部选中来确定全选按钮是否选中
	form.on("checkbox(choose)",function(data){
		var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"])');
		var childChecked = $(data.elem).parents('table').find('tbody input[type="checkbox"]:not([name="show"]):checked')
		if(childChecked.length == child.length){
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = true;
		}else{
			$(data.elem).parents('table').find('thead input#allChoose').get(0).checked = false;
		}
		form.render('checkbox');
	})

	//是否展示
	form.on('switch(isShow)', function(data){
		var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            layer.close(index);
			layer.msg("展示状态修改成功！");
        },2000);
	})
 
	//操作
	$("body").on("click",".news_edit",function(){  //编辑
		layer.alert('您点击了文章编辑按钮，由于是纯静态页面，所以暂时不存在编辑内容，后期会添加，敬请谅解。。。',{icon:6, title:'文章编辑'});
	})

	$("body").on("click",".news_collect",function(){  //收藏.
		if($(this).text().indexOf("已收藏") > 0){
			layer.msg("取消收藏成功！");
			$(this).html("<i class='layui-icon'>&#xe600;</i> 收藏");
		}else{
			layer.msg("收藏成功！");
			$(this).html("<i class='iconfont icon-star'></i> 已收藏");
		}
	})

	$("body").on("click",".news_del",function(){  //删除
		var _this = $(this);
		layer.confirm('确定删除此信息？',{icon:3, title:'提示信息'},function(index){
			//_this.parents("tr").remove();
			for(var i=0;i<newsData.length;i++){
				if(newsData[i].newsId == _this.attr("data-id")){
					newsData.splice(i,1);
					newsList(newsData);
				}
			}
			layer.close(index);
		});
	})
	
	//得到数据，page 第几页，nums每页显示几个
	function getData(page){
		$.ajax({
			url : "book.do?list",
			type : "get",
			data :{page:page},
			dataType : "json",
			success : function(data){
				newsList(data);
			}
		});
	}
	
	//初始化表格
	function newsList(data){
		//分页
		var pages = data.count;
		var nums = 10; //每页出现的数据量
		laypage({
			cont : "bookPage",
		    skip: true,
			//pages : Math.ceil(currDate.length/nums),
			pages : 10,
			jump : function(obj){
				var content = renderDate(data.data);
				$("#content").html(content);
				$('.news_list thead input[type="checkbox"]').prop("checked",false);
		    	form.render();
			}
		});
	}
	
	//渲染数据,拼接数据
	function renderDate(currData){
		var dataHtml = '';
		if(currData.length != 0){
			for(var i=0;i<currData.length;i++){
				dataHtml += '<tr>'
		    	+'<td><input type="checkbox" name="checked" lay-skin="primary" lay-filter="choose"></td>'
		    	+'<td align="left">'+currData[i].id+'</td>'
		    	+'<td>'+currData[i].name+'</td>'
		    	+'<td>'+currData[i].author+'</td>'
		    	+'<td>'+currData[i].bookDesc+'</td>'
				+'<td>'+currData[i].tips+'</td>';
				if(currData[i].lookPer == "1"){
		    		dataHtml += '<td>'+'开放浏览'+'</td>';
		    	}else if(currData[i].lookPer == "2"){
		    		dataHtml += '<td style="color:#f00">'+'会员浏览'+'</td>';
		    	}
				if(currData[i].state == "1"){
		    		dataHtml += '<td style="color:green">'+'可借阅'+'</td>';
		    	}else if(currData[i].state == "2"){
		    		dataHtml += '<td style="color:blue">'+'已被借阅'+'</td>';
		    	}else{
		    		dataHtml += '<td style="color:red">'+'已下架'+'</td>';
		    	}
		    	//dataHtml+='<td><input type="checkbox" name="show" lay-skin="switch" lay-text="是|否" lay-filter="isShow"'+currData[i].isShow+'></td>'
		    	dataHtml+='<td>'+currData[i].createTime+'</td>'
		    	+'<td>'+currData[i].updateTime+'</td>'
		    	+'<td>'
				+  '<a class="layui-btn layui-btn-mini news_edit data-id="'+currData[i].id+'"><i class="iconfont icon-edit"></i>编辑</a>'
				+  '<a class="layui-btn layui-btn-normal layui-btn-mini news_collect data-id="'+currData[i].id+'"><i class="layui-icon">&#xe600;</i> 收藏</a>'
				+  '<a class="layui-btn layui-btn-danger layui-btn-mini news_del" data-id="'+currData[i].id+'"><i class="layui-icon">&#xe640;</i> 删除</a>'
		        +'</td>'
		    	+'</tr>';
			}
		}else{
			dataHtml = '<tr><td colspan="10">暂无数据</td></tr>';
		}
	    return dataHtml;
	}
})
