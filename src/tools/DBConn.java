package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConn {
	Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;
	
	public Connection getConn() throws ClassNotFoundException,SQLException,InstantiationException,IllegalAccessException{
    	String DRIVER="com.mysql.jdbc.Driver";
    	String URL="jdbc:mysql://127.0.0.1:3306/test?user=mysql&password=mysql&useUnicode=true&characterEncoding=utf8";
    	//Class.forName(DRIVER).newInstance();
    	Class.forName(DRIVER);
    	conn=DriverManager.getConnection(URL);
    	
    	return conn;
    }
	  public ResultSet executeQuery(String preparedSql,String[] param){
	    	try{
				pstmt=conn.prepareStatement(preparedSql);
	    		if(param!=null){
	        		for(int i=0;i<param.length;i++){
	        			pstmt.setString(i+1, param[i]);
	        		}
	    		}
	    		rs=pstmt.executeQuery();
	    	}catch (SQLException e){
				e.printStackTrace();
	    	}
	    	return rs;
	    }
    public void closeAll(){
    	if(rs!=null){
    		try{
    			rs.close();
    		}catch (SQLException e){
    			e.printStackTrace();
    		}
    	}
    	if(pstmt!=null){
    		try{
    			pstmt.close();
    		}catch (SQLException e){
    			e.printStackTrace();
    		}
    	}
    	if(conn!=null){
    		try{
    			conn.close();
    		}catch (SQLException e){
    			e.printStackTrace();
    		}
    	}
    }

}
