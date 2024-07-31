package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.UserDTO;
import com.example.demo.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class DataController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/data")
    public List<BoardDTO> getData(
        @RequestParam(value = "userName", required = false) String userName,
        @RequestParam(value = "orderNo", required = false) String orderNo,
        @RequestParam(value = "companyName", required = false) String companyName,
        @RequestParam(value = "prodName", required = false) String prodName) {

        return boardService.searchData(userName, orderNo, companyName, prodName);
    }
    
    @PostMapping("/updateDormantUser")
    public void updateDormantUser(@RequestParam("id") String id, @RequestParam("dormantUser") String dormantUser) {
    	boardService.updateDormantUser(id, dormantUser);
    }
    
    @PostMapping("/userDetail")
    public ResponseEntity<UserDTO> getUserDetail(@RequestBody Map<String, String> request) {
    	String userId = request.get("userId");
    	System.out.println("Received userId: " + userId); // 로그 추가
    	UserDTO userDetail = boardService.getUserDetail(userId);
    	System.out.println("Returning user detail: " + userDetail); // 로그 추가
    	return ResponseEntity.ok(userDetail);
    }
}
