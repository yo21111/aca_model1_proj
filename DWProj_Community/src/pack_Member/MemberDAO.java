package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import pack_DBCP.DBConnectionMgr;

public class MemberDAO {

	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	private DBConnectionMgr pool = null;
	String sql = "";

	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 우편번호 검색 메서드
	public List<ZipcodeBean> zipcodeRead(String area3) {
		List<ZipcodeBean> vlist = new ArrayList<>();
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();

			sql = "select * from tblzipcode where area3 like '%" + area3 + "%'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ZipcodeBean zBean = new ZipcodeBean();
				zBean.setZipcode(rs.getString(1));
				zBean.setArea1(rs.getString(2));
				zBean.setArea2(rs.getString(3));
				zBean.setArea3(rs.getString(4));
				zBean.setArea4(rs.getString(5));
				vlist.add(zBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}

		return vlist;
	}

	// id 중복확인
	public boolean checkId(String id) {
		int chkRes = 0;

		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();

			sql = "select count(*) from member where uId='" + id + "'";
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				chkRes = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, stmt, rs);
		}

		return chkRes > 0 ? true : false;
	}

	// 회원가입 메서드
	public boolean insertMember(Member bean) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "insert into member (uId, uPw, uName, gender, uEmail, uBirthday,"
					+ "uZipcode, uAddr, uHobby, uJob) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getuId());
			pstmt.setString(2, bean.getuPw());
			pstmt.setString(3, bean.getuName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getuEmail());
			pstmt.setString(6, bean.getuBirthday());
			pstmt.setString(7, bean.getuZipcode());
			pstmt.setString(8, bean.getuAddr());
			String[] hobby = bean.getuHobby();
			char[] hb = { '0', '0', '0', '0', '0' };
			String[] lists = { "인터넷", "여행", "게임", "영화", "운동" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j]))
						hb[j] = '1';
				}
			}
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getuJob());
			if (pstmt.executeUpdate() == 1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt);
		}

		return flag;
	}

	// 로그인 메서드
	public boolean loginMember(String id, String pass) {
		boolean flag = false;

		try {
			conn = pool.getConnection();
			sql = "select uId from member where uId=? and uPw=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn, pstmt, rs);
		}

		return flag;
	}
}
