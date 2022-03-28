package kr.com.amean.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.service.ExperienceSerivce;


@Controller
@RequestMapping("/mana")
public class ManaContoroller {

    @Autowired
    ExperienceSerivce experienceSerivce;
    
    @RequestMapping("/")
    public String manaMain() {
        return "ntf/manage/experList";
    }

    @RequestMapping("/experApply")
    public String experApply() {
        return "ntf/manage/experApply";
    }

    @RequestMapping("/addExper")
    public String addExper() {
        return "ntf/manage/addExper";
    }

    @RequestMapping("/userList")
    public String userList() {
        return "ntf/manage/userList";
    }

    @ResponseBody
	@RequestMapping(value = "insertExperience", method = RequestMethod.POST)
	public HashMap<String, Object> insertExperience (String jsonData ) {

		boolean resultBit = false;

		Experience experience = new Experience(title, subject, service, main_img, mCategory, sCategory, area, channel.get(0), 
		channel.get(1), channel.get(2), channel.get(3), 1, contents, condition, startDate, endDate);

		Experience resultExperience = experienceSerivce.addExperience(experience);


		HashMap<String, Object> result = new HashMap<String,Object>();
		result.put("result", resultBit);
		result.put("enum", resultExperience.getE_num());

		return result;
	}

	@RequestMapping("addExperGuide")
	public String addExperGuide() {
		return "ntf/manage.addExperGuide";
	}
    
}
