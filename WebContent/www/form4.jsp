<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>价格预测</title>
</head>
  <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
   <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="./js/zebra_datepicker.js"></script>
    <script type="text/javascript" src="./js/core.js"></script>    
     <script type="text/javascript" src="./asset/js/menu-js.js"></script>
 <!-- <script type="text/javascript" src="./asset/js/jquery.min.js"></script> -->
<body>
<div id ="select" ><div id="header">
<div id="nav" class="nav">
<ul>
  <li id="mainlevel_01" class="first-crl mainlevel">
  <a class="nav-a"   href="./index.html">首页</a> 
  </li>
  <li id="mainlevel_02" class="mainlevel">
  <a class="nav-a">价格分析</a> 
  <div id="sub_02">
  <ol>
    <li><a href="./datazoom1.jsp" target="_blank">价格走势</a></li>
    <li><a href="./form.jsp" target="_blank">价格对比</a></li>
    <li><a href="./map2.jsp" target="_blank">全国商品价格</a></li>
    </ol><span class="nav-img"><img src="./img/pic5_2.png"/> </span></div></li>
  <li id="mainlevel_03" class="mainlevel">
  <a class="nav-a">居民价格消费指数</a> 
  <div id="sub_03">
  <ol>
    <li><a href="./form2.jsp" target="_blank">同比环比</a></li>
    <li><a href="./pie7.jsp" target="_blank">CPI比例</a></li>
    <li><a href="./map13.jsp">各省月度CPI</a></li>
    </ol><span class="nav-img"><img src="./img/pic6.png"/> </span></div></li>
  <li id="mainlevel_04" class="mainlevel">
  <a class="nav-a" href="./form3.jsp" target="_blank">商品流通情况</a> </li>
  <li id="mainlevel_05" class="mainlevel">
  <a class="nav-a" href="./map9.jsp" target="_blank">各农作物产地</a> </li>
  <li id="mainlevel_07" class="mainlevel">
  <a class="nav-a" href="./form4.jsp" target="_blank">价格预测</a> </li>
   <li id="mainlevel_08" class="end-crl mainlevel">
   <a class="nav-a" href="#">关于更多</a> </li>
  </ul></div>
  </div><!-- end of the header --></div>

<%
    JSONTest jsTest=new JSONTest();
   // double [] temp =jsTest.SelectPrice();
    %>

<!-- 价格预警 -->
<div class="menu">
<ul>
<li><a href="#"  title="" id="anotherlink1">价格预警</a></li>
</ul>
</div>
<div id="anothercontent1" >
 <form method="post" action ="">
 <b>请选择地域：</b>&nbsp;&nbsp;
  <input type="radio"  name="colname" checked value="佳乐家福寿店"/>佳乐家福寿店
   <input type="radio"  name="colname"  value="大润发潍一广场店"/>大润发潍一广场店
    <input type="radio"  name="colname"  value="凤凰商贸城"/>凤凰商贸城
     <input type="radio"  name="colname"  value="南门农贸市场"/>南门农贸市场
      <input type="radio"  name="colname"  value="南下河市场"/> 南下河市场
      <input type="radio"  name="colname"  value="万家福北宫店"/> 万家福北宫店
      <input type="radio"  name="colname"  value="新华路佳乐家"/> 新华路佳乐家
  <input type="submit" name="button">
  </form>
<center>
<h3>(每小时更新数据)</h3>
<table border=0 class="yujing">
<tr><td colspan="5" align="center"><img alt="" src="./img/yujing.png"></td></tr>
<tr id="titlet"><td width="200px">商品名称</td><td>上周平均价格</td><td>最新价格</td><td>涨跌</td><td>地域</td></tr>
<%  List<Goods> list=jsTest.Yujing(); 
    for(int i=0;i<list.size();i++){
    	Goods goods=list.get(i);
    	out.print("<tr>");
    	out.print("<td>"+goods.getGoodsname()+"</td>");
    	out.print("<td>"+goods.getLstavgprice()+"</td>");
    	out.print("<td>"+goods.getCurrprice()+"</td>");
    	float index=goods.getCurrprice()-goods.getLstavgprice();
    	BigDecimal b=new BigDecimal(index);
    	index=b.setScale(2,BigDecimal.ROUND_HALF_UP).floatValue();
    	if(index<0){
    		if(index < -0.5){   			
    			out.print("<td><img src='./img/arrow_down_r.png'>"+index+"</td>");	
    		}else{
    			out.print("<td><img src='./img/arrow_down.png'>"+index+"</td>");
    		}    			
    	}else if(index>0){
    		if(index>=0.5){   			
    			out.print("<td><img src='./img/arrow_top_r.png'>"+index+"</td>");	
    		}else{
    		    out.print("<td><img src='./img/arrow_top.png'>"+index+"</td>");
    		}
    	}else{    		
    		out.print("<td><img src='./img/action_remove.png'>"+index+"</td>");
    	}   	
    	out.print("<td>"+goods.getPlaceString()+"</td>");
    	out.print("</tr>");
    	
    }

%>

</table>
</center>
<br><br>
</div>
<!-- 价格预测 -->
<div class="menu">
<ul>
<li><a href="#"  title="" id="anotherlink1">价格预测</a></li>
</ul>
</div>
<div id="anothercontent1" style="height: 550px">
<br>
 <form method="post" action ="predict.jsp" target="id_iframe">
    <%for(int k=0;k<jsTest.SelectGoodsname().length;k++) {
    if(k==0){%>
     <input type="radio"  name="colname" checked value="<%=jsTest.SelectGoodsname()[k]%>">
      <%=jsTest.SelectGoodsname()[k]%>
     <%}else{%>
       <input type="radio"  name="colname" value="<%=jsTest.SelectGoodsname()[k]%>"> 
  <%=jsTest.SelectGoodsname()[k]%>
  <%}}%>
  <input type="submit" name="button">
  </form>
            
 <br/>    
 
 <iframe frameborder="no" id="id_iframe" name="id_iframe" src="predict.jsp" width="100%" height="520px"></iframe> 
</div>
 
<div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
</body>

</html>