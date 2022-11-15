package com.study.domain.practice;

import lombok.Data;

@Data
public class PageButtonInfo {
	private double leftPageNumber;
	private double rightPageNumber;
	private int currentPageNumber;
	private int lastPageNumber;
}
