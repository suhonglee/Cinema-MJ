package com.kcontents.cinemadream.domain;

import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Scheduler {
	private int no;
	@Min(value=2000, message="년도를 잘못 입력하셨습니다")
	@Max(value=2050, message="년도를 잘못 입력하셨습니다")
	private int year;
	@Min(value=1, message="월을 잘못 입력하셨습니다")
	@Max(value=12, message="월을 잘못 입력하셨습니다")
	private int month;
	@Min(value=1, message="일을 잘못 입력하셨습니다")
	@Max(value=31, message="일을 잘못 입력하셨습니다")
	private int day;
	private int hour;
	private int minute;
	@Size(min=5, max=30, message="제목이 5자 이상 30자 미만이어야 합니다")
	private String title;
	private String content;
	private boolean cancel;
	private String place;
	private String bride;
	
	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getMonth() {
		return month;
	}


	public void setMonth(int month) {
		this.month = month;
	}


	public int getDay() {
		return day;
	}


	public void setDay(int day) {
		this.day = day;
	}


	public int getHour() {
		return hour;
	}


	public void setHour(int hour) {
		this.hour = hour;
	}


	public int getMinute() {
		return minute;
	}


	public void setMinute(int minute) {
		this.minute = minute;
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

	

	public boolean isCancel() {
		return cancel;
	}


	public void setCancel(boolean cancel) {
		this.cancel = cancel;
	}


	public String getPlace() {
		return place;
	}


	public void setPlace(String place) {
		this.place = place;
	}


	public String getBride() {
		return bride;
	}


	public void setBride(String bride) {
		this.bride = bride;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Scheduler [no=").append(no).append(", year=")
				.append(year).append(", month=").append(month).append(", day=")
				.append(day).append(", hour=").append(hour).append(", minute=")
				.append(minute).append(", title=").append(title)
				.append(", content=").append(content).append(", isCancel=")
				.append(cancel).append(", place=").append(place)
				.append(", bride=").append(bride).append("]");
		return builder.toString();
	}
	
}
