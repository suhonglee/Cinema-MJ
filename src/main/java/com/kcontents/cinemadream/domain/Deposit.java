package com.kcontents.cinemadream.domain;

import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Deposit {
	private int no;
	@Size(min=2,max=20,message="작성자명이 2자 이상 20자 미만이어야 합니다")
	private String writer;
	@Size(min=6,max=20,message="비밀번호가 6자 이상 20자 미만이어야 합니다")
	private String password;
	private String tel;
	@Pattern(regexp="^[_a-zA-Z0-9-]+(.[_a-zA-Z0-9-]+)*@(?:\\w+\\.)+\\w+$",message="이메일이 잘못되었습니다")
	private String email;
	private String depositor;
	private String depositBank;
	private String depositMoney;
	@Size(min=5, max=30,message="제목이 5자 이상 30자 미만이어야 합니다")
	private String title;
	@Size(min=20,max=20000,message="내용은 20자 이상 20000자 미만이어야 합니다")
	private String content;
	private Date time;
	private int hit;
	private String ip;
	
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
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDepositBank() {
		return depositBank;
	}
	public void setDepositBank(String depositBank) {
		this.depositBank = depositBank;
	}
	public String getDepositMoney() {
		return depositMoney;
	}
	public void setDepositMoney(String depositMoney) {
		this.depositMoney = depositMoney;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Deposit [no=").append(no).append(", writer=")
				.append(writer).append(", password=").append(password)
				.append(", tel=").append(tel).append(", email=").append(email)
				.append(", depositor=").append(depositor)
				.append(", depositBank=").append(depositBank)
				.append(", depositMoney=").append(depositMoney)
				.append(", title=").append(title).append(", content=")
				.append(content).append(", time=").append(time)
				.append(", hit=").append(hit).append(", ip=").append(ip)
				.append("]");
		return builder.toString();
	}
	
}
