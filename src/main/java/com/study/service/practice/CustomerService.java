package com.study.service.practice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.domain.practice.CustomerDto;
import com.study.domain.practice.PageButtonInfo;
import com.study.mapper.practice.CustomerMapper;

@Service
public class CustomerService {

	@Autowired
	private CustomerMapper mapper;
	
	public List<CustomerDto> showList(int page, PageButtonInfo pageButtonInfo, 
			String column, String keyword){
		int end = 10;
		int start = (page - 1) * end;
		
		double leftPageNumber = Math.max(1, page-3);
		int countAll = mapper.countAll(column, "%"+keyword+"%"); // SELECT Count(*) FROM Board
		int lastPageNumber = (countAll - 1) / end + 1;
		double rightPageNumber = Math.min(lastPageNumber,leftPageNumber + 5);
		
		pageButtonInfo.setLeftPageNumber(leftPageNumber);
		pageButtonInfo.setRightPageNumber(rightPageNumber);
		pageButtonInfo.setCurrentPageNumber(page);
		pageButtonInfo.setLastPageNumber(lastPageNumber);
		
		
		return mapper.show(start, end, column, "%"+keyword+"%");
	}
	
	public int register(CustomerDto customer) {
		return mapper.register(customer);
	}
	
	public CustomerDto showCustomer(int id) {
		return mapper.showCustomer(id);
	}
	
	public int deleteCustomer(int id) {
		return mapper.deleteCustomer(id);
	}
	public int updateCustomer(CustomerDto customer) {
		return mapper.updateCustomer(customer);
	}
}
