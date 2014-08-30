<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!--Step:1 Import a module loader, such as esl.js or require.js-->
    <script src="./js/esl.js"></script>
    <script src="./js/tab2.js"></script>
    <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript"> 
    var tabcount = new Array("2","8");
    </script>    
</head>

<body>
<%
    JSONTest jsTest=new JSONTest();
    //double [] temp =jsTest.SelectPrice();   
    String tdate="2014-08-05";
    String tdate2="2014-08-05";
    %>
   
   <div id ="form">


  <%
//  String[] picked = request.getParameterValues("colname");
 
 // String[] a=new String[20];
//  if (picked != null) {
 //     for (int i = 0;i < picked.length; i++)     	 
//        out.println("  "+new String(picked[i].getBytes("ISO-8859-1"),"utf-8"));
 // } else {
 //       out.println ("none");
//  } 
%>


  </div>
    <script type="text/javascript">
    // Step:3 conifg ECharts's path, link to echarts.js from current page.
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
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
            var r=document.getElementsByName("colname");
            myChart.setOption({
            	title : {
                text:  '<%String[]  date =request.getParameterValues("date"); if(date!=null){tdate=date[0];out.print(date[0]); }%>超市价格信息',
              // subtext: '+r+'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['佳乐家福寿店','万家福北宫店','大润发潍一广场店','新华路佳乐家']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['精瘦肉','五花肉','排骨','鲜牛肉','鲜羊肉','鸡蛋','芹菜','大白菜','油菜','黄瓜','白萝卜','胡萝卜','青萝卜','茄子','西红柿','土豆','青辣椒','卷心菜','芸豆','蒜苔']
                    // data:<%=jsTest.stringArray(jsTest.Selectname(tdate))%>
                 }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'佳乐家福寿店',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate,"佳乐家福寿店价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                  
                },
                {
                    name:'万家福北宫店',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate,"万家福北宫店价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                   
                },
                {
                    name:'大润发潍一广场店',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate,"大润发潍一广场店价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                    
                },
                {
                    name:'新华路佳乐家',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate,"新华路佳乐家价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
            });
            
         
        }
    );
    </script>
       <script type="text/javascript">
    // Step:3 conifg ECharts's path, link to echarts.js from current page.
    // Step:3 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需图表路径
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
            var myChart = ec.init(document.getElementById('main2'));
            
            myChart.setOption({
            	title : {
                text:  '<%String[]  date2 =request.getParameterValues("date"); if(date2!=null){tdate2=date2[0];out.print(date2[0]); }%>集市价格信息',
              // subtext: '+r+'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['南下河市场','南门农贸市场','凤凰商贸城']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['精瘦肉','五花肉','排骨','鲜牛肉','鲜羊肉','鸡蛋','芹菜','大白菜','油菜','黄瓜','白萝卜','胡萝卜','青萝卜','茄子','西红柿','土豆','青辣椒','卷心菜','芸豆','蒜苔']
                    // data:<%=jsTest.stringArray(jsTest.Selectname(tdate2))%>
                 }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'南下河市场',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate2,"南下河市场价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                  
                },
                {
                    name:'南门农贸市场',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate2,"南门农贸市场价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                   
                },
                {
                    name:'凤凰商贸城',
                    type:'bar',
                    data:<%=jsTest.testArray(jsTest.SelectAllPrice(tdate2,"凤凰商贸城价格"))%>,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                    
                }
            ]
            });
            
         
        }
    );
    </script>
    <div class="menu">
<ul>
<li><a href="#" onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');"   title="" id="tablink1">超市各商品价格对比</a></li>
<li><a href="#" onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');"   title="" id="tablink2">集市各商品价格对比 </a></li>
</ul>
</div>
<!--Start Tabcontent 1 -->
<div id="tabcontent1">
  <div id="main"></div>
</div>

<!--End Tabcontent 1-->

<!--Start Tabcontent 2-->
<div id="tabcontent2">
 <div id="main2"></div>
</div>
<!--End Tabcontent 2-->
</body>
</html>