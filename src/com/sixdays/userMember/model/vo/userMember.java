package com.sixdays.userMember.model.vo;

import java.sql.Date;
/*
 * 작성자 : 박주완
 * 작성일 : 2020-02-06
 * 내용 : 사용자 정보 기본 vo
 */
public class userMember {

	private String userId;
	private String password;
	private String userName;
	private String email;
	private String gender;
	private String phone;
	private String coment;
	private char power;
	private Date enrollDate;
	private char blockCheck;
	private String profileImg;
	private String profileBackImg;
	private char publicLevel;
	
	public userMember() {
		super();
	}
	


	public userMember(String userId, String password, String userName, String email, String gender, String phone,
			String coment) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.gender = gender;
		this.phone = phone;
		this.coment = coment;
	}


	public userMember(String userId, String password, String userName, String email, String phone, String gender,
			String coment, char power, Date enrollDate, char blockCheck, String profileImg, String profileBackImg,
			char publicLevel) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.coment = coment;
		this.power = power;
		this.enrollDate = enrollDate;
		this.blockCheck = blockCheck;
		this.profileImg = profileImg;
		this.profileBackImg = profileBackImg;
		this.publicLevel = publicLevel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public char getPower() {
		return power;
	}

	public void setPower(char power) {
		this.power = power;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public char getBlockCheck() {
		return blockCheck;
	}

	public void setBlockCheck(char blockCheck) {
		this.blockCheck = blockCheck;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getProfileBackImg() {
		return profileBackImg;
	}

	public void setProfileBackImg(String profileBackImg) {
		this.profileBackImg = profileBackImg;
	}

	public char getPublicLevel() {
		return publicLevel;
	}

	public void setPublicLevel(char publicLevel) {
		this.publicLevel = publicLevel;
	}

	@Override
	public String toString() {
		return "userMember [userId=" + userId + ", password=" + password + ", userName=" + userName + ", email=" + email
				+ ", phone=" + phone + ", gender=" + gender + ", coment=" + coment + ", power=" + power
				+ ", enrollDate=" + enrollDate + ", blockCheck=" + blockCheck + ", profileImg=" + profileImg
				+ ", profileBackImg=" + profileBackImg + ", publicLevel=" + publicLevel + "]";
	}

	
	
}
