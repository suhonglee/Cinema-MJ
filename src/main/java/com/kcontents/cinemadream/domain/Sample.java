package com.kcontents.cinemadream.domain;

import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Sample {
	private int no;
	@Min(value=1, message="카테고리를 선택하세요")
	private int category;
	@Size(min=1,max=50,message="제목은 공백이거나 50자 이상일 수 없습니다")
	private String title;
	@Size(min=1, message="비디오ID를 입력하세요")
	@Pattern(regexp="^[0-9]*$", message="비디오ID는 숫자만 허용됩니다")
	private String videoId;
	@Size(min=20, max=65000, message="내용은 20자 이상, 65000자 미만이어야 합니다.")
	private String content;
	private Date time;
	private int hit;
	private String thumbnailUrl;
	
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
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
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
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
		builder.append("Sample [no=").append(no).append(", category=")
				.append(category).append(", title=").append(title)
				.append(", videoId=").append(videoId).append(", content=")
				.append(content).append(", time=").append(time)
				.append(", hit=").append(hit).append(", thumbnailUrl=")
				.append(thumbnailUrl).append("]");
		return builder.toString();
	}
}
