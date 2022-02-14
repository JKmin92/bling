package kr.com.amean.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	//@Autowired ExperienceSerivce experienceService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "tf/home";
	}
	/*
	@RequestMapping(value="/mainEx", method = RequestMethod.POST)
	public List<Experience> experienceListMain() {
		
		return experienceService.selectExperienceList();
	}
	*/

	
}
