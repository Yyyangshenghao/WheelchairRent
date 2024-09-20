<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有轮椅信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">所有轮椅信息</legend>
    </fieldset>
    <table id="allWheelchair" lay-filter="wheelchair"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','table'],function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table;

       var dt = table.render({
            elem:"#allWheelchair",
            url:"findAllWheelchair",
            page:true,
            cols:[[
                {field: 'hID', title: '编号', align: 'center'}
                ,{field: 'wheelchairDesc', title: '轮椅详情', align: 'center'}
                ,{field: 'wheelchairModel', title: '特点', align: 'center'}
                ,{field: 'wheelchairArea', title: '续航', align: 'center'}
                ,{field: 'wheelchairFloor', title: '型号', align: 'center'}
                ,{field: 'wheelchairType', title: '可用数量', align: 'center'}
                ,{field: 'wheelchairPrice', title: '价格', align: 'center'}
                ,{field: 'wheelchairAddress', title: '发货地址', align: 'center'}
                ,{field: 'wheelchairLinkMan', title: '联系电话', align: 'center'}
                ,{field: 'communityName', title: '品牌名称', align: 'center'}
                ,{field: 'wheelchairOriented', title: '重量', align: 'center'}
                ,{field: 'publisher', title: '发布人', align: 'center'}
                ,{title: '操作', align: 'center',toolbar:"#tools"},
            ]]
        });
        
        table.on('tool(wheelchair)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;
            
            if(layEvent ==="edit"){
            	window.location="toAdminUpdateWheelchairPage?hID="+data.hID;
            }
            
            if(layEvent === 'delete'){
            	console.log(data.hID)
                layer.confirm('确认删除当前数据吗？',{icon:5,shade:0.1},function(index){
                    $.post("deleteWheelchair",{hID:data.hID},function(success){
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
        });
    })
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>
</body>
</html>