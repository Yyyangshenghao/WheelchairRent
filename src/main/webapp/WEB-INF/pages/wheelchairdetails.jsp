 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${Details.wheelchairDesc}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/details.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_848666_pri5cwk3xde.css"/>
    <style>
        .layui-carousel-ind{
            top:-20px!important;
        }
    </style>
</head>
<body>
<header>
    <div class="layui-header title">
        <div class="layui-container">
            <div class="layui-pull-left">
            	<a href="toIndexPage" target="_blank">
	                <img src="/static/img/logo.png" width="48px">
                    <span style="margin-left: 10px; font-size: 20px; color: white;">智能轮椅租赁平台</span>
            	</a>
            </div>
            <c:if test="${not empty loginUser }">
	            <div class="personalCenter layui-pull-right"><a href="toUserSystem" target="_blank" style="color:#fff"><i class="layui-icon layui-icon-tree"></i> 个人中心</a></div>
            </c:if>
            <c:if test="${empty loginUser }">
	            <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i> 登录 - 注册</div>
            </c:if>
        </div>
    </div>
    <div class="details-head">
        <!-- title -->
        <div class="title-wrapper">
            <div class="left-con">
                <h2 class="wheelchair-title">${Details.wheelchairDesc}</h2>
                <p class="tags">
                    <span>智能轮椅</span>
                </p>
            </div>
        </div>
    </div>
</header>

<section class="layui-container wrapper">
    <p class="breadcrumb">
        <span class="layui-breadcrumb" lay-separator=">">
            <a href="toIndexPage">首页</a>
            <a href=" ">轮椅详情</a>
        </span>
    </p>
    <div class="carousel-image layui-pull-left layui-col-md7">
        <div class="layui-carousel" id="details-image">
            <div carousel-item style="float: left;">
            	<c:forEach items="${DetailsImg }" var="d">
	                <div style="background: url('${d}')no-repeat center/cover"></div>
            	</c:forEach>
            </div>
        </div>
    </div>
    <div class="details-info layui-pull-right layui-col-md5 ">
        <div class="show-price">
            <span class="sale-price">${Details.wheelchairPrice }</span>
            <span class="sale-unit">元/月</span>
            <span class="area">当前剩余数量：${Details.wheelchairType }</span>
        </div>
        <hr>
        <div class="show-wheelchair-name">
            <p><span class="field">小区名称：</span><span class="name">${Details.communityName }</span></p>
            <p><span class="field">发货地址：</span><span class="name">${Details.wheelchairAddress }</span></p>
            <p><span class="field">周边学校：</span><span class="name">请联系我咯</span></p>
            <p><span class="field">联系电话：</span><span class="name">${Details.wheelchairLinkMan }</span></p>
        </div>
        <hr>
        <div class="wheelchair-model">
            <ul>
                <li>
                    <p>${Details.wheelchairModel }</p>
                    <span>特点</span>
                </li>
                <li>
                    <p>${Details.wheelchairArea } km</p>
                    <span>续航</span>
                </li>
                <li>
                    <p>${Details.wheelchairOriented} kg</p>
                    <span>重量</span>
                </li>
            </ul>
        </div>
        <hr>
        <div class="order-btn-container">
        	<input type="hidden" class="HID" value="${Details.hID}">
        	<input type="hidden" class="uName" value="${loginUser.uName}">
            <button class="order-btn" lay-submit lay-filter="addOrder">现在租赁</button>
        </div>
        <!-- 添加租赁表单 -->
        <div id="rentForm" style="display: none;">
            <form class="layui-form rent-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" required lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">配送地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required lay-verify="required" placeholder="请输入配送地址" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">租赁时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startDate" id="startDate" required lay-verify="required" placeholder="开始日期" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">-</div>
                    <div class="layui-input-inline">
                        <input type="text" name="endDate" id="endDate" required lay-verify="required" placeholder="结束日期" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-submit lay-filter="submitRentForm">提交订单</button>
                </div>
            </form>
        </div>
    </div>
</section>


<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter="" style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this">登录</li>
            <li>注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit lay-filter="login">立即登录</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="" style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="uName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="uPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="uPhoneNumber" required  lay-verify="required" placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="uNickName" required  lay-verify="required" placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </form>
                    <div class="layui-form-item">
                        <input type="submit" class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn" value="立即注册" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'carousel', 'layer','form', 'laydate'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate;

        // 初始化日期选择器
        laydate.render({elem: '#startDate'});
        laydate.render({elem: '#endDate'});

		var layer_index;
        carousel.render({
            elem: "#details-image",
            width: "100%",
            height: "400px",
            anim: "default"
        });

        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['360px', '460px'],
                title: "房屋租赁",
                closeBtn: 2
            });
        });
        $('.regist-btn').click(function () {
        	if($("input[name='uName']").val()!=""&&$("input[name='uPassword']").val()!=""&&$("input[name='uPhoneNumber']").val()!=""&&$("input[name='uNickName']").val()!=""){
	            $.post("regist",$('.form').serialize(),function (res) {
	            	console.log(res)
	                if(res=='OK'){
	                	layer.close(layer_index);
	                    layer.alert("注册成功",{icon:1,time:2000});
	                    $('.form')[0].reset();
	                }else{
	                    layer.msg("注册失败,用户名已存在");
	                }
	            })
        	}else{
        		layer.msg("请填写所有表单");
        	}
        });
        // 点击租赁按钮弹出表单
        $(".order-btn").click(function(){
        	if($(".uName").val()==""){
        		layer.alert("您还没登录，请先登录再操作",{icon:5});
        		return;
        	}

        // 弹出表单
            layer.open({
                type: 1,
                title: '填写租赁信息',
                area: ['500px', '400px'],
                content: $('#rentForm')
            });

            // 提交订单表单
            form.on('submit(submitRentForm)', function(data) {
                // 提交表单内容到后台
                $.post("addOrder", {
                    hID: $(".HID").val(),
                    name: data.field.name,
                    phone: data.field.phone,
                    address: data.field.address,
                    startDate: data.field.startDate,
                    endDate: data.field.endDate
                }, function(response) {
                    if (response === "OK") {
                        layer.alert("租赁成功！", {icon: 1});
                        layer.closeAll(); // 关闭所有弹层
                        $(".order-btn").addClass("layui-btn-disabled").html("您已成功租赁").off("click");
                    } else if(response === "No_AVAILABLE_CHAIR") {
                        layer.alert("剩余数量不足", {icon: 5});
                    } else {
                        layer.alert("租赁失败，请重试", {icon: 5});
                    }
                });
                return false;
            });
        });
        form.on("submit(login)",function(){
     	   $.post("login",$('#login').serialize(),function (res) {
     	   		if(res=="OK"){
     	   			window.location.reload();
     	   		}else{
     	   			layer.msg("用户名或者密码错误");
     	   		}
     	   });
     	  return false;
        });
    });
</script>
</body>
</html>
