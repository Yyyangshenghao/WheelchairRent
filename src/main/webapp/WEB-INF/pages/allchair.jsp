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
    <!-- 搜索框和筛选框 -->
    <form class="layui-form" lay-filter="searchForm" style="margin-bottom: 20px;">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">轮椅编号</label>
                <div class="layui-input-inline">
                    <input type="text" name="chairNo" placeholder="请输入轮椅编号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">轮椅状态</label>
                <div class="layui-input-inline">
                    <select name="status" lay-filter="status">
                        <option value="">请选择状态</option>
                        <option value="0">可用</option>
                        <option value="1">租赁中</option>
                        <option value="2">报废</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="search">搜索</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
    <table id="allChair" lay-filter="chair"></table>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','table'],function () {
        var element = layui.element,
            $ = layui.jquery,
            table = layui.table,
            form = layui.form;

        form.on('submit(search)', function(data) {
            var field = data.field; // 获取表单字段值
            // 将空字符串的状态转换为 null
            field.status = field.status === '' ? null : field.status;
            // 重新加载表格数据，加入搜索条件
            table.reload('allChair', {
                where: field, // 搜索条件
                page: { curr : 1 } // 重新从第1页开始
            })
            return false; // 阻止表单默认提交
        });

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
        });
    })
</script>
<script type="text/html" id="tools">

</script>
</body>
</html>