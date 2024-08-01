package com.example.demo.dto;

public enum DeliveryStatus {
	RECEIVING("01", "접수중"),
	RECEIVED("02", "접수완료"),
	POUCHING("03", "배송포장중"),
	PREPARING("04", "배송중"),
	SHIPPING("05", "배송완료"),
	COMPLETED("06", "배송완료"),
	EXCHANGE("07", "교환배송중"),
	REFUND("08", "환불");
	
	private final String code;
	private final String description;
	
	DeliveryStatus(String code, String description) {
		this.code = code;
		this.description = description;
	}
	
	public String getCode() {
		return code;
	}
	
	public String getDescription() {
		return description;
	}
	
	public static DeliveryStatus fromCode(String code) {
		for (DeliveryStatus status : values() ) {
			if (status.code.equals(code)) {
				return status;
			}
		}
		throw new IllegalArgumentException("Unknow code: " + code);
	}
}
