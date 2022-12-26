package kr.or.ddit.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Factory Object[Method] Pattern
 * 	: 필요 객체의 생성을 전담하는 객체를 별도로 운영하는 구조
 *
 */
public class ConnectionFactory {
	private static String url = "";
	private static String user = "";
	private static String password = "";
	
	private static DataSource ds;
	
	static { // application 실행 시 단 한 번 실행됨
		String path = "/kr/or/ddit/db/dbInfo.properties";
		try (
			InputStream is = ConnectionFactory.class.getResourceAsStream(path);
		) {
			Properties dbInfo = new Properties();
			dbInfo.load(is);
			
			url = dbInfo.getProperty("url");
			user = dbInfo.getProperty("user");
			password = dbInfo.getProperty("password");
			
//			Class.forName(dbInfo.getProperty("driverClassName"));
			
			BasicDataSource bds = new BasicDataSource();
			bds.setDriverClassName(dbInfo.getProperty("driverClassName"));
			bds.setUrl(url);
			bds.setUsername(user);
			bds.setPassword(password);
			
			ds = bds;
			
		} catch (Exception e1) {
			throw new RuntimeException(e1);
		}
	}
	
	public static Connection getConnection() throws SQLException {
//		Connection conn = DriverManager.getConnection(url, user, password);
		return ds.getConnection();
	}
}
