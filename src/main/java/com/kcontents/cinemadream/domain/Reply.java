package com.kcontents.cinemadream.domain;


import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Reply {
	private int no;
	@Min(value=1, message="게시글 번호가 필요합니다")
	private int bbsNo;
	@NotNull(message="작성자명을 입력하세요")
	@Size(min=2,max=10,message="작성자명은 2자이상 10자미만이어야 합니다")
	private String id;
	@NotNull(message="비밀번호를 입력하세요")
	@Size(min=4,max=50,message="비밀번호는 4자이상 50자미만이어야 합니다")
	private String password;
	@NotNull(message="내용을 입력하세요")
	@Size(min=10,max=1000,message="내용은 10자이상 1000자미만이어야 합니다")
	private String content;
	private Date time;
	
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
	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Reply [no=").append(no).append(", bbsNo=")
				.append(bbsNo).append(", id=").append(id).append(", password=")
				.append(password).append(", content=").append(content)
				.append(", time=").append(time).append("]");
		return builder.toString();
	}
	
}
