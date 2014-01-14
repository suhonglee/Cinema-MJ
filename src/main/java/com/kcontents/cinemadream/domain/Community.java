package com.kcontents.cinemadream.domain;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class Community {
	private int no;
	@Size(min=1,max=50,message="제목은 공백이거나 50자 이상일 수 없습니다")
	private String title;
	private String content;
	private String title_image;
	private String content_image;
	private Date time;
	
	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
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


	public String getTitle_image() {
		return title_image;
	}


	public void setTitle_image(String title_image) {
		this.title_image = title_image;
	}


	public String getContent_image() {
		return content_image;
	}


	public void setContent_image(String content_image) {
		this.content_image = content_image;
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
		builder.append("Community [no=").append(no).append(", title=")
				.append(title).append(", content=").append(content)
				.append(", title_image=").append(title_image)
				.append(", content_image=").append(content_image)
				.append(", time=").append(time).append("]");
		return builder.toString();
	}
	
	
}
