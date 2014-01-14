package com.kcontents.cinemadream.domain;

import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Consult {
	private int no;
	@Size(min=2,max=20,message="작성자명이 2자 이상 20자 미만이어야 합니다")
	private String writer;
	@Size(min=6,max=20,message="비밀번호가 6자 이상 20자 미만이어야 합니다")
	private String password;
	private String tel;
	@Pattern(regexp="^[_a-zA-Z0-9-]+(.[_a-zA-Z0-9-]+)*@(?:\\w+\\.)+\\w+$",message="이메일이 잘못되었습니다")
	private String email;
	@Size(min=5, max=30,message="제목이 5자 이상 30자 미만이어야 합니다")
	private String title;
	@Size(min=20,max=20000,message="내용은 20자 이상 20000자 미만이어야 합니다")
	private String content;
	private Date time;
	private boolean secret;
	private String wed_day="";
	private String wed_place="";
	private String bride_name="";
	private String bride_tel="";
	private String groom_name="";
	private String groom_tel="";
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	public String getWed_day() {
		return wed_day;
	}
	public void setWed_day(String wed_day) {
		this.wed_day = wed_day;
	}
	public String getWed_place() {
		return wed_place;
	}
	public void setWed_place(String wed_place) {
		this.wed_place = wed_place;
	}
	public String getBride_name() {
		return bride_name;
	}
	public void setBride_name(String bride_name) {
		this.bride_name = bride_name;
	}
	public String getBride_tel() {
		return bride_tel;
	}
	public void setBride_tel(String bride_tel) {
		this.bride_tel = bride_tel;
	}
	public String getGroom_name() {
		return groom_name;
	}
	public void setGroom_name(String groom_name) {
		this.groom_name = groom_name;
	}
	public String getGroom_tel() {
		return groom_tel;
	}
	public void setGroom_tel(String groom_tel) {
		this.groom_tel = groom_tel;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ConsultBbs [no=").append(no).append(", writer=")
				.append(writer).append(", password=").append(password)
				.append(", tel=").append(tel).append(", email=").append(email)
				.append(", title=").append(title).append(", content=")
				.append(content).append(", time=").append(time)
				.append(", secret=").append(secret).append(", wed_day=")
				.append(wed_day).append(", wed_place=").append(wed_place)
				.append(", bride_name=").append(bride_name)
				.append(", bride_tel=").append(bride_tel)
				.append(", groom_name=").append(groom_name)
				.append(", groom_tel=").append(groom_tel).append("]");
		return builder.toString();
	}
	
	
	
}
