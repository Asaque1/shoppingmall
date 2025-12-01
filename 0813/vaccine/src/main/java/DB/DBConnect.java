package DB;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnect{
	public static Connection getConnection() {
		Connection conn = null;//연결용 Connection 변수 null 선언
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//연결 드라이버 주소
		String id = "system"; //계정 id
		String pw = "1234";//계정 비번
		//Window\DataSourceExplorer로 가서 연결된 오라클에 properties\driver properties
		//여기서 데이터들 얻기
		
		try {//실패 대비용 예외처리
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url,id,pw);
			System.out.println("db connected");
			
		}catch(Exception e) {e.printStackTrace();}
		return conn;
		
	}
}