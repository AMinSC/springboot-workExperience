package com.example.demo.domain;

public class Product {
	
	private String PDT_SQNO; 		// 제품정보일련번호  		NOT NULL
	private String BZPP_SQNO; 		// 사업자정보일련번호	   FORIGN KEY (TBAXBM001)
	private String MBR_SQNO; 		// 회원정보일련번호
	private String PDT_NM; 			// 제품명		
	private String PDT_NO; 			// 제품번호		
	private String PDT_STAT_CD; 	// 제품상태코드		
	private String DLVY_STAT_CD; 	// 배송상태코드
	private String DEL_YN; 			// 삭제유무

}
