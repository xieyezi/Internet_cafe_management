package DAO;

import java.sql.*;

/* 数据库连接 */

public class ConnectionHelper {
	private String driver = "com.mysql.jdbc.Driver"; //驱动路径
	private String con_url="jdbc:mysql://localhost:3306/wangba?&characterEncoding=UTF-8"; //连接url , 包含用户名和密码
	private String name="root";
	private String password="suyechun";
	
	private Connection connection; //连接
	
	public ConnectionHelper() {
		checkAndInit();
	}
	
	/* 检查并初始化 */
	public void checkAndInit() {
		if(connection==null) {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.out.println("[初始化] 未找到driver驱动程序");
			}
			
			try {
				connection = DriverManager.getConnection(con_url,name,password);
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("[初始化] 数据库连接获取失败!");
			}
		}
	}
	

	/* 发送无意义sql语句,用于保持连接不会失效 */
	public void sendInvalidSQl() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from collect where name=?;");
			ps.setString(1, "admin");
			ResultSet resultSet =  ps.executeQuery();
			resultSet.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("[空闲重连] 获取PreparedStatement失败!");
		}
		
	}
	
	/* 获取连接
	 * 获取失败时,抛出异常 */
	public PreparedStatement getPreparedStatement(String sql) throws Exception {
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement(sql);
			return ps;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new Exception("[编译sql] 获取 PreparedStatement 失败!");
		}
	}
	
	/* 关闭PreparedStatement */
	public void closePreparedStatement(PreparedStatement preparedStatement) {
		if(preparedStatement!=null)
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	/* 关闭ResultSet */
	public void closeResultSet(ResultSet resultSet) {
		if(resultSet!=null)
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	/* 关闭连接 */
	public void closeConnection() {
		try {
			if(connection!=null)
				connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* 关闭ResultSet和PreparedStatement */
	public void close(PreparedStatement preparedStatement, ResultSet resultSet) {
		closeResultSet(resultSet);
		closePreparedStatement(preparedStatement);
	}

	/* 关闭ResultSet和PreparedStatement和Connection */
	public void closeAll(PreparedStatement preparedStatement, ResultSet resultSet) {
		closeResultSet(resultSet);
		closePreparedStatement(preparedStatement);
		closeConnection();
	}
}
