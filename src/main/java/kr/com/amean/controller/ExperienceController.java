package kr.com.amean.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.ExperienceSerivce;


@Controller
@RequestMapping("experience")
public class ExperienceController {
	
	@Autowired ExperienceSerivce experienceService;

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

	@ResponseBody
	@RequestMapping(value = "insertApply", method = RequestMethod.POST)
	public HashMap<String, Boolean> insertApply(int eNum, int aNum, String url, String img, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		Review review = new Review(aNum, user.getI_id(), eNum, new Date(), url, img, 1);
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		

		boolean inserReviewResult = experienceService.experienceReport(review);

		result.put("result", inserReviewResult);
		return result;
	}
	
	
}
