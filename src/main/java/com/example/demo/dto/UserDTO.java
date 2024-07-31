package com.example.demo.dto;

import java.sql.Date;

public class UserDTO {
	
	private String mbrSqno;          // 회원정보일련번호
    private String mbrNo;            // 회원번호
    private String mbrNm;            // 회원명     
    private String mbrUserId;        // 회원아이디    
    private String mbrUserPwd;       // 회원비밀번호    
    private String mbrTel;           // 회원전화번호    
    private String mbrPhone;         // 회원휴대폰번호
    private String mbrAddr;          // 회원주소
    private String bzppOrderNo;      // 주문번호
    private String siteSqno;         // 사이트일련번호      FORIGN KEY (TBAXSM001)
    private Date lstLgnDate;     // 마지막로그인날짜
    private Date updateDate;         // 최근수정날짜
    private String delYn;            // 삭제유무

	
	// Getter, Setter
    public String getMbrSqno() {
		return mbrSqno;
	}
	public void setMbrSqno(String mbrSqno) {
		this.mbrSqno = mbrSqno;
	}
	public String getMbrNo() {
		return mbrNo;
	}
	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}
	public String getMbrNm() {
		return mbrNm;
	}
	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}
	public String getMbrUserId() {
		return mbrUserId;
	}
	public void setMbrUserId(String mbrUserId) {
		this.mbrUserId = mbrUserId;
	}
	public String getMbrUserPwd() {
		return mbrUserPwd;
	}
	public void setMbrUserPwd(String mbrUserPwd) {
		this.mbrUserPwd = mbrUserPwd;
	}
	public String getMbrTel() {
		return mbrTel;
	}
	public void setMbrTel(String mbrTel) {
		this.mbrTel = mbrTel;
	}
	public String getMbrPhone() {
		return mbrPhone;
	}
	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}
	public String getMbrAddr() {
		return mbrAddr;
	}
	public void setMbrAddr(String mbrAddr) {
		this.mbrAddr = mbrAddr;
	}
	public String getBzppOrderNo() {
		return bzppOrderNo;
	}
	public void setBzppOrderNo(String bzppOrderNo) {
		this.bzppOrderNo = bzppOrderNo;
	}
	public String getSiteSqno() {
		return siteSqno;
	}
	public void setSiteSqno(String siteSqno) {
		this.siteSqno = siteSqno;
	}
	public Date getlstLgnDate() {
		return lstLgnDate;
	}
	public void setlstLgnDate(Date lstLgnDate) {
		this.lstLgnDate = lstLgnDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

}
