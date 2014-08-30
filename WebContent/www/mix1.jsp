<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="./js/esl.js"></script>
     <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
     
</head>

<body style="text-align:center">
 <%
    JSONTest jsTest=new JSONTest();
    %>
    
<%
String tablename="全国cpi";
String myValue=request.getParameter("s1");
if(myValue==null) myValue="整体";
else myValue=new String(myValue.getBytes("ISO-8859-1"),"utf-8"); 
//out.print(myValue);
String myValue2=request.getParameter("s2");
if(myValue2==null)myValue2=" ";
myValue2=new String(myValue2.getBytes("ISO-8859-1"),"utf-8"); 
//out.print(myValue2);
String temp=null;
if(myValue.endsWith("整体")){
	temp="居民消费价格指数";
}else if(myValue2.endsWith("整体")){
	temp=myValue;	
}else{
	tablename=myValue+"cpi";
	temp=myValue2;
}

%>
     <div id="main"></div>
    
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
            	
                timeline:{
                    data:[
                        '2013-01-01','2014-01-01'
                        
                    ],
                    label : {
                        formatter : function(s) {
                            return s.slice(0, 4);
                        }
                    },
                    autoPlay : false,
                    playInterval : 1000
                },
                
                options : [{
                	title : {
                        text: '2013年<%=myValue%><%=myValue2%>CPI及其涨跌情况',
                        subtext: '数据来自潍坊物价局'
                    },
                	tooltip : {
                        trigger: 'axis',
                       
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar']},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable : true,
                    legend: {
                        data:['CPI指数','环比涨跌指数','同比涨跌指数']
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            name : '指数',
                            min: 50,
                            max: 150,
                            
                            axisLabel : {
                                formatter: '{value} % '
                            }
                        },
                        {
                            type : 'value',
                            name : '涨跌',
                            boundaryGap: [0,0],
                            axisLabel : {
                                formatter: '{value} %'
                            }
                        }
                    ],
                series : [

                    {
                        name:'CPI指数',
                        type:'bar',
                       // data:[2.0, 4.9, 7.0, 23.2, 5.6, 16.7, 13.6, 16.2, 2.6, 2.0, 6.4, 3.3],
                       data:<%=jsTest.testArray(jsTest.SelectCPI(temp,0,"2013",tablename))%>
    
                    },              
                    {
                        name:'环比涨跌指数',
                        type:'line',
                        yAxisIndex: 1,
                        data:[-2.0, 2.9,-4.0, 3.2, 2.6, 1.7, -2.6, 3.2, 2.6, 2.0, 1.4, 3.3]
                    },
                    {
                        name:'同比涨跌指数',
                        type:'line',
                        yAxisIndex: 1,
                        data:<%=jsTest.testArray(jsTest.SelectCPI(temp,100,"2013",tablename))%>
                    }
                ]
                },
              {title : {
                  text: '2014年<%=myValue%><%=myValue2%>CPI及其涨跌情况',
                  subtext: '数据来自潍坊物价局'
              },
                series : [

                          {
                              name:'CPI指数',
                              type:'bar',
                              data:<%=jsTest.testArray(jsTest.SelectCPI(temp,0,"2014",tablename))%>,
          
                          },              
                          {
                              name:'环比涨跌指数',
                              type:'line',
                              yAxisIndex: 1,
                              data:[2.0, 1.9, -1.0, 3.2, 5.6, 3.7, 0.6, -1.2, 2.6, 2.0, 4.4, -0.3]
                          },
                          {
                              name:'同比涨跌指数',
                              type:'line',
                              yAxisIndex: 1,
                              data:<%=jsTest.testArray(jsTest.SelectCPI(temp,100,"2014",tablename))%>
                          }
                      ]
                }
                ]
                
            });
            
         
        }
    );
    </script>
</body>
</html>