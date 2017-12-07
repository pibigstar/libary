<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../config/config.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>图书列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${plugin }/layui/css/layui.css"  media="all">
</head>
<body> 
<div class="demoTable">
  搜索ID：
  <div class="layui-inline">
    <input class="layui-input" name="id" id="search_id" autocomplete="off">
  </div>
    搜索书名：
  <div class="layui-inline">
    <input class="layui-input" name="name" id="search_name" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
 
<table id="book_list"></table> 
               
          
<script src="${plugin }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#book_list'
    ,url: '${prc}/book/list.do'
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: 'ID',  sort: true, fixed: true}
      ,{field:'name', title: '书名'}
      ,{field:'author', title: '作者', sort: true}
      ,{field:'bookDesc', title: '描述',}
      ,{field:'state', title: '状态'}
      ,{field:'createTime', title: '创建时间', sort: true,}
      ,{field:'updateTime', title: '更新时间', sort: true,}
    ]]
    ,id: 'search'
    ,page: true
    ,height: 315
  });
  
  
  //再搜索
  var $ = layui.$, active = {
    reload: function(){
      var name = $('#search_name');
      var id = $('#search_id');
      //执行重载
      table.reload('search', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          key: {
            id: id.val(),
            name:name.val()
          }
        }
      });
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>

</body>
</html>