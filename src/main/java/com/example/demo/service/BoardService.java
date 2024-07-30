package com.example.demo.service;

import com.example.demo.dto.BoardDTO;
import com.example.demo.mybatis.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    private BoardMapper boardMapper;

    public List<BoardDTO> searchData(String userName, String orderNo, String companyName, String prodName) {
        return boardMapper.searchData(userName, orderNo, companyName, prodName);
    }
    
    public void updateDormantUser(String id, String dormantUser) {
    	boardMapper.updateDormantUser(id, dormantUser);
    }
}
