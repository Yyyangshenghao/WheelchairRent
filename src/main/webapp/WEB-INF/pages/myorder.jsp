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
    layui.use(['element', 'form', 'table', 'util', 'rate'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util,
            rate = layui.rate;


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
                    templet: function (d) {
                        // 如果 orderStatus 是 0（已结束），显示真正的结束时间，否则显示“尚未结束”
                        if (d.orderStatus === 0) {
                            return d.endDate ? util.toDateString(d.endDate, 'yyyy-MM-dd') : '未提供结束时间';
                        } else {
                            return '尚未结束';
                        }
                    }
                },
                {
                    field: 'orderStatus', title: '订单状态', align: 'center',
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
                        }
                    }
                },
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
            layer.confirm('确认取消当前订单吗？', {icon: 5, shade: 0.1}, function (index) {
                $.post("deleteOrder", {oID: data.oID}, function (response) {
                    console.log()
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("取消成功");
                    } else {
                        handleAjaxError(response);
                    }
                });
                layer.close(index);
            });
        }

        // 删除订单操作
        function cancelRepairOrder(data, obj) {
            layer.confirm('确认取消当前维修/保养吗？', {icon: 5, shade: 0.1}, function (index) {
                $.post("deleteRepairOrderByoID", {oID: data.oID}, function (response) {
                    console.log()
                    if (response === "OK") {
                        obj.del();
                        reloadTable();
                        layer.msg("取消成功");
                    } else {
                        handleAjaxError(response);
                    }
                });
                layer.close(index);
            });
        }

        // 归还轮椅
        // 归还轮椅表单弹出
        function openReturnForm(data) {
            layer.open({
                type: 1,
                title: '归还轮椅',
                area: ['500px', '400px'],
                content: `
        <form id="returnForm" class="layui-form" style="padding: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">取件日</label>
                <div class="layui-input-block">
                    <input type="date" name="returnDate" id="returnDate" required lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">取件地址</label>
                <div class="layui-input-block">
                    <input type="text" name="address" required lay-verify="required" placeholder="请输入地址" class="layui-input" value="${data.address}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" class="layui-input" value="${data.name}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" required lay-verify="required|phone" placeholder="请输入电话" class="layui-input" value="${data.phone}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="submitReturn">提交归还</button>
                </div>
            </div>
        </form>
        `,
                success: function (layero, index) {
                    layui.form.render();
                    layui.form.on('submit(submitReturn)', function (formData) {
                        $.post("returnChair", {
                            oID: data.oID,
                            cID: data.cID,
                            returnDate: formData.field.returnDate,
                            address: formData.field.address,
                            name: formData.field.name,
                            phone: formData.field.phone,
                            orderStatus: 5  // 等待上门回收
                        }, function (response) {
                            if (response === "OK") {
                                reloadTable();
                                layer.msg("归还成功，正在处理轮椅");
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
                        <label class="layui-form-label">上门日</label>
                        <div class="layui-input-block">
                            <input type="date" name="pickupDate" required lay-verify="required" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">上门地址</label>
                        <div class="layui-input-block">
                            <input type="text" name="address" required lay-verify="required" placeholder="请输入地址" class="layui-input">
                        </div>
                    </div><div class="layui-form-item">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="name" required lay-verify="required" placeholder="请输入姓名" class="layui-input">
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
                            cID: data.cID,
                            type: formData.field.type,
                            pickupDate: formData.field.pickupDate,
                            address: formData.field.address,
                            name:formData.field.name,
                            phone: formData.field.phone,
                            orderStatus: data.orderStatus  // 替换为实际的整数值
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

        // 添加评论功能
        window.addComment = function (data) {
            layer.open({
                type: 1,
                title: '添加评论',
                area: ['500px', '300px'],
                content: `<form id="commentForm" class="layui-form" style="padding: 20px;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">评分</label>
                        <div id="ID-rate-demo-text"></div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">评论内容</label>
                        <div class="layui-input-block">
                            <textarea name="comment" required lay-verify="required" placeholder="请输入评论" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="submitComment">提交评论</button>
                        </div>
                    </div>
                </form>`,
                success: function (layero, index) {
                    layui.form.render();
                    // 初始化评分组件
                    rate.render({
                        elem: '#ID-rate-demo-text',
                        value: null, // 初始值
                        text: true, // 开启文本
                        choose: function(value){
                            selectedRating = value;
                            console.log(value);
                        }
                    });

                    layui.form.on('submit(submitComment)', function (formData) {
                        var rating = selectedRating
                        console.log("Rating:", rating);
                        $.post("addComment", {
                            oID: data.oID,
                            uID: ${sessionScope.loginUser.uID},
                            cID: data.cID,
                            rating: rating,
                            commentContent: formData.field.comment
                        }, function (response) {
                            if (response === "OK") {
                                reloadTable();
                                layer.msg("评论成功");
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

        // 监听工具条事件
        table.on('tool(order)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;

            if (layEvent === 'delete') {
                deleteOrder(data, obj);
            } else if (layEvent === 'repair') {
                openRepairForm(data);
            } else if (layEvent === 'cancel') {
                cancelRepairOrder(data, obj);
            } else if (layEvent === 'return') {
                openReturnForm(data, obj);
            } else if (layEvent === 'comment') {
                addComment(data, obj);
            }
        });
    });
</script>

<script type="text/html" id="tools">
    {{# if(d.orderStatus == 3) { }}
    <a class="layui-btn layui-btn-xs layui-btn-container" lay-event="return">归还</a>
    {{# } }}

    {{# if(d.orderStatus == 3) { }}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="repair">保养/维修</a>
    {{# } }}

    {{# if(d.orderStatus > 0 && d.orderStatus < 2) { }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">取消订单</a>
    {{# } }}

    {{# if(d.orderStatus == 2 || d.orderStatus == 5) { }}
    <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-disabled" disabled>请联系客服取消配送</a>
    {{# } }}

    {{# if(d.orderStatus == 4) { }}
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="cancel">取消保养/维修</a>
    {{# } }}

    {{# if(d.orderStatus == 0 && d.commentStatus == 0) { }}
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="comment">评论</a>
    {{# } }}

    {{# if(d.orderStatus == 0 && d.commentStatus == 1) { }}
    <a class="layui-btn layui-btn-xs layui-btn-danger layui-btn-disabled"
       disabled>已评论</a>
    {{# } }}
</script>
</body>
</html>
