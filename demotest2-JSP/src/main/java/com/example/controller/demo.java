package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class demo {
	@RequestMapping("/demo")
	public void demo() {
		System.out.println("demo");
	}
}