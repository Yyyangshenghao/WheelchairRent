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

    <!-- 搜索表单开始 -->
    <form class="layui-form" lay-filter="searchForm" style="margin-bottom: 20px;">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">租赁人电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="uPhone" placeholder="请输入租赁人电话" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">轮椅编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="chairNo" placeholder="请输入轮椅编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">订单状态</label>
                <div class="layui-input-inline">
                    <select name="orderStatus" lay-filter="orderStatus">
                        <option value="">请选择状态</option>
                        <option value="0">已结束</option>
                        <option value="1">等待发货</option>
                        <option value="2">配送中</option>
                        <option value="3">使用中</option>
                        <option value="4">等待上门维修/保养</option>
                        <option value="5">回收中</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">搜索</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <!-- 搜索表单结束 -->

    <table id="allOrder" lay-filter="order"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element', 'form', 'table', 'util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util,
            form = layui.form;

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
                        // 如果 endDate 为 null，显示“尚未结束”，否则显示日期
                        return d.endDate ? util.toDateString(d.endDate, 'yyyy-MM-dd') : '尚未结束';
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
                                return '等待上门维修/保养';
                            case 5:
                                return '回收中';
                        }}},
                {title: '操作', align: 'center', toolbar: "#tools"}
            ]]
        });

        form.on('submit(search)', function(data) {
            var field = data.field; // 获取表单字段值
            // 重新加载表格数据，加入搜索条件
            table.reload('allOrder', {
                where: field, // 搜索条件
                page: { curr : 1 } // 重新从第1页开始
            })
            return false; // 阻止表单默认提交
        })

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