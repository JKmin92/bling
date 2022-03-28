package kr.com.amean.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.UserService;



@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired UserService userService;
//	@Autowired ExperienceSerivce experienceService;
	
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest req) {
		
//		User user = (User)req.getSession().getAttribute("user");
//		if(user==null) {
//			return "rediect:/";
//		}
		
		return "ntf/login";
	}
	
//	@RequestMapping("/login")
//	public String login(String id, String pw, HttpServletRequest req) {
//		
//		User user = userService.login(id, pw);
//		if(user==null) {
//			req.setAttribute("result", false);
//			return "/login";
//		}
//		
//		HttpSession session = req.getSession();
//		session.setAttribute("user", user);
//		
//		return "redirect:/";
//	}
	
	@RequestMapping("/login")
	public String login() {
		return "ntf/join/login";
	}

	@RequestMapping(value="/login/go", method=RequestMethod.POST)
	public ModelAndView loginGo(@RequestParam("email") String id, String password, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = userService.login(id, password);
		ModelAndView result = new ModelAndView("/user/mypage");
		if(user != null) {
			session.setAttribute("user", user);

			System.out.println("user ID : " + user.getId());
		} else {
			System.out.println("없음");
		}

		return result;
	}

	@RequestMapping("/joinView")
	public String joinView() {
		return "ntf/join/first";
	}

	@RequestMapping(value = "joinFrist", method = RequestMethod.POST)
	public String joinFirst (@RequestParam("email") String id, String nickName, String password, String phone, 
	boolean service, boolean privat, boolean sAgr, boolean eAgr, HttpServletRequest req) {
		User user = new User();
		user.setId(id);
		user.setNickName(nickName);
		user.setPw(password);
		user.setPhone_number(phone);
		user.setSAgr(sAgr);
		user.setEAgr(eAgr);
		user.setServiceAgr(service);
		user.setPrivatAgr(privat);

		HttpSession session = req.getSession();
		session.setAttribute("user", user);

		return "ntf/join/second";
	} 

	@ResponseBody
	@RequestMapping(value = "joinSecond", method = RequestMethod.POST)
	public HashMap<String, Object> joinSecond(@RequestParam("interestList") ArrayList<String> interestList,
	@RequestParam("mainLocate") ArrayList<String> mainLocateList, 
	@RequestParam("subLocate") ArrayList<String> subLocateList, HttpServletRequest req) {

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		boolean joinResult = false;
		boolean locateResult = false;
		boolean interestResult = false;
		boolean totalResult = false;

		user.setGender("gender");
		user.setI_id("");
		user.setN_id("");
		joinResult = userService.join(user);

		for(int i=0; i<mainLocateList.size(); i++) {
			Area area = new Area(user.getId(), mainLocateList.get(i), subLocateList.get(i));
			locateResult = userService.addArea(area);
		}

		if(interestList.size() >= 1) {
			Interest interest = new Interest(user.getId(), interestList.get(0), "", "");
			if(interestList.size() >= 2 ) {
				interest.setSeconde(interestList.get(1));
				if(interestList.size() >= 3) {
					interest.setSeconde(interestList.get(2));
				}
			}
			interestResult = userService.addInterest(interest);
		}

		totalResult = joinResult && locateResult && interestResult;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("locate", "/user/joinCompletion");
		map.put("result", totalResult);

		return map;
	}
	
	@RequestMapping("/joinView3")
	public String joinView3() {

		return "ntf/join/third";
	}
	
	@RequestMapping("/joinCompletion")
	public String joinCompletion() {
		return "ntf/join/completion";
	}
	
//	@RequestMapping("/join")
//	public String join(User user, HttpServletRequest req) {
//		
//		if(userService.idCheck(user.getI_id())) {
//			req.setAttribute("id_check", true);
//			return "rediect:/joinView";
//		}
//		
//		boolean result = userService.join(user);
//		if(!result) {
//			req.setAttribute("result", false);
//			return "rediect:/joinView";
//		}
//				
//		return "rediect:/loginView";
//	}
	
	@RequestMapping("/mypage")
	public String mypageView(HttpServletRequest req) {
		
//		User user = (User)req.getSession().getAttribute("user");
//		req.setAttribute("user", user);
		
		return "mypage/mypage";
	}
	
//	@RequestMapping(value = "/userEx", method = RequestMethod.POST)
//	public HashMap<String, Object> userExperience(HttpServletRequest req) {
//		
//		User user = (User)req.getSession().getAttribute("user");
//		
//		List<Experience> experienceList = experienceService.selectUserExperienceList(user.getI_id());
//		List<Apply> applyList = new ArrayList<Apply>();
//		
//		for(Experience ex : experienceList) {
//			applyList.add(experienceService.showApply(ex.getE_num(), user.getI_id()));
//		}
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("exList", experienceList);
//		map.put("appList", applyList);
//		
//		return map;
//		
//	}

	@RequestMapping("/mypage/applyExperList")
	public String applyExperList() {
		return "mypage/experience/applyExperList";
	}

	@RequestMapping("/mypage/selectExper")
	public String selectExperList() {
		return "mypage/experience/selectExper";
	}

	@RequestMapping("/mypage/insertExper")
	public String insertExperList() {
		return "mypage/experience/experInsertList";
	}

	@RequestMapping("/mypage/registerReview")
	public String registerReviewList() {
		return "mypage/experience/registerReview";
	}

	@RequestMapping("/mypage/userInfo")
	public String userInfo() {
		return "mypage/userInfo";
	}

	@RequestMapping("/mypage/modifypwd")
	public String modifyPwd() {
		return "mypage/modifyPwd";
	}

	@RequestMapping("/mypage/removeUser")
	public String removeUser() {
		return "mypage/removeUser";
	}
	
	@RequestMapping("/mypage/channel")
	public String myChannel() {
		return "mypage/channel";
	}

	@RequestMapping("/mypage/point")
	public String myPoint() {
		return "mypage/point";
	}

	
	
	
	

}
