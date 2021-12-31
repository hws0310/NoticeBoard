package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/notice";
			String dbID = "root";
			String dbPassword = "hws@0310@5858";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt = conn.prepareStatement(SQL);  // 데이터베이스에 삽입
			pstmt.setString(1, userID); // SQL에서 '?' 부분에 userID 대입
			rs = pstmt.executeQuery(); // 실행 
			if(rs.next()) {  // 실행 결과 확인
				if(rs.getString(1).equals(userPassword)) {  // 결과로 나온 비번과 접속할때 입력한 비밀번호 비교
					return 1; // 로그인 성공
				}
				else {
					return 0; // 비밀번호 불일치
				}
			}
			return -1; //없는 아이디 경우
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return -2; // DB 오류시
	}
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;  
	}
}
