package com.sixdays.p_board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Photoes implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2344124953996877679L;
	
	    private String userId;		//유저아이디
	    private int p_bno;			//사진게시판 번호
	    private String p_filepath1;	//사진 1~10개  우선 한개 게시 
	    private String p_filepath2;
	    private String p_filepath3;
	    private String p_filepath4;
	    private String p_filepath5;
	    private String p_filepath6;
	    private String p_filepath7;
	    private String p_filepath8;
	    private String p_filepath9;
	    private String p_filepath10;
	    
		public Photoes() {}

		public Photoes(String userId, int p_bno, String p_filepath1, String p_filepath2, String p_filepath3,
				String p_filepath4, String p_filepath5, String p_filepath6, String p_filepath7, String p_filepath8,
				String p_filepath9, String p_filepath10) {
			super();
			this.userId = userId;
			this.p_bno = p_bno;
			this.p_filepath1 = p_filepath1;
			this.p_filepath2 = p_filepath2;
			this.p_filepath3 = p_filepath3;
			this.p_filepath4 = p_filepath4;
			this.p_filepath5 = p_filepath5;
			this.p_filepath6 = p_filepath6;
			this.p_filepath7 = p_filepath7;
			this.p_filepath8 = p_filepath8;
			this.p_filepath9 = p_filepath9;
			this.p_filepath10 = p_filepath10;
		}

		public Photoes(String userId, int p_bno, String p_filepath1, String p_filepath5) {		//일단 1개만 작성하기 
			super();
			this.userId = userId;
			this.p_bno = p_bno;
			this.p_filepath1 = p_filepath1;
			this.p_filepath5 = p_filepath5;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public int getP_bno() {
			return p_bno;
		}

		public void setP_bno(int p_bno) {
			this.p_bno = p_bno;
		}

		public String getP_filepath1() {
			return p_filepath1;
		}

		public void setP_filepath1(String p_filepath1) {
			this.p_filepath1 = p_filepath1;
		}

		public String getP_filepath2() {
			return p_filepath2;
		}

		public void setP_filepath2(String p_filepath2) {
			this.p_filepath2 = p_filepath2;
		}

		public String getP_filepath3() {
			return p_filepath3;
		}

		public void setP_filepath3(String p_filepath3) {
			this.p_filepath3 = p_filepath3;
		}

		public String getP_filepath4() {
			return p_filepath4;
		}

		public void setP_filepath4(String p_filepath4) {
			this.p_filepath4 = p_filepath4;
		}

		public String getP_filepath5() {
			return p_filepath5;
		}

		public void setP_filepath5(String p_filepath5) {
			this.p_filepath5 = p_filepath5;
		}

		public String getP_filepath6() {
			return p_filepath6;
		}

		public void setP_filepath6(String p_filepath6) {
			this.p_filepath6 = p_filepath6;
		}

		public String getP_filepath7() {
			return p_filepath7;
		}

		public void setP_filepath7(String p_filepath7) {
			this.p_filepath7 = p_filepath7;
		}

		public String getP_filepath8() {
			return p_filepath8;
		}

		public void setP_filepath8(String p_filepath8) {
			this.p_filepath8 = p_filepath8;
		}

		public String getP_filepath9() {
			return p_filepath9;
		}

		public void setP_filepath9(String p_filepath9) {
			this.p_filepath9 = p_filepath9;
		}

		public String getP_filepath10() {
			return p_filepath10;
		}

		public void setP_filepath10(String p_filepath10) {
			this.p_filepath10 = p_filepath10;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

		@Override
		public String toString() {
			return "Photoes [userId=" + userId + ", p_bno=" + p_bno + ", p_filepath1=" + p_filepath1 + ", p_filepath2="
					+ p_filepath2 + ", p_filepath3=" + p_filepath3 + ", p_filepath4=" + p_filepath4 + ", p_filepath5="
					+ p_filepath5 + ", p_filepath6=" + p_filepath6 + ", p_filepath7=" + p_filepath7 + ", p_filepath8="
					+ p_filepath8 + ", p_filepath9=" + p_filepath9 + ", p_filepath10=" + p_filepath10 + "]";
		}
	    
		
		
	    
	    
}
