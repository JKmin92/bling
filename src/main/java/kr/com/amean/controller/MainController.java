package kr.com.amean.controller;


import java.sql.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.com.amean.service.ExperienceSerivce;


@Controller
public class MainController {
	
	@Autowired ExperienceSerivce experienceService;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		

		String result = experienceService.checkThisTime();

		System.out.println(result);
		
	
		return "tf/home";
	}
	
	

	
}
