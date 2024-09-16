<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户个人中心</title>
    <!-- 引入公共的 CSS 文件 -->
    <link rel="stylesheet" href="/static/layui/css/layui.css?v=1.0">
    <link rel="stylesheet" href="/static/css/admin.css?v=1.0">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!-- 头部导航 -->
    <jsp:include page="/WEB-INF/pages/header.jsp" />


    <!-- 侧边栏 -->
    <div class="layui-side">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <li class="layui-nav-item">
                <a href="javascript:">用户信息管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="myorder" target="iframe">我的租赁订单</a></dd>
                    <dd><a href="updatepwd" target="iframe">修改我的密码</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!-- 内容区域 -->
    <div class="layui-body">
        <iframe src="welcome" width="100%" height="100%" frameborder="0" name="iframe" scrolling="auto"
                seamless></iframe>
    </div>
</div>

<!-- 引入公共的 JS 文件 -->
<script src="/static/layui/layui.js?v=1.0"></script>
<script type="text/javascript">
    layui.use(['element'], function () {
        var element = layui.element,
            $ = layui.jquery;
    });
</script>
</body>
</html>
