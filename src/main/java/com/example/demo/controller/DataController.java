package com.example.demo.controller;

import com.example.demo.dto.BoardDTO;
import com.example.demo.dto.CompanyDTO;
import com.example.demo.dto.ProductDTO;
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
        @RequestParam(value = "mbrNm", required = false) String mbrNm,
        @RequestParam(value = "bzppOrderNo", required = false) String bzppOrderNo,
        @RequestParam(value = "bzppNm", required = false) String bzppNm,
        @RequestParam(value = "pdtNm", required = false) String pdtNm) {

        return boardService.searchData(mbrNm, bzppOrderNo, bzppNm, pdtNm);
    }
    
    @PostMapping("/updateDormantUser")
    public void updateDormantUser(@RequestParam("id") String id, @RequestParam("dormantUser") String dormantUser) {
    	boardService.updateDormantUser(id, dormantUser);
    }
    
    @PostMapping("/userDetail")
    public ResponseEntity<UserDTO> getUserDetail(@RequestBody Map<String, String> request) {
    	String mbrSqno = request.get("mbrSqno");
    	System.out.println("Received mbrSqno: " + mbrSqno); // 로그 추가
    	UserDTO userDetail = boardService.getUserDetail(mbrSqno);
    	System.out.println("Returning user detail: " + userDetail); // 로그 추가
    	return ResponseEntity.ok(userDetail);
    }
    
    @PostMapping("/companyDetail")
    public ResponseEntity<CompanyDTO> getCompanyDetail(@RequestBody Map<String, String> request) {
    	String bzppOrderNo = request.get("bzppOrderNo");
    	CompanyDTO companyDetail = boardService.getCompanyDetail(bzppOrderNo);
    	return ResponseEntity.ok(companyDetail);
    }
    
    @PostMapping("/productDetail")
    public ResponseEntity<ProductDTO> getProductDetail(@RequestBody Map<String, String> request) {
    	String pdtSqno = request.get("pdtSqno");
    	ProductDTO productDetail = boardService.getProductDetail(pdtSqno);
    	return ResponseEntity.ok(productDetail);
    }
}
