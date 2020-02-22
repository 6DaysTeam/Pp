package com.sixdays.maincomment.model.vo;

import java.io.Serializable;

public class MainComment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8335348120932005196L;
	private int pbno;			// 게시글번호
	private int mno;			// 댓글번호
	private String mcontent;	// 댓글내용
	private String status;		// 삭제유무
	private String mwriter;
	private String cproimg;


	public MainComment() {}
	
	public MainComment(int pbno, int mno, String mwriter, String mcontent) {
		super();
		this.pbno = pbno;
		this.mno = mno;
		this.mwriter = mwriter;
		this.mcontent = mcontent;
	}

	
	public MainComment(int pbno, int mno, String mcontent, String status, String mwriter, String cproimg) {
		super();
		this.pbno = pbno;
		this.mno = mno;
		this.mcontent = mcontent;
		this.status = status;
		this.mwriter = mwriter;
		this.cproimg = cproimg;
	}

	public String getMwriter() {
		return mwriter;
	}
	
	public void setMwriter(String mwriter) {
		this.mwriter = mwriter;
	}
	
	public String getCproimg() {
		return cproimg;
	}
	
	public void setCproimg(String cproimg) {
		this.cproimg = cproimg;
	}

	public int getPbno() {
		return pbno;
	}

	public void setPbno(int pbno) {
		this.pbno = pbno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMcontent() {
		return mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MainComment [pbno=" + pbno + ", mno=" + mno + ", mcontent=" + mcontent + ", status=" + status + "]";
	}
	
	
	
	
}
