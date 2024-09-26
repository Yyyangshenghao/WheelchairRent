<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看所有用户</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>

<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">所有注册用户</legend>
    </fieldset>

    <!-- 包含 genderPie.jsp，展示性别比例饼图 -->
    <div class="layui-row" style="margin-bottom: 30px;">
        <div class="layui-col-md6 gender-pie">
            <%@ include file="genderPie.jsp" %>
        </div>
        <div class="layui-col-md6 age-group-bar">
            <%@ include file="ageGroupBar.jsp" %>
        </div>
    </div>

    <hr class="divider">

<%--    根据用户名、联系电话查询用户--%>
    <form class="layui-form" lay-filter="searchForm" style="margin-bottom: 20px;">
        <div class="layui-form-item">
            <!-- 用户名输入框 -->
            <div class="layui-inline">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text" name="uName" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <!-- 联系电话输入框 -->
            <div class="layui-inline">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="uPhoneNumber" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
                </div>
            </div>

            <!-- 搜索和重置按钮 -->
            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">搜索</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <!-- 用户列表表格 -->
    <table id="allUser" lay-filter="user"></table>
</div>

<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'table','form'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            form = layui.form;

        var dt = table.render({
            elem: "#allUser",
            url: "/AllUsers",
            page: true,
            cols: [[
                {field: 'uID', title: 'UID', align: 'center'},
                {field: 'uName', title: '用户名', align: 'center'},
                {field: 'uPassword', title: '密码', align: 'center'},
                {field: 'uPhoneNumber', title: '联系电话', align: 'center'},
                {field: 'uNickName', title: '昵称', align: 'center'},
                {
                    field: 'uGender',
                    title: '性别',
                    align: 'center',
                    templet: function (d) {
                        return d.uGender === 'M' ? '男' : '女';
                    }
                },
                {
                    field: 'uBirthdate',
                    title: '生日',
                    align: 'center',
                    templet: function (d) {
                        return new Date(d.uBirthdate).toLocaleDateString();
                    }
                },
                {field: 'uAge', title: '年龄', align: 'center'},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]]
        });

        // 监听搜索表单提交事件
        form.on('submit(search)', function (data) {
            // 重新加载表格，并传递筛选条件
            table.reload('allUser', {
                where: {
                    uName: data.field.uName,
                    uPhoneNumber: data.field.uPhoneNumber,
                },
                page: {curr: 1}
            });
            return false;  // 阻止表单默认提交行为
        });

        table.on('tool(user)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;

            if (layEvent === "edit") {
                window.location.href = "toEditUserPage?uID=" + data.uID;
            }
            if (layEvent === 'delete') {
                layer.confirm('确认删除当前数据吗？', {
                    icon: 5,
                    shade: 0.1
                }, function (index) {
                    $.post("deleteUser", {uID: data.uID}, function (success) {
                        if (success == "OK") {
                            obj.del();
                            dt.reload({
                                page: {curr: 1}
                            });
                            layer.msg("删除成功");
                        }
                    })
                });
            }
        });
    });
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-sm" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger"
       lay-event="delete">删除</a>
</script>
</body>
<style>
    /* 自定义粗线样式 */
    .divider {
        border: 0;
        height: 2px; /* 设置线的厚度 */
        background-color: #333; /* 设置线的颜色 */
        margin-top: 40px;
        margin-bottom: 30px; /* 设置上下间距 */
    }
</style>
</html>
