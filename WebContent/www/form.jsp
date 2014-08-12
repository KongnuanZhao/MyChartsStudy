<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@page import="tools.*"%>
<%@page import="net.sf.json.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
  <link href="./css/page.css" rel="stylesheet" type="text/css"/> 
  <link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="./js/jquery-1.11.1.js"></script>
        <script type="text/javascript" src="./js/zebra_datepicker.js"></script>
        <script type="text/javascript" src="./js/core.js"></script>
 
<body>
<div id ="select" ><div id ="smenu">
	<ul>
    	<li><a href="./index.html" target="_blank">首页</a></li>
        <li><a href="./datazoom1.jsp" target="_blank">价格走势</a></li>
        <li><a href="./form.jsp" target="_blank">价格对比</a></li>
        <li><a href="./pie7.jsp" target="_blank">CPI比例</a></li>
        <li><a href="./map2.jsp" target="_blank">全国商品价格</a></li>
        <li><a href="./form2.jsp" target="_blank">居民消费指数</a></li>
        <li><a href="./map11.jsp" target="_blank">商品进出口</a></li>
        <li><a href="./map9.jsp" target="_blank">各农作物产地</a></li>
        <li><a href="#" target="_blank">价格预测</a></li>
    </ul>
</div></div>

<%
    JSONTest jsTest=new JSONTest();
   // double [] temp =jsTest.SelectPrice();
    %>

<form action="bar1.jsp" method="post" target="id_iframe">            
请选择日期： <input id="datepicker-example1" type="text" name="date" >
 <input type="submit" name="button">
</form>
            
 <br/>    
 <iframe id="id_iframe" name="id_iframe" src="bar1.jsp" width="100%" height="520px"></iframe> 


<div id ="bottom" style="text-align:right"><a href="./index.html"><img src="img/图标2.png" title="返回首页"></img></a></div>
</body>
</html>