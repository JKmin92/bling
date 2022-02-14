package kr.com.amean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("experience")
public class ExperienceController {
	
	//@Autowired ExperienceSerivce experienceService;

	@RequestMapping("")
	public String experienceView() {
		return "tf/experience/list";
	}
	
	@RequestMapping("detail")
	public String experienceDetail() {
		return "tf/experience/detail";
	}
	
	@RequestMapping("apply")
	public String experienceApply() {
		return "tf/experience/apply";
	}
	
	
}
