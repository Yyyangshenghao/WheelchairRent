<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5">
    <title>用户年龄段统计条形图</title>
    <script src="/static/js/chart.js"></script>
</head>
<body>
<h2>用户年龄段统计</h2>
<canvas id="ageGroupBarChart"></canvas>

<script>
    // 从后端获取年龄段统计数据
    fetch('/ageGroupCount')
        .then(response => response.text())
        .then(data => {
            console.log(data);

            // 提取年龄段和数量
            const ageGroups = data.split('\n').filter(line => line.trim() !== '');
            const formattedLabels = [];
            const counts = [];

            ageGroups.forEach(group => {
                const [ageGroup, count] = group.split(': ');
                // 格式化标签，添加“岁”字
                formattedLabels.push(ageGroup + '岁');
                counts.push(parseInt(count));
            });

            // 输出调试信息
            console.log("年龄段: ", formattedLabels);
            console.log("数量: ", counts);

            // 使用 Chart.js 生成条形图
            const ctx = document.getElementById('ageGroupBarChart').getContext('2d');
            const ageGroupBarChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: formattedLabels,
                    datasets: [{
                        label: '用户数量',
                        data: counts,
                        backgroundColor: '#36A2EB',
                        hoverOffset: 4
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            // 设置 y 轴为整数类型
                            ticks: {
                                callback: function (value, index, values) {
                                    return Math.floor(value);
                                },
                                stepSize: 1 // 设置刻度步长为 1
                            }
                        }
                    },
                    animation: {
                        animateScale: true,
                        animateRotate: true
                    }
                }
            });
        })
        .catch(error => console.error('获取年龄段统计时出错:', error));
</script>
</body>
</html>
