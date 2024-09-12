<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我发布的租房信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">我发布的租房信息</legend>
    </fieldset>
    <table id="wheelchairList" lay-filter="wheelchair"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['element','table','util'], function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            util = layui.util;

        var dt = table.render({
            elem:"#wheelchairList",
            url:"/findUserWheelchair",
            page:true,
            cols:[[
                {field: 'hID', title: '序号', align: 'center'},
                {field: 'publishTime', title: '发布时间', align: 'center', templet:function(d){return util.toDateString(d.publishTime)}},
                {field: 'publisher', title: '发布人', align: 'center'},
                {field: 'wheelchairDesc', title: '描述', align: 'center'},
                {field: 'wheelchairModel', title: '类型', align: 'center'},
                {field: 'wheelchairArea', title: '面积', align: 'center'},
                {field: 'wheelchairFloor', title: '楼层', align: 'center'},
                {field: 'wheelchairType', title: '出租方式', align: 'center'},
                {field: 'wheelchairPrice', title: '出租价格', align: 'center'},
                {field: 'wheelchairAddress', title: '地址', align: 'center'},
                {field: 'communityName', title: '小区名字', align: 'center'},
                {field: 'wheelchairLinkMan', title: '联系电话', align: 'center'},
                {field: 'wheelchairOriented', title: '房屋朝向', align: 'center'},
                {title: '操作', align: 'center',toolbar:"#tools",width:190}
            ]],
        });
        
        table.on('tool(wheelchair)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;
            
            if(layEvent === "view"){
            	window.open("toIndexPage");
            }
            if(layEvent ==="edit"){
            	window.location.href="toUpdateWheelchairPage?hID="+data.hID;
            }
            if(layEvent === 'delete'){
            	console.log(data.oID)
                layer.confirm('确认删除当前数据吗？',{icon:5,shade:0.1},function(index){
                    $.post("deleteUserWheelchair",{hID:data.hID},function(success){
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
    });
</script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="view">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
</script>

</body>
</html>