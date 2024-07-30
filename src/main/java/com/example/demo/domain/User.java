package com.example.demo.domain;

import java.sql.Date;

public class User {

	private String MBR_SQNO; 		// 회원정보일련번
	private String MBR_NO;   		// 회원번
	private String MBR_NM;   		// 회원
	private String MBR_USER_ID; 	// 회원아이디
	private String MBR_USER_PWD; 	// 회원비밀번호	
	private String MBR_TEL;  		// 회원전화번호	
	private String MBR_PHONE; 		// 회원휴대폰번호
	private String MBR_ADDR;  		// 회원주소
	private String BZPP_ORDER_NO; 	// 주문번호
	private String SITE_SQNO;  		// 사이트일련번호   FORIGN KEY (TBAXSM001)
	private Date LST_LGN_DATE; 		// 마지막로그인날짜
	private Date UPDATE_DATE;  		// 최근수정날짜
	private String DEL_YN;  		// 삭제유무
	
	
	// Getter, Setter
	public String getMBR_SQNO() {
		return MBR_SQNO;
	}
	public void setMBR_SQNO(String mBR_SQNO) {
		MBR_SQNO = mBR_SQNO;
	}
	public String getMBR_NO() {
		return MBR_NO;
	}
	public void setMBR_NO(String mBR_NO) {
		MBR_NO = mBR_NO;
	}
	public String getMBR_NM() {
		return MBR_NM;
	}
	public void setMBR_NM(String mBR_NM) {
		MBR_NM = mBR_NM;
	}
	public String getMBR_USER_ID() {
		return MBR_USER_ID;
	}
	public void setMBR_USER_ID(String mBR_USER_ID) {
		MBR_USER_ID = mBR_USER_ID;
	}
	public String getMBR_USER_PWD() {
		return MBR_USER_PWD;
	}
	public void setMBR_USER_PWD(String mBR_USER_PWD) {
		MBR_USER_PWD = mBR_USER_PWD;
	}
	public String getMBR_TEL() {
		return MBR_TEL;
	}
	public void setMBR_TEL(String mBR_TEL) {
		MBR_TEL = mBR_TEL;
	}
	public String getMBR_PHONE() {
		return MBR_PHONE;
	}
	public void setMBR_PHONE(String mBR_PHONE) {
		MBR_PHONE = mBR_PHONE;
	}
	public String getMBR_ADDR() {
		return MBR_ADDR;
	}
	public void setMBR_ADDR(String mBR_ADDR) {
		MBR_ADDR = mBR_ADDR;
	}
	public String getBZPP_ORDER_NO() {
		return BZPP_ORDER_NO;
	}
	public void setBZPP_ORDER_NO(String bZPP_ORDER_NO) {
		BZPP_ORDER_NO = bZPP_ORDER_NO;
	}
	public String getSITE_SQNO() {
		return SITE_SQNO;
	}
	public void setSITE_SQNO(String sITE_SQNO) {
		SITE_SQNO = sITE_SQNO;
	}
	public Date getLST_LGN_DATE() {
		return LST_LGN_DATE;
	}
	public void setLST_LGN_DATE(Date lST_LGN_DATE) {
		LST_LGN_DATE = lST_LGN_DATE;
	}
	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	public String getDEL_YN() {
		return DEL_YN;
	}
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	
	
}
