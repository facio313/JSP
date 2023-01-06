package kr.or.ddit.postgre;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TrialPostgre {
	
	public void empShow() throws SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/python", "postgres", "python"); 
		Statement statement = connection.createStatement();
		String sql = "SELECT * FROM EMP";
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			String eId = resultSet.getString("e_id");
			String eName = resultSet.getString("e_name");
			String sex = resultSet.getString("sex");
			String addr = resultSet.getString("addr");
			System.out.printf("%s, %s, %s, %s \n", eId, eName, sex, addr); // 출력
		}
		resultSet.close();
		statement.close();
		connection.close();
	}
	
	public static void main(String[] args) throws SQLException {
		TrialPostgre tp = new TrialPostgre();
		tp.empShow();
	}
}
