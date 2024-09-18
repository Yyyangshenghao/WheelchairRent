<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改轮椅信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">
</head>
<body>
<div class="wrapper" style="width: 900px;margin-top: 40px">
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="font-size: 26px">修改我发布的轮椅信息</legend>
    </fieldset>
    <form id="updateWheelchair" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">轮椅详情</label>
            <div class="layui-input-block">
            	<input type="hidden" value="${Wheelchair.hID}" name="hID">
                <textarea name="wheelchairDesc" placeholder="请输入内容" class="layui-textarea" required lay-verify="required" >${Wheelchair.wheelchairDesc }</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">特点</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairModel" required lay-verify="required" placeholder="尽量简短"
                       autocomplete="off" value="${Wheelchair.wheelchairModel }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">续航</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairArea" required lay-verify="required" placeholder="单位km"
                       autocomplete="off" value="${Wheelchair.wheelchairArea }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">型号</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairFloor" required lay-verify="required" placeholder=""
                       autocomplete="off" value="${Wheelchair.wheelchairFloor }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总数量</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairType" required lay-verify="required" placeholder=""
                       autocomplete="off" value="${Wheelchair.wheelchairType }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发货地址</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairAddress" required lay-verify="required" placeholder=""
                       autocomplete="off" value="${Wheelchair.wheelchairAddress }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">品牌名称</label>
            <div class="layui-input-block">
                <input type="text" name="communityName" required lay-verify="required" placeholder=""
                       autocomplete="off" value="${Wheelchair.communityName }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">租赁价格</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairPrice" required lay-verify="required|number" placeholder="每日价格"
                       autocomplete="off" value="${Wheelchair.wheelchairPrice }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairLinkMan" required lay-verify="required|phone" placeholder=""
                       autocomplete="off" value="${Wheelchair.wheelchairLinkMan }" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重量</label>
            <div class="layui-input-block">
                <input type="text" name="wheelchairOriented" required lay-verify="required" placeholder="单位kg"
                       autocomplete="off" value="${Wheelchair.wheelchairOriented }" class="layui-input">
            </div>
        </div>
        
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateWheelchair" id="updateWheelchair-btn">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    layui.use(['element','form','layer'],function () {
        var element = layui.element,
            form = layui.form ,
            layer = layui.layer,
            $ = layui.jquery;
        
        form.on("submit(updateWheelchair)",function(){
        	$.post("updateWheelchair",$("#updateWheelchair").serialize(),function(res){
               $("#updateWheelchair")[0].reset();
        		if(res=="OK"){
        			 layer.msg("修改成功！",{time:400,end:function(){window.history.back(-1);}});
        		}
        	})
        	return false;
        })
    });
</script>
</body>
</html>
