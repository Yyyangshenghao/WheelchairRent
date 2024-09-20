<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>配送订单信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">配送订单信息</legend>
    </fieldset>
    <table id="allDeliveryOrder" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
            elem: "#allDeliveryOrder",  // 修改为正确的表格 id
            url: "/findAllDeliveryOrder",  // 获取配送订单数据的后端接口
            page: true,
            limit: 10,
            loading: true,
            cols: [[
                {field: 'dID', title: '配送订单id', align: 'center'},
                {field: 'uID', title: '用户id', align: 'center'},
                {field: 'cID', title: '轮椅id', align: 'center'},
                {field: 'type', title: '配送类型', align: 'center',
                templet:function (d){
                    switch (d.type){
                        case 0:
                            return '送出'
                        case 1:
                            return '收回'
                    }
                }},
                {field: 'date', title: '配送/取件日期', align: 'center',
                    templet: function(d) {
                        return util.toDateString(d.date, 'yyyy-MM-dd');  // 日期格式化
                    }},
                {field: 'address', title: '地址', align: 'center'},
                {field: 'name', title: '姓名', align: 'center'},
                {field: 'phone', title: '联系电话', align: 'center'},
                {field: 'orderStatus', title: '订单状态', align: 'center',
                    templet:function (d){
                        switch (d.orderStatus){
                            case 0:
                                return '未处理'
                            case 1:
                                return '已确认，正在配送'
                            case 2:
                                return '签收成功'
                        }
                    }},
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
        function deleteDeliveryOrder(data, obj) {
            layer.confirm('确认删除当前数据吗？', {icon: 5, shade: 0.1}, function (index) {
                $.ajax({
                    url: "/delivery-orders/" + data.dID,  // 确保发送正确的 id
                    type: "DELETE",  // 设置请求方法为 DELETE
                    success: function (response) {
                        console.log("data.dID:\n", data.dID);
                        console.log("data:\n", data);
                        if (response === "Delivery order deleted successfully") {  // 确保根据后端返回的内容判断
                            obj.del();
                            reloadTable();
                            layer.msg("删除成功");
                        } else {
                            handleAjaxError(response);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error:", error);
                        handleAjaxError(xhr.responseText);
                    }
                });
                layer.close(index);
            });
        }


        table.on('tool(order)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;

            if (layEvent === "edit") {
                window.location = "toAdminUpdateDeliveryOrderPage?dId=" + data.dId;  // 跳转编辑页面
            }

            if (layEvent === 'delete') {
                deleteDeliveryOrder(data, obj);  // 执行删除操作
            }

            if (layEvent === 'update') {
                $.post("/delivery-orders/updateOrderStatus", { dID: data.dID, d_status: 1, uID: data.uID, cID: data.cID, o_status: 2}, function (response) {
                    if (response === "OK") {
                        layer.msg("订单状态已更新");
                        reloadTable();  // 刷新表格
                    } else {
                        handleAjaxError(response);  // 错误处理
                    }
                });
            }

            if(layEvent === 'signed') {
                $.post("/delivery-orders/updateOrderStatus", { dID: data.dID, d_status: 2, uID: data.uID, cID: data.cID, o_status: 3}, function (response) {
                    if (response === "OK") {
                        layer.msg("订单状态已更新");
                        reloadTable();  // 刷新表格
                    } else {
                        handleAjaxError(response);  // 错误处理
                    }
                });
            }
        });
    })
</script>
<script type="text/html" id="tools">
    {{# if(d.orderStatus == 0) { }}
    <a class="layui-btn layui-btn-xs" lay-event="update">确认</a>
    {{# } }}

    {{# if(d.orderStatus == 1) { }}
    <a class="layui-btn layui-btn-xs" lay-event="signed">签收确认</a>
    {{# } }}

    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>

</script>
</body>
</html>
