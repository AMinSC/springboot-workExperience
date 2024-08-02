package com.example.demo.mybatis;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.CompanyDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.UserDTO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDTO> searchData(@Param("mbrNm") String mbrNm, 
                              @Param("bzppOrderNo") String bzppOrderNo, 
                              @Param("bzppNm") String bzppNm, 
                              @Param("pdtNm") String pdtNm);
    
    void updateDormantUser(@Param("id") String id, @Param("dormantUser") String dormantUser);
    
    UserDTO getUserDetail(String mbrSqno);
    
	CompanyDTO getCompanyDetail(String bzppOrderNo);
	
	ProductDTO getProductDetail(String pdtSqno);
	
	void userUpdate(UserDTO user);
	
	void companyUpdate(CompanyDTO company);
	
	void productUpdate(ProductDTO prodcut); 
}
