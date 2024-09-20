<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="layui-header">
    <a href="/welcome" target="iframe">
        <div class="layui-logo">
            <h2>个人中心</h2>
        </div>
    </a>
    <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
        <li class="layui-nav-item" lay-unselect="">
            <a href="javascript:">
                <cite>${loginUser.uNickName}，欢迎回来</cite>
                <span class="layui-nav-more"></span>
            </a>
            <dl class="layui-nav-child layui-anim layui-anim-upbit">
                <dd style="text-align: center;"><a href="/updatepwd">修改密码</a></dd>
                <hr>
                <dd layadmin-event="logout" style="text-align: center;"><a href="signout">退出登录</a></dd>
            </dl>
        </li>
    </ul>
</div>
