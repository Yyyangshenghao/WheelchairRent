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
    <!-- 搜索框和筛选框 -->
    <form class="layui-form" lay-filter="searchForm" style="margin-bottom: 20px;">
        <div class="layui-form-item">
            <!-- 电话号码搜索 -->
            <div class="layui-inline">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
                </div>
            </div>
            <!-- 配送类型筛选 -->
            <div class="layui-inline">
                <label class="layui-form-label">配送类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-filter="type">
                        <option value="">请选择类型</option>
                        <option value="0">送出</option>
                        <option value="1">收回</option>
                    </select>
                </div>
            </div>
            <!-- 订单状态筛选 -->
            <div class="layui-inline">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                    <select name="orderStatus" lay-filter="orderStatus">
                        <option value="">请选择状态</option>
                        <option value="0">未处理</option>
                        <option value="1">已确认，正在配送</option>
                        <option value="2">签收成功</option>
                    </select>
                </div>
            </div>
            <!-- 时间排序 -->
            <div class="layui-inline">
                <label class="layui-form-label">时间排序</label>
                <div class="layui-input-inline">
                    <select name="timeSort" lay-filter="timeSort">
                        <option value="">选择排序方式</option>
                        <option value="asc">从早到晚</option>
                        <option value="desc">从晚到早</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">搜索</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>

    <table id="allDeliveryOrder" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util,
            form = layui.form;

        var dt = table.render({
            elem: "#allDeliveryOrder",  // 修改为正确的表格 id
            url: "/findAllDeliveryOrder",  // 获取配送订单数据的后端接口
            page: true,
            limit: 10,
            loading: true,
            where: {
                phone:'',
                type:'',
                orderStatus:'',
                timeSort:''
            },
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

        // 监听搜索按钮
        form.on('submit(search)', function(data) {
            var field = data.field;  // 获取表单数据
            // 重新加载表格，根据筛选条件查询
            table.reload('allDeliveryOrder', {
                where: {
                    phone: field.phone,
                    type: field.type,
                    orderStatus: field.orderStatus,
                    timeSort: field.timeSort
                },
                page: { curr: 1 }  // 重置分页
            });
            return false;  // 阻止表单提交
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
                // 将 data.date 转换为 Date 对象
                let originalDate = new Date(data.date);

                // 加一天
                let nextDate = new Date(originalDate);
                nextDate.setDate(originalDate.getDate() + 1);

                // 格式化为 "yyyy-MM-dd"
                let endDate = nextDate.toISOString().split('T')[0];
                console.log("Adjusted end_date sent to server:", endDate);
                $.post("/delivery-orders/updateOrderStatus", { dID: data.dID, d_status: 1, uID: data.uID, cID: data.cID, o_status: 2, r_status: 0, end_date: endDate }, function (response) {
                    if (response === "OK") {
                        layer.msg("订单状态已更新");
                        reloadTable();  // 刷新表格
                    } else {
                        handleAjaxError(response);  // 错误处理
                    }
                });
            }

            if(layEvent === 'signed') {
                // 将 data.date 转换为 Date 对象
                let originalDate = new Date(data.date);

                // 加一天
                let nextDate = new Date(originalDate);
                nextDate.setDate(originalDate.getDate() + 1);

                // 格式化为 "yyyy-MM-dd"
                let endDate = nextDate.toISOString().split('T')[0];
                console.log("Adjusted end_date sent to server:", endDate);
                $.post("/delivery-orders/updateOrderStatus", { dID: data.dID, d_status: 2, uID: data.uID, cID: data.cID, o_status: 3, r_status: 2, end_date: endDate }, function (response) {
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
