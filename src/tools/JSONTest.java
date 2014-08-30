package tools;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import net.sf.json.JSONArray;


public class JSONTest {
	public JSONArray testArray(double [] arr) {
		//double[] arr = { 2.0 , 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3 };
		JSONArray jsonarray = JSONArray.fromObject(arr);
		//System.out.println(jsonarray);
		return jsonarray;
	}
	public JSONArray stringArray(String [] arr){
		JSONArray jsonArray=JSONArray.fromObject(arr);
		//System.out.println(jsonArray);
		return jsonArray;
	}
	public JSONArray Arraylistjson(ArrayList<String> arr){
		JSONArray jsonArray=JSONArray.fromObject(arr);
		System.out.println(jsonArray);
		return jsonArray;
	}
	public JSONArray ArraylistFjson(ArrayList<Float> arr){
		JSONArray jsonArray=JSONArray.fromObject(arr);
		//System.out.println(jsonArray);
		return jsonArray;
	}
	public  ArrayList<String> SelectDate(){
		DBConn dbConn=new DBConn();
		ArrayList<String> dateList =new ArrayList<String>();
		String sql="select datet from price group by datet";
		try {
			dbConn.getConn();
		ResultSet rSet=dbConn.executeQuery(sql,null);
			while(rSet.next()){
				dateList.add(rSet.getString("datet"));
			}
			dbConn.closeAll();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dateList;
		
	}
	public  ArrayList<Float> SelectPrice(String goodsname){
		DBConn dbConn=new DBConn();
		ArrayList<Float> pricelist=new ArrayList<Float>();
		String sql="select avg(goodsprice) from price where goodsname= '"+goodsname+"' group by datet";

		try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql,null);
			
			while(rSet.next()){
				pricelist.add(rSet.getFloat(1));//rSet.getDouble("goodsprice");
				//System.out.println(rSet.getFloat(0));
			}
			dbConn.closeAll();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pricelist;
		
	}
	public  String[] SelectGoodsname(){
		DBConn dbConn=new DBConn();
		String []goodsname = new String[19];
		String sql="select * from price where datet='2014-07-30' and place='万家福北宫店'";

		try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql,null);
			int i=0;
			while(rSet.next()){
				goodsname[i]=rSet.getString("goodsname");
				i++;
			}
			dbConn.closeAll();
			
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsname;
		
	}
    public List<Goods> SelectGoods(){
    	String sql = "Select * from price";
    	DBConn dbConn=new DBConn();
    	List<Goods> list=new ArrayList<Goods>();
    	try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql, null);
			while(rSet.next()){
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
    	
    }
    //8月份测试
    public  String[] Selectname(String string){
		DBConn dbConn=new DBConn();
		String []goodsname = new String[20];
		String sql="select * from sheet9 where 发布日期='"+string+"'";

		try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql,null);
			int i=0;
			while(rSet.next()){
				goodsname[i]=rSet.getString("商品名称").trim();
				i++;
			}
			dbConn.closeAll();
			
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsname;
		
	}
    public  double[] SelectAllPrice(String string,String place){
		DBConn dbConn=new DBConn();
		double []datalist=new double[20];
		String sql="select * from sheet9 where 发布日期='"+string+"'";

		try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql,null);
			int i=0;
			while(rSet.next()){
				datalist[i]=rSet.getDouble(place);
				i++;
			}
			dbConn.closeAll();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return datalist;
		
	}
    //查询CPI
    public double[] SelectCPI(String string,double num,String year,String tablename){
    	DBConn dbConn =new DBConn();
    	double []cpi=new double[12];
    	String sql="select "+string+" from "+tablename+" where 日期  like '"+year+"-%' order by 日期 ";
    	try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql, null);
	    	int i=0;
	    	while (rSet.next()) {
	    		//保留两位小数
	    		BigDecimal  b = new BigDecimal(rSet.getDouble(1)-num);
				cpi[i]= b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();  
				i++;
			}
	    	dbConn.closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return cpi;	
    }
    //查询月度居民消费指数
    public double[] SelectMonthCPI(int n){
    	DBConn dbConn =new DBConn();
    	double []cpi=new double[31];
    	String sql="select * from 月度居民消费指数 ";
    	try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql, null);
	    	int i=0;
	    	while (rSet.next()) {
	    		//保留两位小数
	    		BigDecimal  b = new BigDecimal(rSet.getDouble(n));
				cpi[i]= b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue(); 
				//System.out.print(cpi[i]);
				i++;
			}
	    	dbConn.closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return cpi;	
    }
    //价格预测
    public  ArrayList<String> SelectCabDate(){
		DBConn dbConn=new DBConn();
		ArrayList<String> dateList =new ArrayList<String>();
		String sql="select 采价日期  from pre_cab";
		
		try {
			dbConn.getConn();
		ResultSet rSet=dbConn.executeQuery(sql,null);
			while(rSet.next()){
				dateList.add(rSet.getString("采价日期"));
			}
			dbConn.closeAll();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dateList;
		
	}
    public  ArrayList<String> SelectCabPrePrice(String string){
		DBConn dbConn=new DBConn();
		ArrayList<String> pricelist=new ArrayList<String>();
		String sql="select "+string+" from pre_cab";

		try {
			dbConn.getConn();
			ResultSet rSet=dbConn.executeQuery(sql,null);
			
			while(rSet.next()){
				if(rSet.getFloat(1)==0)
				pricelist.add("-");	
				else
				pricelist.add(rSet.getFloat(1)+"");
			}
			dbConn.closeAll();
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pricelist;
		
	}
    
}
