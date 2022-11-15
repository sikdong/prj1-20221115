package com.study.mapper.practice;

import java.util.List;

import com.study.domain.practice.CustomerDto;

public interface CustomerMapper {
	public List<CustomerDto> show(int start, int end, String column, String keyword);
	
	public int register(CustomerDto customer);
	
	CustomerDto showCustomer(int id);
	
	public int deleteCustomer(int id);
	
	int updateCustomer(CustomerDto customer);

	int countAll(String column, String keyword);
}
