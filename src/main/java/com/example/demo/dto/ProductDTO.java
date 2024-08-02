package com.example.demo.dto;

public class ProductDTO {

	private String pdtSqno; 		// 제품정보일련번호  		NOT NULL
    private String bzppSqno; 		// 사업자정보일련번호	   FORIGN KEY (TBAXBM001)
    private String mbrSqno; 		// 회원정보일련번호
    private String pdtNm; 			// 제품명		
    private String pdtNo; 			// 제품번호		
    private String pdtStatCd; 		// 제품상태코드		
    private String dlvyStatCd; 		// 배송상태코드
    private String delYn; 			// 삭제유무
    private String bzppUserId;  	// 사업자아이디
    private String bzppPhone;  		// 사업주휴대폰번호
    private String bzppOrderNo;  	// 주문번호
    private String bzppAddr; 		// 사업자주소명
    private String bzppNo;  		// 사업자번호
    private String bzppTel;  		// 사업장전화번호
	
    
    // Getter, Setter
    public String getPdtSqno() {
		return pdtSqno;
	}
	public void setPdtSqno(String pdtSqno) {
		this.pdtSqno = pdtSqno;
	}
	public String getBzppSqno() {
		return bzppSqno;
	}
	public void setBzppSqno(String bzppSqno) {
		this.bzppSqno = bzppSqno;
	}
	public String getMbrSqno() {
		return mbrSqno;
	}
	public void setMbrSqno(String mbrSqno) {
		this.mbrSqno = mbrSqno;
	}
	public String getPdtNm() {
		return pdtNm;
	}
	public void setPdtNm(String pdtNm) {
		this.pdtNm = pdtNm;
	}
	public String getPdtNo() {
		return pdtNo;
	}
	public void setPdtNo(String pdtNo) {
		this.pdtNo = pdtNo;
	}
	public String getPdtStatCd() {
		return pdtStatCd;
	}
	public void setPdtStatCd(String pdtStatCd) {
		this.pdtStatCd = pdtStatCd;
	}
	public String getDlvyStatCd() {
		return dlvyStatCd;
	}
	public void setDlvyStatCd(String dlvyStatCd) {
		this.dlvyStatCd = dlvyStatCd;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getBzppUserId() {
		return bzppUserId;
	}
	public void setBzppUserId(String bzppUserId) {
		this.bzppUserId = bzppUserId;
	}
	public String getBzppPhon() {
		return bzppPhone;
	}
	public void setBzppPhon(String bzppPhone) {
		this.bzppPhone = bzppPhone;
	}
	public String getBzppOrderNo() {
		return bzppOrderNo;
	}
	public void setBzppOrderNo(String bzppOrderNo) {
		this.bzppOrderNo = bzppOrderNo;
	}
	public String getBzppAddr() {
		return bzppAddr;
	}
	public void setBzppAddr(String bzppAddr) {
		this.bzppAddr = bzppAddr;
	}
	public String getBzppNo() {
		return bzppNo;
	}
	public void setBzppNo(String bzppNo) {
		this.bzppNo = bzppNo;
	}
	public String getBzppTel() {
		return bzppTel;
	}
	public void setBzppTel(String bzppTel) {
		this.bzppTel = bzppTel;
	}
    
}
