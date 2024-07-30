package com.example.demo.domain;

import java.sql.Date;

public class Company {
	
	private String BZPP_SQNO;  		// 사업자정보일련번호		NOT NULL
	private String PDT_SQNO; 		// 제품정보일련번호	
	private String BZPP_NO; 		// 사업자번호
	private String BZPP_NM; 		// 사업자명
	private String BZPP_USER_ID; 	// 사업자아이디	
	private String BZPP_USER_PWD; 	// 사업자아이디비밀번호
	private String BZPP_TEL; 		// 사업장전화번호
	private String BZPP_PHONE; 		// 사업주휴대폰번호
	private String BZPP_ADDR; 		// 사업자주소명
	private String BZPP_ORDER_NO; 	// 주문번호
	private Date UPDATE_DATE; 		// 최근수정날짜
	private Date LST_LGN_DATE; 		// 마지막로그인날짜
	private String DEL_YN; 			// 삭제유무

	
	// Getter, Setter
	public String getBZPP_SQNO() {
		return BZPP_SQNO;
	}
	public void setBZPP_SQNO(String bZPP_SQNO) {
		BZPP_SQNO = bZPP_SQNO;
	}
	public String getPDT_SQNO() {
		return PDT_SQNO;
	}
	public void setPDT_SQNO(String pDT_SQNO) {
		PDT_SQNO = pDT_SQNO;
	}
	public String getBZPP_NO() {
		return BZPP_NO;
	}
	public void setBZPP_NO(String bZPP_NO) {
		BZPP_NO = bZPP_NO;
	}
	public String getBZPP_NM() {
		return BZPP_NM;
	}
	public void setBZPP_NM(String bZPP_NM) {
		BZPP_NM = bZPP_NM;
	}
	public String getBZPP_USER_ID() {
		return BZPP_USER_ID;
	}
	public void setBZPP_USER_ID(String bZPP_USER_ID) {
		BZPP_USER_ID = bZPP_USER_ID;
	}
	public String getBZPP_USER_PWD() {
		return BZPP_USER_PWD;
	}
	public void setBZPP_USER_PWD(String bZPP_USER_PWD) {
		BZPP_USER_PWD = bZPP_USER_PWD;
	}
	public String getBZPP_TEL() {
		return BZPP_TEL;
	}
	public void setBZPP_TEL(String bZPP_TEL) {
		BZPP_TEL = bZPP_TEL;
	}
	public String getBZPP_PHONE() {
		return BZPP_PHONE;
	}
	public void setBZPP_PHONE(String bZPP_PHONE) {
		BZPP_PHONE = bZPP_PHONE;
	}
	public String getBZPP_ADDR() {
		return BZPP_ADDR;
	}
	public void setBZPP_ADDR(String bZPP_ADDR) {
		BZPP_ADDR = bZPP_ADDR;
	}
	public String getBZPP_ORDER_NO() {
		return BZPP_ORDER_NO;
	}
	public void setBZPP_ORDER_NO(String bZPP_ORDER_NO) {
		BZPP_ORDER_NO = bZPP_ORDER_NO;
	}
	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}
	public Date getLST_LGN_DATE() {
		return LST_LGN_DATE;
	}
	public void setLST_LGN_DATE(Date lST_LGN_DATE) {
		LST_LGN_DATE = lST_LGN_DATE;
	}
	public String getDEL_YN() {
		return DEL_YN;
	}
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}

}
