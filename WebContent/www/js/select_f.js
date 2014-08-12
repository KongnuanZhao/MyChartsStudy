/**
 * 这里是一个联动函数
 */
/*
 * 这里是针对潍坊物价局的
var select1_len = document.frm.s1.options.length; 
var select2 = new Array(select1_len); 
for (i=0; i<select1_len; i++) 
{ select2[i] = new Array();} 
select2[0][0] = new Option("请选择", " "); 

select2[1][0] = new Option("整体", "整体"); 
select2[1][1] = new Option("鲜猪肉", "鲜猪肉"); 
select2[1][2] = new Option("鲜羊肉", "鲜羊肉"); 
select2[1][3] = new Option("排骨", "排骨");
select2[1][4] = new Option("鲜牛肉", "鲜牛肉"); 

select2[2][0] = new Option("整体", "整体");
select2[2][1] = new Option("鸡蛋", "鸡蛋");

select2[3][0] =new Option("整体", "整体");
select2[3][1] = new Option("大白菜", "大白菜"); 
select2[3][2] = new Option("油菜", "油菜"); 
select2[3][3] = new Option("黄瓜", "黄瓜"); 
select2[3][4] = new Option("白萝卜", "白萝卜");
select2[3][5] = new Option("胡萝卜", "胡萝卜");
select2[3][6] = new Option("青萝卜", "青萝卜");
select2[3][7] = new Option("茄子", "茄子");
select2[3][8] = new Option("西红柿", "西红柿");
select2[3][9] = new Option("土豆", "土豆");
select2[3][10] = new Option("青辣椒", "青辣椒");
select2[3][11] = new Option("卷心菜", "卷心菜");
select2[3][12] = new Option("芸豆", "芸豆"); 
select2[3][13] = new Option("蒜苔", "蒜苔"); 
select2[3][14] = new Option("芹菜", "芹菜"); 
function redirec(x) 
{ 
var temp = document.frm.s2; 
for (i=0;i<select2[x].length;i++) 
{ temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);
  
} 
temp.options[0].selected=true; 
} 
*/
//获取一级菜单长度 
var select1_len = document.frm.s1.options.length; 
var select2 = new Array(select1_len); 
//把一级菜单都设为数组 
for (j=0; j<select1_len; j++) 
{ select2[j] = new Array();} 
//定义基本选项 
select2[0][0] = new Option("请选择", " "); 

select2[1][0] = new Option("整体", "整体"); 
select2[1][1] = new Option("粮食类", "粮食类"); 
select2[1][2] = new Option("肉禽及其制品类", "肉禽及其制品类"); 
select2[1][3] = new Option("蛋类", "蛋类");
select2[1][4] = new Option("水产品类", "水产品类"); 
select2[1][5] = new Option("鲜菜类", "鲜菜类"); 
select2[1][6] = new Option("鲜果类", "鲜果类"); 

select2[2][0] = new Option("整体", "整体");
select2[2][1] = new Option("整体", "整体");

select2[3][0] = new Option("整体", "整体");

select2[4][0] = new Option("整体", "整体");
select2[5][0] = new Option("整体", "整体");
select2[6][0] = new Option("整体", "整体");
select2[7][0] = new Option("整体", "整体");
select2[8][0] = new Option("整体", "整体");
//联动函数 
function redirec(x) 
{ 
	
var temp = document.frm.s2; 
temp.length=0;//这一步很重要要清空联动下拉框
for (i=0;i<select2[x].length;i++) 
{ 
	temp.options[i]=new Option(select2[x][i].text,select2[x][i].value);  
} 
temp.options[0].selected=true; 
} 
