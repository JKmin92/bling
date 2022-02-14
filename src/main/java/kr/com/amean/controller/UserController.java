package kr.com.amean.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("user")
public class UserController {
	
//	@Autowired UserService userService;
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

	@RequestMapping("/joinView")
	public String joinView() {
		return "ntf/join/first";
	}
	
	@RequestMapping("/joinView2")
	public String joinView2() {
		return "ntf/join/second";
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
		
		return "mypage/experience/applyEx";
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
