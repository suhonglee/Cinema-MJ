package com.kcontents.cinemadream.domain;

import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Partner {
	private int no;
	@Min(value=1, message="카테고리를 선택하세요")
	private int category;
	@Size(min=5, max=30,message="제목이 5자 이상 30자 미만이어야 합니다")
	private String title;
	@Size(min=20,max=20000,message="내용은 20자 이상 20000자 미만이어야 합니다")
	private String content;
	private Date time;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Partner [no=").append(no).append(", category=")
				.append(category).append(", title=").append(title)
				.append(", content=").append(content).append(", time=")
				.append(time).append("]");
		return builder.toString();
	}
}
