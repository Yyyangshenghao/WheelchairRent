<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有租赁订单信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">租赁订单信息</legend>
    </fieldset>
    <table id="allOrder" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
            elem: "#allOrder",
            url: "/findAllOrder",
            page: true,
            limit: 10,
            loading: true,
            cols: [[
                {field: 'oID', title: '订单id', align: 'center'},
                {field: 'cID', title: '轮椅id', align: 'center'},
                {field: 'uID', title: '用户id', align: 'center'},
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
                {field: 'orderStatus', title: '订单状态', align: 'center',
                    templet:function(d) {
                        switch (d.orderStatus){
                            case 0:
                                return '已结束';
                            case 1:
                                return '等待发货';
                            case 2:
                                return '配送中';
                            case 3:
                                return '使用中';
                            case 4:
                                return '等待回收';
                            case 5:
                                return '回收中';
                        }}},
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

        table.on('tool(order)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;

            if(layEvent ==="edit"){
                window.location="toAdminUpdateWheelchairPage?hID="+data.oID;
            }

            if(layEvent === 'delete'){
                deleteOrder(data, obj);
            }
        });
    })
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>

</script>
</body>
</html>