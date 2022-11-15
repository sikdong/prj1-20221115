package com.study.domain.practice;

import lombok.Data;

@Data
public class CustomerDto {
	private int id;
	private String name;
	private String contactName;
	private String address;
	private String city;
	private String postalCode;
	private String country;
}
