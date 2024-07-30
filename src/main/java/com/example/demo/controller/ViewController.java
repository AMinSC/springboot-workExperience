package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class ViewController {

	@GetMapping("/board")
	public String viewBoard(Model model) {
		
		return "board";
	}
	
	@GetMapping("/register")
	public String register() {
		return "register-view";
	}
}
