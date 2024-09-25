<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/static/layui/css/layui.css"/>
    <title>智能轮椅租赁网</title>
    <link rel="stylesheet" href="/static/css/global.css">
    <script src="/static/layui/layui.js"></script>
</head>
<body>
<div class="layui-carousel" id="bg-item">
    <div class="layui-header title">
        <div class="layui-container">
            <div class="layui-logo layui-pull-left">
                <img src="/static/img/logo.png" width="48px">
                <span style="margin-left: 10px; font-size: 20px; color: white;">智能轮椅租赁平台</span>
            </div>
            <c:if test="${not empty loginUser }">
                <div class="personalCenter layui-pull-right"><a
                        href="toUserSystem" target="_blank"
                        style="color:#fff"><i
                        class="layui-icon layui-icon-tree"></i>个人中心</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="personalCenter layui-pull-right"><a
                        href="toAdminLogin" target="_blank"
                        style="color:#fff"><i
                        class="layui-icon layui-icon-tree"></i>管理员登录</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i
                        class="layui-icon layui-icon-tree"></i>用户登录
                </div>
            </c:if>

        </div>
    </div>
    <!--搜索框-->
    <div class="layui-container">
        <div class="seach-input">
            <form class="seach-form layui-form" method="post"
                  action="findWheelchairByLike">
                <div class="layui-pull-left input">
                    <input type="text" placeholder="输入您想租赁的轮椅..."
                           name="keywords" class="seach layui-input"
                           lay-verify="">
                </div>
                <div class="layui-pull-left button">
                    <button class="btn seach-btn" lay-submit><i
                            class="layui-icon layui-icon-search"
                            style="font-size: 24px;"></i></button>
                </div>
            </form>
        </div>
    </div>
    <div carousel-item>
        <div style="background: url('/static/img/banner2.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner1.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner3.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner4.jpg')no-repeat center/cover"></div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter=""
         style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this" style="width: 225px">登录</li>
            <li style="width: 225px">注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required
                                       lay-verify="required"
                                       placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required
                                       lay-verify="required"
                                       placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius"
                                    lay-submit
                                    lay-filter="login">立即登录
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form">
                        <!-- 用户名 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="uName" required lay-verify="required" placeholder="请输入用户名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <!-- 密码 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="uPassword" required lay-verify="required" placeholder="请输入密码"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <!-- 手机号 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="uPhoneNumber" required lay-verify="required" placeholder="注册后不能修改"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <!-- 昵称 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="uNickName" required lay-verify="required" placeholder="注册后不能修改"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <!-- 性别 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <select name="uGender" required lay-verify="required">
                                    <option value="">请选择性别</option>
                                    <option value="M">男</option>
                                    <option value="F">女</option>
                                </select>
                            </div>
                        </div>

                        <!-- 出生日期 -->
                        <div class="layui-form-item">
                            <label class="layui-form-label">出生日期</label>
                            <div class="layui-input-block">
                                <input type="date" name="uBirthdate" required lay-verify="required" class="layui-input">
                            </div>
                        </div>

                    </form>

                    <!-- 注册按钮 -->
                    <div class="layui-form-item">
                        <input type="submit" class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn" value="立即注册"/>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!--内容开始-->
<div class="list_control_bar layui-container" style="padding: 0">
    <div>
        <div class="list_title layui-pull-left"><span>全部轮椅</span></div>
        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a href="toIndexPage">默认排序</a></li>
                <li><a href="findHousrOrderByAsc">价格升序</a></li>
                <li><a href="findHousrOrderByDesc">价格降序</a></li>
            </ul>
        </div>
    </div>
</div>

<section class="layui-container">
    <hr>
    <h2>找到<span
            style="color: #ffc601;margin: 0 5px;">${Wheelchair.size()}</span>个搜索结果
    </h2>
    <div class="wheelchair-detail">
        <ul>
            <c:forEach items="${Wheelchair }" var="h">
                <li>
                    <a href="toDetailsPage?id=${h.hID }" class="show-image">
                        <img src="${h.wheelchairImage }" width="240px"
                             height="180px">
                    </a>
                    <div class="show-details">
                        <p class="wheelchair-title">
                            <a href="toDetailsPage?id=${h.hID }">${h.wheelchairDesc }</a>
                        </p>
                        <p class="wheelchair-about">
                            <span class="layui-icon layui-icon-home"></span>
                            <span>${h.wheelchairModel}</span>
                            <span class="flag-line">|</span>
                            <span>续航 ${h.wheelchairArea } km</sup></span>
                            <span class="flag-line">|</span>
                            <span>重量 ${h.wheelchairOriented} kg</span>
                            <span class="flag-line">|</span>
                            <span>型号 ${h.wheelchairFloor }</span>
                            <span class="flag-line">|</span>
                            <span>剩余数量：${h.wheelchairType }</span>
                        </p>
                        <p class="wheelchair-address clearfix">
                            <span class="layui-icon layui-icon-location"></span>
                            <span class="whole-line">
			    		        <span>${h.wheelchairAddress}</span>
					        </span>
                        </p>
                        <div class="show-price">
                            <span class="sale-price">${h.wheelchairPrice}</span>
                            <span class="sale-unit">元/日</span>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>
<footer>

</footer>
<script>
    layui.use(['element', 'carousel', 'layer', 'form'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        var layer_index;
        carousel.render({
            elem: "#bg-item",
            width: "100%",
            height: "600px",
            anim: "fade"
        });
        $('.operation').click(function () {
            layer_index = layer.open({
                type: 1,
                content: $('#sign'),
                area: ['450px', '550px'],
                title: "用户登录",
                closeBtn: 2
            });
        });
        $('.list-item li').click(function () {
            $('.list-item li').removeClass('click-this');
            $(this).addClass('click-this');
        });

        // 计算年龄的函数
        function calculateAge(birthDate) {
            var today = new Date();
            var age = today.getFullYear() - birthDate.getFullYear();
            var monthDifference = today.getMonth() - birthDate.getMonth();

            // 如果当前月份还没有到用户的出生月份，或者到了但当前日期还没有到出生日期，则年龄减1
            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            return age;
        }

        $('.regist-btn').click(function () {
            var uName = $("input[name='uName']").val();
            var uPassword = $("input[name='uPassword']").val();
            var uPhoneNumber = $("input[name='uPhoneNumber']").val();
            var uNickName = $("input[name='uNickName']").val();
            var uGender = $("select[name='uGender']").val();  // 获取性别
            var uBirthdate = $("input[name='uBirthdate']").val();  // 获取出生日期

            // 检查所有字段是否填写
            if (uName && uPassword && uPhoneNumber && uNickName && uGender && uBirthdate) {
                // 计算年龄
                var uAge = calculateAge(new Date(uBirthdate));

                // 将年龄添加到表单中
                $('<input>').attr({
                    type: 'hidden',
                    name: 'uAge',
                    value: uAge
                }).appendTo('.form');

                $.post("regist", $('.form').serialize(), function (res) {
                    console.log(res);
                    if (res === 'OK') {
                        layer.alert("注册成功", {icon: 1, time: 2000});
                        $('.form')[0].reset();  // 重置表单
                    } else {
                        layer.msg("注册失败, 用户名已存在");
                    }
                });
            } else {
                layer.msg("请填写所有表单项");
            }
        });

        form.on("submit(login)", function () {
            $.post("login", $('#login').serialize(), function (res) {
                if (res === "OK") {
                    window.location.href = "toIndexPage";
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });
    });
</script>
</body>
<style>

</style>
</html>
