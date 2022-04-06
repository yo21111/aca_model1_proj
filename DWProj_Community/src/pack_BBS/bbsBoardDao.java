package pack_BBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import pack_DBCP.DBConnectionMgr;

public class bbsBoardDao {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public bbsBoardDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int freeBBScount() {
		int cnt = 0;
		
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();

			sql = "select count(*) from bbsboard where category='freeBBS'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				cnt = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}
		
		return cnt;
	}
}
