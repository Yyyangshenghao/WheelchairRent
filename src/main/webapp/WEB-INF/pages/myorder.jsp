<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的订单</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">我的租赁订单</legend>
    </fieldset>
    <table id="wheelchairList" lay-filter="order"></table>
</div>

<script src="/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
            elem: "#wheelchairList",
            url: "/myOrderInfo",
            page: true,
            limit: 10,
            loading: true,
            cols: [[
                {field: 'oID', title: '订单id', align: 'center'},
                {field: 'cID', title: '轮椅id', align: 'center'},
                {field: 'cName', title: '轮椅品牌', align: 'center'},
                {field: 'chairNo', title: '轮椅编号', align: 'center'},
                {field: 'uName', title: '租赁人姓名', align: 'center'},
                {field: 'uPhone', title: '租赁人电话', align: 'center'},
                {field: 'uAddress', title: '租赁人地址', align: 'center'},
                {
                    field: 'startDate',
                    title: '租赁开始时间',
                    align: 'center',
                    templet: function(d) {
                        return util.toDateString(d.startDate, 'yyyy-MM-dd');
                    }
                },
                {
                    field: 'endDate',
                    title: '租赁结束时间',
                    align: 'center',
                    templet: function(d) {
                        return util.toDateString(d.endDate, 'yyyy-MM-dd');
                    }
                },
                {field: 'orderStatus', title: '订单状态', align: 'center'},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]]
        });

        // 封装表格刷新函数
        function reloadTable() {
            dt.reload({page: {curr: 1}});
        }

        // 通用的 AJAX 错误处理
        function handleAjaxError(response) {
            layer.msg(response.message || "操作失败，请稍后重试");
        }

        // 删除订单操作
        function deleteOrder(data, obj) {
            layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                $.post("deleteOrder", {oID: data.oID}, function (response) {
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("删除成功");
                    } else {
                        handleAjaxError(response);
                    }
                });
                layer.close(index);
            });
        }

        // 申请维修保养表单弹出
        function openRepairForm(data) {
            layer.open({
                type: 1,
                title: '申请保养/维修',
                area: ['500px', '400px'],
                content: `
                <form id="repairForm" class="layui-form" style="padding: 20px;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">类型</label>
                        <div class="layui-input-block">
                            <input type="radio" name="type" value="repair" title="维修" checked>
                            <input type="radio" name="type" value="maintenance" title="保养">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">取件日</label>
                        <div class="layui-input-block">
                            <input type="date" name="pickupDate" required lay-verify="required" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">取件地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="address" required lay-verify="required" placeholder="请输入地址" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系电话</label>
                        <div class="layui-input-block">
                            <input type="text" name="phone" required lay-verify="required|phone" placeholder="请输入电话" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="submitRepair">提交申请</button>
                        </div>
                    </div>
                </form>
                `,
                success: function (layero, index) {
                    layui.form.render();
                    layui.form.on('submit(submitRepair)', function (formData) {
                        $.post("applyRepairOrder", {
                            oID: data.oID,
                            type: formData.field.type,
                            pickupDate: formData.field.pickupDate,
                            address: formData.field.address,
                            phone: formData.field.phone,
                            orderStatus: 0  // 替换为实际的整数值
                        }, function (response) {
                            if (response === "OK") {
                                reloadTable();
                                layer.msg("申请提交成功");
                                layer.close(index);
                            } else {
                                handleAjaxError(response);
                            }
                        });
                        return false;
                    });
                }
            });
        }

        table.on('tool(order)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;

            if (layEvent === 'delete') {
                deleteOrder(data, obj);
            } else if (layEvent === 'repair') {
                openRepairForm(data);
            }
        });
    });
</script>

<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="repair">保养/维修</a>
</script>
</body>
</html>
