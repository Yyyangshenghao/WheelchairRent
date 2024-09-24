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
                        return util.toDateString(d.pickupDate, 'yyyy-MM-dd');
                    }},
                {field: 'address', title: '取件地址', align: 'center'},
                {field: 'name', title: '姓名', align: 'center'},
                {field: 'phone', title: '联系电话', align: 'center'},
                {field: 'orderStatus', title: '订单状态', align: 'center',
                    templet:function(d) {
                        switch (d.orderStatus){
                            case 0:
                                return '未确认';
                            case 1:
                                return '已确认，正在上门维修/保养';
                            case 8:
                                return '维修/保养完成'
                            case 9:
                                return '维修/保养失败'
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
        function deleteRepairOrder(data, obj) {
            layer.confirm('确认删除当前订单吗？', {icon: 5, shade: 0.1}, function (index) {
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

        // 确认订单操作
        function confirmRepairOrder(data, obj){
            layer.confirm('是否确认当前订单？',{icon: 5, shade: 0.1}, function (index) {
                $.post("confirmRepairOrder", {rID: data.repairOrderID, oID: data.oID, uID:data.uID, Date:data.pickupDate, address:data.address, name:data.name, phone:data.phone, status:1}, function (response) {
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("确认成功");
                    } else {
                        handleAjaxError(response);
                    }
                });
                layer.close(index);
            });
        }

        // 确认轮椅维修/保养状态
        function repairChair(data, obj) {
            layer.confirm('维修/保养是否成功？', {
                icon: 5,
                shade: 0.1,
                btn: ['成功', '失败']  // 自定义按钮
            }, function(index) {
                // 用户选择 "是"，即维修成功的情况
                // 将 data.date 转换为 Date 对象
                let originalDate = new Date(data.pickupDate);

                // 加一天
                let nextDate = new Date(originalDate);
                nextDate.setDate(originalDate.getDate() + 1);

                // 格式化为 "yyyy-MM-dd"
                let date = nextDate.toISOString().split('T')[0];
                $.post("repairSuccess", { oID: data.oID, rID: data.repairOrderID, date:date}, function(response) {
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("维修/保养已完成");
                    } else {
                        handleAjaxError(response);  // 错误处理
                    }
                });
                layer.close(index);
            }, function(index) {
                // 用户选择 "否"，即维修失败的情况
                $.post("repairFailure", { oID: data.oID, rID: data.repairOrderID}, function(response) {
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("维修/保养已完成");
                    } else {
                        handleAjaxError(response);  // 错误处理
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

            if(layEvent === 'confirm'){
                confirmRepairOrder(data, obj);
            }

            if(layEvent === 'repair'){
                repairChair(data, obj);
            }
        });
    })
</script>
<script type="text/html" id="tools">
    {{# if(d.orderStatus == 0) { }}
    <a class="layui-btn layui-btn-xs" lay-event="confirm">确认</a>
    {{# } }}

    {{# if(d.orderStatus == 1) { }}
    <a class="layui-btn layui-btn-xs" lay-event="repair">维修/保养完成</a>
    {{# } }}

    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>


</script>
</body>
</html>