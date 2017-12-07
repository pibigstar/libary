<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../config/config.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>图书后台管理系统</title>
    <link rel="shortcut icon" href="${myImages}/Logo_40.png" type="image/x-icon">
    <!-- layui.css -->
    <link href="${plugin}/layui/css/layui.css" rel="stylesheet" />
    <!-- 本页样式 -->
    <link href="${myCss}/index.css" rel="stylesheet" />
    <script type="text/javascript" src="${myJs }/jquery.js"></script>
</head>
<body>
    <div class="mask"></div>
    <div class="main">
        <h1><span style="font-size: 84px;">B</span><span style="font-size:30px;">log</span></h1>
        <p id="time"></p>
        <div class="enter">
            请&nbsp;&nbsp;点击&nbsp;&nbsp;这里登录
        </div>
    </div>
    <!-- layui.js -->
    <script src="${plugin}/layui/layui.js"></script>
    
  	<script type="text/javascript">
    	/* 前台JS表单控制**/
    layui.define(['element', 'layer', 'form'], function (exports) {
        var form = layui.form;
        var $ = layui.jquery;
        //自定义验证
        form.verify({
            passWord: [/^[\S]{2,12}$/, '密码必须5到12位'],
            username: function (value) {
                if (value.length <= 0 || value.length > 10) {
                    return "账号必须1到10位"
                }
                var reg = /^[a-zA-Z0-9]*$/;
                if (!reg.test(value)) {
                    return "账号只能为英文或数字";
                }
            },
            result_response: function (value) {
                if (value.length < 1) {
                    return '请点击人机识别验证';
                }
            },
        });

        //监听登陆提交
        form.on('submit(btn_login)', function (data) {
        	console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
        	$.ajax({
        		url:'${prc}/user/login.do',
        		type:'POST',
        		dataType:'json',
        		data:data.field,
        		success:function(d){
        			if(d.success){
        				layer.msg('登陆成功，正在跳转......', { icon: 6 });
        	        	 layer.closeAll('page');
        	             setTimeout(function () {
        	                 location.href = "${prc}/admin/main.jsp";
        	             }, 1000);
        			}else{
        				layer.msg('账号或者密码错误', { icon: 5 });
        			}
        		}
        	});
            return false;//阻止表单跳转
        });
        
        //检测键盘按下登录
        $('body').keydown(function (e) {
            if (e.keyCode == 13) {  //Enter键
                if ($('#layer-login').length <= 0) {
                    showLogin();
                } else {
                    $('button[lay-filter=login]').click();
                }
            }
        });

        /*显示登录窗口*/
        $('.enter').on('click', showLogin);

        function showLogin() {
        	 var loginHtml = ''; //静态页面只能拼接，这里可以用iFrame或者Ajax请求分部视图。html文件夹下有login.html

             loginHtml += '<form class="layui-form">';
             loginHtml += '<div class="layui-form-item">';
             loginHtml += '<label class="layui-form-label">账号</label>';
             loginHtml += '<div class="layui-input-inline pm-login-input">';
             loginHtml += '<input type="text" name="username" lay-verify="account" placeholder="请输入账号" value="admin" autocomplete="off" class="layui-input">';
             loginHtml += '</div>';
             loginHtml += '</div>';
             loginHtml += '<div class="layui-form-item">';
             loginHtml += '<label class="layui-form-label">密码</label>';
             loginHtml += '<div class="layui-input-inline pm-login-input">';
             loginHtml += '<input type="password" name="password" lay-verify="passWord" placeholder="请输入密码" value="admin" autocomplete="off" class="layui-input">';
             loginHtml += '</div>';
             loginHtml += '</div>';
             loginHtml += '<div class="layui-form-item">';
             loginHtml += '<label class="layui-form-label">人机验证</label>';
             loginHtml += '<div class="layui-input-inline pm-login-input">';
             loginHtml += '<input type="text" name="result_response" placeholder="人机验证，百度螺丝帽" value="" autocomplete="off" class="layui-input">';
             loginHtml += '</div>';
             loginHtml += '</div>';
             loginHtml += '<div class="layui-form-item" style="margin-top:25px;margin-bottom:0;">';
             loginHtml += '<div class="layui-input-block">';
             loginHtml += ' <button class="layui-btn" style="width:230px;" lay-submit="" lay-filter="btn_login">立即登录</button>';
             loginHtml += ' </div>';
             loginHtml += ' </div>';
             loginHtml += '</form>';
            
            //显示登录弹窗
            layer.open({
                id: 'layer-login',
                type: 1,
                title: false,
                shade: 0.4,
                shadeClose: true,
                area: ['480px', '270px'],
                closeBtn: 0,
                anim: 1,
                skin: 'pm-layer-login',
                content: loginHtml
            });
            //手动渲染
            layui.form.render('checkbox');
        }

        exports('index', {});
    });
    </script>
    
</body>
</html>