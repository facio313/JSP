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
			
			// 숫자들 -> pooling! 하드코딩 되어 있는 것...안 좋음
			bds.setInitialSize(Integer.parseInt(dbInfo.getProperty("initialSize"))); // connection 처음에 5개
			bds.setMaxIdle(Integer.parseInt(dbInfo.getProperty("maxIdle"))); // 놀고 있는 애들 죽임. initialsize와 maxidle은 똑같아야 함
			
			bds.setMaxTotal(Integer.parseInt(dbInfo.getProperty("maxTotal"))); // connection 5개 다 나눠주다보니까 바닥남... 6번째 요구자에게 새로 주기에는 반납된 게 하나도 없음.. 그때 여유분을 만듬! 그래서 6번째한테도 줌. 그러다 반납 들어오면 다시 고대로 씀
			// 근데 반납이 안 들어오면 여유분으로 5개밖에 못 만드는데 11번째 손님이 오면?
			bds.setMaxWaitMillis(Long.parseLong(dbInfo.getProperty("maxWiat"))); // 그때 2초동안은 기다려라, 그때 반납된 게 있으면 그걸 써라. 만약 없으면 sqlException
			
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
