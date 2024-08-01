package com.example.demo.dto;

import java.sql.Date;

public class CompanyDTO {

	private String bzppSqno; 		// 사업자정보일련번호		NOT NULL
	private String pdtSqno; 		// 제품정보일련번호	
	private String bzppNo; 			// 사업자번호
	private String bzppNm; 			// 사업자명
	private String bzppUserId; 		// 사업자아이디	
	private String bzppUserPwd; 	// 사업자아이디비밀번호
	private String bzppTel; 		// 사업장전화번호
	private String bzppPhone; 		// 사업주휴대폰번호
	private String bzppAddr; 		// 사업자주소명
	private String bzppOrderNo; 	// 주문번호
	private Date updateDate; 		// 최근수정날짜
	private Date lstLgnDate; 		// 마지막로그인날짜
	private String delYn; 			// 삭제유무

	
	// Getter, Setter
	public String getBzppSqno() {
		return bzppSqno;
	}
	public void setBzppSqno(String bzppSqno) {
		this.bzppSqno = bzppSqno;
	}
	public String getPdtSqno() {
		return pdtSqno;
	}
	public void setPdtSqno(String pdtSqno) {
		this.pdtSqno = pdtSqno;
	}
	public String getBzppNo() {
		return bzppNo;
	}
	public void setBzppNo(String bzppNo) {
		this.bzppNo = bzppNo;
	}
	public String getBzppNm() {
		return bzppNm;
	}
	public void setBzppNm(String bzppNm) {
		this.bzppNm = bzppNm;
	}
	public String getBzppUserId() {
		return bzppUserId;
	}
	public void setBzppUserId(String bzppUserId) {
		this.bzppUserId = bzppUserId;
	}
	public String getBzppUserPwd() {
		return bzppUserPwd;
	}
	public void setBzppUserPwd(String bzppUserPwd) {
		this.bzppUserPwd = bzppUserPwd;
	}
	public String getBzppTel() {
		return bzppTel;
	}
	public void setBzppTel(String bzppTel) {
		this.bzppTel = bzppTel;
	}
	public String getBzppPhone() {
		return bzppPhone;
	}
	public void setBzppPhone(String bzppPhone) {
		this.bzppPhone = bzppPhone;
	}
	public String getBzppAddr() {
		return bzppAddr;
	}
	public void setBzppAddr(String bzppAddr) {
		this.bzppAddr = bzppAddr;
	}
	public String getBzppOrderNo() {
		return bzppOrderNo;
	}
	public void setBzppOrderNo(String bzppOrderNo) {
		this.bzppOrderNo = bzppOrderNo;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Date getLstLgnDate() {
		return lstLgnDate;
	}
	public void setLstLgnDate(Date lstLgnDate) {
		this.lstLgnDate = lstLgnDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	
}
