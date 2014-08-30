<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>价格预测</title>
    <script src="./js/esl.js"></script>
     <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
     <script type="text/javascript" src="./asset/js/jquery.min.js"></script>
     <script type="text/javascript" src="./asset/js/menu-js.js"></script>
</head>

<body>
     <div id="main"></div>  
     <%
    JSONTest jsTest=new JSONTest();
    //double [] temp =jsTest.SelectPrice();
    %>
    
    <script type="text/javascript">
    require.config({
        paths:{ 
            echarts:'./js/echarts',
            'echarts/chart/bar' : './js/echarts-map',
            'echarts/chart/line': './js/echarts-map',
            'echarts/chart/map' : './js/echarts-map'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
          
        ],
        function (ec) {
            //--- 折柱 ---
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption({
            	 title : {
         	        text:  '<% String[] picked = request.getParameterValues("colname"); if(picked==null) {out.print("大白菜");}else{out.print(new String(picked[0].getBytes("ISO-8859-1"),"utf-8"));} %>未来价格预测',
         	        subtext: '源数据来自潍坊物价网'
         	    },
         	    tooltip : {
         	        trigger: 'axis'
         	    },
         	    legend: {
         	        data:['预测价格','实际价格']
         	    },
            toolbox: {
                show : true,
                x:'right',
                feature : {
                    mark : {show: true},
                    dataZoom : {show: true},
                    dataView : {show: true},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            dataZoom : {
                show : true,
                realtime : true,
                start : 90,
                end : 100
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : <%=jsTest.Arraylistjson(jsTest.SelectCabDate())%>
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
    	                formatter: '{value} ￥'
    	            },
    	            precision:2,
    	            
                }
            ],
           
            series : [
          	        {
          	            name:'预测价格',
          	            type:'line',
          	            data:<%=jsTest.Arraylistjson(jsTest.SelectCabPrePrice("prediction"))%>,
          	            markPoint : {
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
          	                data : [
          	                    {type : 'average', name: '平均值'}
          	                ]
          	            }
          	        },
          	        {
          	            name:'实际价格',
          	            type:'line',
          	            data:<%=jsTest.Arraylistjson(jsTest.SelectCabPrePrice("本期价格"))%>,
          	            markPoint : {
        	                data : [
        	                    {type : 'max', name: '最大值'},
        	                    {type : 'min', name: '最小值'}
        	                ]
        	            },
          	            markLine : {
          	                data : [
          	                    {type : 'average', name : '平均值'}
          	                ]
          	            }
          	        }
          	    ]
            	
            });
            
         
        }
    );
    </script>
</body>
</html>