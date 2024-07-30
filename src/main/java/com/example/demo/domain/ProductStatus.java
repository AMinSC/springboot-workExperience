package com.example.demo.domain;

public enum ProductStatus {
	NORMAL("01", "정상"),
	DEFECTIVE("02", "불량"),
    RETURN_HIGH("03", "반품(상)"),
    RETURN_MID("04", "반품(중)"),
    RETURN_LOW("05", "반품(하)");
	
	private final String code;
    private final String description;

	ProductStatus(String code, String description) {
        this.code = code;
        this.description = description;
    }

}
