package com.example.demo.mybatis;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.UserDTO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardDTO> searchData(@Param("userName") String userName, 
                              @Param("orderNo") String orderNo, 
                              @Param("companyName") String companyName, 
                              @Param("prodName") String prodName);
    
    void updateDormantUser(@Param("id") String id, @Param("dormantUser") String dormantUser);
    
    UserDTO getUserDetail(String userId);
}
