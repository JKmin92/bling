package kr.com.amean.controller;

import java.io.File;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.service.ExperienceSerivce;


@Controller
@RequestMapping("/mana")
public class ManaContoroller {

    @Autowired
    ExperienceSerivce experienceSerivce;
    
    @RequestMapping("")
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

	@RequestMapping(value = "/insertExperience", method = RequestMethod.POST)
	public ModelAndView insertExperience (Experience experience, String startDate, String endData, String desDate, 
    @RequestParam("mainImg") MultipartFile mainImg, HttpServletRequest request) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        experience.setStart_date(formatter.parse(startDate)); ;
        experience.setEnd_date(formatter.parse(endData));
        experience.setDes_date(formatter.parse(desDate));

		int resultExperience = experienceSerivce.addExperience(experience);
        String thumnail = imageFileUpload("thumnail", mainImg, request, resultExperience);
        experienceSerivce.updateExperImage(thumnail, resultExperience);

        int mCate = 0;
        if(experience.getMCategory().equals("방문")) mCate = 1;
        if(experience.getMCategory().equals("제품")) mCate = 2;
        if(experience.getMCategory().equals("기자단")) mCate = 3;

        ModelAndView mav = new ModelAndView("ntf/manage/addExperGuide");
        mav.addObject("eNum", resultExperience);
        mav.addObject("mCate", mCate);
        mav.addObject("experTitle", experience.getTitle());
		return mav;
	}

    public String imageFileUpload(String fileName, MultipartFile file, HttpServletRequest request, int eNum) {
        
        String result = null;
        String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;

        if(!file.getOriginalFilename().equals("")) {
            fileRoot = contextRoot + "resources/upload/experience/"+eNum + "/";
            String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String savedFileName = fileName + extension;
            File fileUpload = new File(fileRoot + savedFileName);
            
            try {
                if(!fileUpload.exists()) {
                    fileUpload.mkdirs();
                }
                file.transferTo(fileUpload);
                result = fileRoot + savedFileName;
            } catch (Exception e) {
                e.printStackTrace();
                result = null;
            }
        }


        return result;
    }

	@RequestMapping("addExperGuide")
	public ModelAndView addExperGuide(HttpServletRequest req) {
        Experience experience = experienceSerivce.selectExperience(Integer.parseInt(req.getParameter("eNum")));

        ModelAndView mav = new ModelAndView("ntf/manage/addExperGuide");
        mav.addObject("title", experience.getTitle());
		return mav;
	}

    @RequestMapping("insertExperGuide")
	public String insertExperGuide(Guide guide, int eNum, String close_Date, HttpServletRequest req) 
    throws ParseException {
        
        guide.setCloseDate(close_Date);
        Experience experience = experienceSerivce.selectExperience(eNum);
        guide.setService(experience.getService());

        int result = experienceSerivce.addGuide(guide);
        System.out.println("insert exper guide : " + result);

		return "redirect:/mana";
	}
    
}
