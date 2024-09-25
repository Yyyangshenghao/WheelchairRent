<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有单个轮椅信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="layui-fluid" style="margin-top: 40px;">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">单个轮椅信息</legend>
    </fieldset>
    <table id="allChair" lay-filter="chair"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','table'],function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table;

       var dt = table.render({
            elem:"#allChair",
            url:"findAllChair",
            page:true,
            limit:10,
            cols:[[
                {field: 'cID', title: '轮椅id', align: 'center'}
                ,{field: 'hID', title: '轮椅品类id', align: 'center'}
                ,{field: 'chairNo', title: '轮椅编号', align: 'center'}
                ,{field: 'status', title: '轮椅状态', align: 'center',
                    templet: function(d) {
                        switch (d.status) {
                            case 0:
                                return '可用';
                            case 1:
                                return '租赁中';
                            case 2:
                                return '维修/保养中';
                            case 3:
                                return '报废';
                            default:
                                return '未知状态';
                        }
                    }
                }
                ,{field: 'uID', title: '所属用户id', align: 'center'}
                ,{field: 'lastMaintenanceDate', title: '上次维修/保养时间', align: 'center',
                    templet: function(d) {
                        return d.lastMaintenanceDate ? layui.util.toDateString(d.lastMaintenanceDate, 'yyyy-MM-dd') : '无';
                    }}
                ,{title: '操作', align: 'center', toolbar: "#tools"}
            ]]
        });

        table.on('tool(chair)',function(obj){
            var data = obj.data;
            var layEvent = obj.event;
            var tr = obj.tr;
            var currPage = dt.config.page.curr;
            
            // if(layEvent === 'delete'){
            // 	console.log(data.hID)
            //     layer.confirm('确认删除当前数据吗？',{icon:5,shade:0.1},function(index){
            //         $.post("deleteWheelchair",{hID:data.hID},function(success){
            //         	if(success == "OK"){
            //         		obj.del();
            //         		dt.reload({
            //         			page:{curr:1}
            //         		});
            //         		layer.msg("删除成功");
            //         	}
            //         })
            //     });
            // }
        });
    })
</script>
<script type="text/html" id="tools">
<%--    <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>--%>
</script>
</body>
</html>