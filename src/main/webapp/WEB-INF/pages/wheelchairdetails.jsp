<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${Details.wheelchairDesc}</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <link rel="stylesheet" href="/static/css/details.css">
    <link rel="stylesheet"
          href="//at.alicdn.com/t/font_848666_pri5cwk3xde.css"/>
    <style>
        .layui-carousel-ind {
            top: -20px !important;
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
                <div class="personalCenter layui-pull-right"><a
                        href="toUserSystem" target="_blank"
                        style="color:#fff"><i
                        class="layui-icon layui-icon-tree"></i> 个人中心</a>
                </div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i
                        class="layui-icon layui-icon-tree"></i> 登录 - 注册
                </div>
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
                    <div style="background: url('${d}') no-repeat center; background-size: contain; height: 400px;"></div>
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
            <p><span class="field">品牌名称：</span><span
                    class="name">${Details.communityName }</span></p>
            <p><span class="field">发货地址：</span><span
                    class="name">${Details.wheelchairAddress }</span></p>
            <p><span class="field">联系电话：</span><span
                    class="name">${Details.wheelchairLinkMan }</span></p>
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
            <button class="order-btn layui-anim" lay-submit lay-filter="addOrder" data-anim="layui-anim-scalesmall">
                现在租赁
            </button>
        </div>
        <!-- 添加租赁表单 -->
        <div id="rentForm" style="display: none;">
            <form class="layui-form rent-form"
                  style="max-width: 500px; margin: 0 auto; padding: 20px; border-radius: 8px; background-color: #f2f2f2; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required
                               lay-verify="required" placeholder="请输入姓名"
                               autocomplete="off" class="layui-input"
                               style="border-radius: 4px;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">联系电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" required
                               lay-verify="required"
                               placeholder="请输入联系电话" autocomplete="off"
                               class="layui-input" style="border-radius: 4px;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">配送地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="address" required
                               lay-verify="required"
                               placeholder="请输入配送地址" autocomplete="off"
                               class="layui-input" style="border-radius: 4px;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">租赁时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startDate" id="startDate"
                               required lay-verify="required"
                               placeholder="开始日期" autocomplete="off"
                               class="layui-input" style="border-radius: 4px;">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit
                                lay-filter="submitRentForm"
                                style="width: 100%; background-color: #1E9FFF; border-radius: 4px;">
                            提交订单
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 分隔线，分离评论区和上方内容 -->
    <hr style="margin: 40px 0; border-top: 2px solid #ddd;">
    <%-- 评论展示 --%>
    <div class="comment-section">
        <h3>用户评论</h3>
        <c:forEach var="comment" items="${Comments}">
            <div class="comment-card">
                <div class="comment-header">
                    <strong>${comment.username}  </strong>
                    <span class="comment-date">${comment.commentDateFormatted}</span>
                </div>
                <div class="comment-content">
                    <p>${comment.commentContent}</p><!-- 评分元素 -->
                    <div id="rate-${comment.commentID}" class="rate-demo-readonly"></div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>


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
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'carousel', 'layer', 'form', 'laydate', 'rate'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form,
            laydate = layui.laydate,
            rate = layui.rate;


        // 动态渲染每条评论的评分
        <c:forEach var="comment" items="${Comments}">
        rate.render({
            elem: '#rate-${comment.commentID}', // 使用评论ID作为元素ID
            value: ${comment.rating != null ? comment.rating : 0}, // 使用评论中的评分值
            readonly: true // 只读
        });
        </c:forEach>

        // 初始化日期选择器
        laydate.render({elem: '#startDate'});
        laydate.render({elem: '#endDate'});

        var layer_index;
        carousel.render({
            elem: "#details-image",
            height: "400px",
            anim: "default"
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
                    window.location.reload();
                } else {
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });

        // 点击租赁按钮弹出表单
        $(".order-btn").click(function () {
            if ($(".uName").val() === "") {
                layer.alert("您还没登录，请先登录再操作", {icon: 5});
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
            form.on('submit(submitRentForm)', function (data) {
                // 提交表单内容到后台
                $.post("addOrder", {
                    hID: $(".HID").val(),
                    name: data.field.name,
                    phone: data.field.phone,
                    address: data.field.address,
                    startDate: data.field.startDate,
                }, function (response) {
                    if (response === "OK") {
                        layer.alert("租赁成功！", {icon: 1});
                        layer.closeAll(); // 关闭所有弹层
                        $(".order-btn").addClass("layui-btn-disabled").html("您已成功租赁").off("click");
                    } else if (response === "No_AVAILABLE_CHAIR") {
                        layer.alert("剩余数量不足", {icon: 5});
                    } else {
                        layer.alert("租赁失败，请重试", {icon: 5});
                    }
                });
                return false;
            });
        });
    });
</script>
</body>
<style>
    .comment-section h3 {
        font-size: 24px; /* 设置字体大小 */
        color: #333; /* 字体颜色 */
        text-align: left; /* 左对齐 */
        font-weight: bold; /* 加粗字体 */
        padding-bottom: 10px; /* 底部内边距 */
        border-bottom: 2px solid #eee; /* 添加底部边框 */
        margin-bottom: 20px; /* 底部外边距 */
        font-family: 'Arial', sans-serif; /* 设置字体 */
    }

</style>
</html>
