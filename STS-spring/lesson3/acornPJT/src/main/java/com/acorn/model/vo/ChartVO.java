package com.acorn.model.vo;

public class ChartVO {
	
	private double age;
	private double weight;
	
	public ChartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChartVO(double age, double weight) {
		super();
		this.age = age;
		this.weight = weight;
	}
	public double getAge() {
		return age;
	}
	public void setAge(double age) {
		this.age = age;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	
}
