package com.sixdays.admin.model.vo;

public class Report {
	
	
	private int rownum;			// 글순서
	private String userId;		// id
	private String userName;	// 닉네임(게시글 작성자)
	private String proimg;      // 프로필 이미지
	private String email;		// 이메일
	private String mycomment;  	// 코멘트
	private String status;		//삭제여부
	private String blockflag;	//정지유무
	private String report_yn;	//신고유무
	
	
	public Report() {	}
	
	
	public Report(int rownum, String userId, String userName, String proimg, String email, String mycomment,
			String status, String blockflag, String report_yn) {
		super();
		this.rownum = rownum;
		this.userId = userId;
		this.userName = userName;
		this.proimg = proimg;
		this.email = email;
		this.mycomment = mycomment;
		this.status = status;
		this.blockflag = blockflag;
		this.report_yn = report_yn;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getProimg() {
		return proimg;
	}


	public void setProimg(String proimg) {
		this.proimg = proimg;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMycomment() {
		return mycomment;
	}


	public void setMycomment(String mycomment) {
		this.mycomment = mycomment;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getBlockflag() {
		return blockflag;
	}


	public void setBlockflag(String blockflag) {
		this.blockflag = blockflag;
	}


	public String getReport_yn() {
		return report_yn;
	}


	public void setReport_yn(String report_yn) {
		this.report_yn = report_yn;
	}


	@Override
	public String toString() {
		return "Report [rownum=" + rownum + ", userId=" + userId + ", userName=" + userName + ", proimg=" + proimg
				+ ", email=" + email + ", mycomment=" + mycomment + ", status=" + status + ", blockflag=" + blockflag
				+ ", report_yn=" + report_yn + "]";
	}
	
	
	
	
}
