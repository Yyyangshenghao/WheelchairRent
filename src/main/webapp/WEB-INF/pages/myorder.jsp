<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    layui.use(['element','form','table','util'],function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
           elem:"#wheelchairList",
           url:"/myOrderInfo",
           page:true,
           limit:10,
           loading:true,
           cols:[[
               {field: 'oID', title: '订单id', align: 'center'}
               ,{field: 'cID', title: '轮椅id', align: 'center'}
               ,{field: 'cName', title: '轮椅品牌', align: 'center'}
               ,{field: 'chairNo', title: '轮椅编号', align: 'center'}
               ,{field: 'uName', title: '租赁人姓名', align: 'center'}
               ,{field: 'uPhone', title: '租赁人电话', align: 'center'}
               ,{field: 'uAddress', title: '租赁人地址', align: 'center'}
               ,{field: 'startDate', title: '租赁开始时间', align: 'center'}
               ,{field: 'endDate', title: '租赁结束时间', align: 'center'}
               ,{field: 'orderStatus', title: '订单状态', align: 'center'}
               ,{title: '操作', align: 'center',toolbar:"#tools"}
            ]],
        });
        
        table.on('tool(order)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;
            
            if(layEvent === 'delete'){
            	console.log(data.oID)
                layer.confirm('确认删除当前数据吗？',{icon:5,shade:0.1},function(index){
                    $.post("deleteOrder",{oID:data.oID},function(success){
                    	if(success == "OK"){
                    		obj.del();
                    		dt.reload({
                    			page:{curr:1}
                    		});
                    		layer.msg("删除成功");
                    	}
                    })
                });
            }
            if(layEvent === 'repair'){
                console.log(data.oID);
                layer.open({
                    type: 1,
                    title: '申请保养/维修',
                    area: ['500px', '400px'], // 弹出层的宽高
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
                    success: function(layero, index){
                        // 重新渲染表单元素
                        layui.form.render();
                        // 监听表单提交
                        layui.form.on('submit(submitRepair)', function(formData){
                            // 提交保养/维修申请
                            $.post("applyRepairOrder", {
                                oID: data.oID,
                                type: formData.field.type,
                                pickupDate: formData.field.pickupDate,
                                address: formData.field.address,
                                phone: formData.field.phone
                            }, function(response){
                                if(response === "OK"){
                                    dt.reload({
                                        page: {curr: 1}
                                    });
                                    layer.msg("申请提交成功");
                                    layer.close(index);  // 关闭弹出层
                                } else {
                                    layer.msg("申请失败，请重试");
                                }
                            });
                            return false;  // 阻止表单跳转
                        });
                    }
                });
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