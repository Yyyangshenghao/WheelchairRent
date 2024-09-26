<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5">
    <title>性别比例饼图</title>
    <script src="/static/js/chart.js"></script>
</head>
<body>
<h2>用户性别比例</h2>
<canvas id="genderPieChart"></canvas>

<script>
    // 从后端获取性别统计数据
    fetch('/genderCount')
        .then(response => response.text())
        .then(data => {
            console.log(data);

            // 提取男性和女性的数量
            const maleCount = parseInt(data.match(/Male: (\d+)/)[1]);
            const femaleCount = parseInt(data.match(/Female: (\d+)/)[1]);

            // 输出调试信息
            console.log("男性数量: " + maleCount);
            console.log("女性数量: " + femaleCount);

            // 使用 Chart.js 生成饼图
            const ctx = document.getElementById('genderPieChart').getContext('2d');
            const genderPieChart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['男性', '女性'],
                    datasets: [
                        {
                            label: '占比',
                            data: [
                                maleCount / (maleCount + femaleCount),
                                femaleCount / (maleCount + femaleCount)
                            ],
                            backgroundColor: ['#36A2EB', '#FF6384'],
                            hoverOffset: 4
                        }]
                },
                options: {
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    }
                }
            });
        })
        .catch(error => console.error('获取性别统计时出错:', error));
</script>
</body>
</html>
