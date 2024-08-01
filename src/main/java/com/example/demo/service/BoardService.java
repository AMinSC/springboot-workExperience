package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.CompanyDTO;
import com.example.demo.dto.ProductDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.mybatis.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public List<BoardDTO> searchData(String mbrNm, String bzppOrderNo, String bzppNm, String pdtNm) {
        return boardMapper.searchData(mbrNm, bzppOrderNo, bzppNm, pdtNm);
    }
    
    public void updateDormantUser(String id, String dormantUser) {
    	boardMapper.updateDormantUser(id, dormantUser);
    }
    
    public UserDTO getUserDetail(String mbrSqno) {
    	return boardMapper.getUserDetail(mbrSqno);
    }
    
    public CompanyDTO getCompanyDetail(String bzppOrderNo) {
    	return boardMapper.getCompanyDetail(bzppOrderNo);
    }
    
    public ProductDTO getProductDetail(String pdtSqno) {
    	return boardMapper.getProductDetail(pdtSqno);
    }
}
