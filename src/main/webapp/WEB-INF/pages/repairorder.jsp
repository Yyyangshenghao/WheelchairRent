<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>保养/维修订单信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">保养/维修订单信息</legend>
    </fieldset>
    <table id="allRepairOrder" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
            elem: "#allRepairOrder",
            url: "/findAllRepairOrder",
            page: true,
            limit: 10,
            loading: true,
            cols: [[
                {field: 'repairOrderID', title: '保养/维修订单id', align: 'center'},
                {field: 'oid', title: '订单id', align: 'center'},
                {field: 'uid', title: '用户id', align: 'center'},
                {field: 'type', title: '保养/维修', align: 'center'},
                {field: 'pickupDate', title: '取件时间', align: 'center',
                    templet: function(d) {
                        return util.toDateString(d.startDate, 'yyyy-MM-dd');
                    }},
                {field: 'address', title: '取件地址', align: 'center'},
                {field: 'phone', title: '联系电话', align: 'center'},
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
        function deleteRepairOrder(data, obj) {
            layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                $.post("deleteRepairOrder", {id: data.repairOrderID}, function (response) {
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

        table.on('tool(order)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;

            if(layEvent ==="edit"){
                window.location="toAdminUpdateWheelchairPage?hID="+data.oID;
            }

            if(layEvent === 'delete'){
                deleteRepairOrder(data, obj);
            }
        });
    })
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>

</script>
</body>
</html>