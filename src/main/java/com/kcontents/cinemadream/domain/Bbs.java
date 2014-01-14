package com.kcontents.cinemadream.domain;

import java.util.List;
import java.util.Map;

public class Bbs {
	private int no;
	private String title;
	private int hobby[];
	private int sex;
	private String password;
	private String Content;
	private List bbsProp;
	private int age;
	private String location;
	private String academicAbility;
	
	public String getAcademicAbility() {
		return academicAbility;
	}
	public void setAcademicAbility(String academicAbility) {
		this.academicAbility = academicAbility;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public List getBbsProp() {
		return bbsProp;
	}
	public void setBbsProp(List bbsProp) {
		this.bbsProp = bbsProp;
	}
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
	public int[] getHobby() {
		return hobby;
	}
	public void setHobby(int hobby[]) {
		this.hobby = hobby;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	
}
