package com.example.demo.dto;

public enum ProductStatus {
	NOMAL("01", "정상"),
	DEFECTIVE("02", "불량"),
	RETURN_HIGH("03", "반품(상)"),
	RETURN_MEDIUM("04", "반품(중)"),
	RETURN_LOW("05", "반품(하)");
	
	private final String code;
	private final String description;
	
	ProductStatus(String code, String description) {
		this.code = code;
		this.description = description;
	}
	
	public String getCode() {
		return code;
	}
	
	public String getDescription() {
		return description;
	}
	
	public static ProductStatus fromCode(String code) {
		for (ProductStatus status : values()) {
			if (status.code.equals(code)) {
				return status;
			}
		}
		throw new IllegalArgumentException("Unknown code: " + code);
	}
}
