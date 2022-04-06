package pack_BBS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pack_DBCP.DBConnectionMgr;
import pack_Member.ZipcodeBean;

public class BoardBBSDao {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public BoardBBSDao() {
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
	
	public List<BoardBBS> selectFreeBBSList(int page, int pageSize) {
		List<BoardBBS> bList = new ArrayList<>();
		try {
			conn = pool.getConnection();
			sql = "select bno, title, writer, write_date, view_cnt from bbsboard where category='freeBBS'"
					+ " ORDER BY bno DESC LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			
			int offset = (page-1) * 10;
			pstmt.setInt(1, offset);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBBS bbs = new BoardBBS(); 
				bbs.setBno(rs.getInt("bno"));
				bbs.setTitle(rs.getString("title"));
				bbs.setWriter(rs.getString("writer"));
				bbs.setWrite_date(rs.getString("write_date"));
				bbs.setView_cnt(rs.getInt("view_cnt"));
				bList.add(bbs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return bList;
	}
}
