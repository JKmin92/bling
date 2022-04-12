package kr.com.amean.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.amean.entity.user.Address;
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
		
		if(req.getSession().getAttribute("user")==null) {
			return "rediect:/";
		}
		
		return "ntf/login";
	}
	
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			return "redirect:/";
		}
		return "ntf/join/login";
	}

	@RequestMapping("/loginout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");

		if(user != null) {
			session.invalidate();
		}

		return "redirect:/";
	}

	@RequestMapping(value="/login/go", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> loginGo(String id, String password, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = userService.login(id, password);
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();

		if(user != null) {
			session.setAttribute("user", user);
			result.put("data", true);
		} else {
			System.out.println("로그인 실패 : 회원정보 없음 또는 비밀번호 틀림");
			result.put("data", false);
		}

		return result;
	}

	@RequestMapping("/joinView")
	public String joinView(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			return "redirect:/";
		}
		return "ntf/join/first";
	}

	@ResponseBody
	@RequestMapping(value = "joinFrist", method = RequestMethod.POST)
	public HashMap<String, Boolean> joinFirst (User user, HttpServletRequest req) {
		
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		if(userService.idCheck(user.getId())) {
			result.put("data", false);
			return result;
		}

		req.getSession().setAttribute("joinUser", user);
		result.put("data", true);

		return result;
	} 

	@RequestMapping("joinSec")
	public String joinSec(HttpServletRequest req) {
		if(req.getSession().getAttribute("joinUser") == null) {
			return "redirect:/";
		} else {
			return "/ntf/join/second";
		}
	}

	@ResponseBody
	@RequestMapping(value = "joinSecond", method = RequestMethod.POST)
	public HashMap<String, Object> joinSecond(@RequestParam("interestList") ArrayList<String> interestList,
	@RequestParam("mainLocate") ArrayList<String> mainLocateList, 
	@RequestParam("subLocate") ArrayList<String> subLocateList, HttpServletRequest req) {

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("joinUser");
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

		if(totalResult) {
			session.setAttribute("user", user);
		}

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
	public String userInfo(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}

		return "mypage/userInfo";
	}

	@RequestMapping(value = "/mypage/getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getUserInfo(HttpServletRequest req) {
		HashMap<String, Object> result = new HashMap<String,Object>();
		User user = (User)req.getSession().getAttribute("user");
		result.put("user", user);
		result.put("addressList", userService.userAddressList(user.getId()));

		return result;
	}

	@RequestMapping("/mypage/userInfo/address")
	public ModelAndView userAddress(int aNum, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/");
		}
		ModelAndView mav = new ModelAndView("ntf/address/addAdress");

		if(aNum != 0) {
			Address address = userService.userAddress(user.getId(), aNum);
			mav.addObject("Address", address);
		}

		return mav;
	}

	@RequestMapping(value = "address/insert", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertAddress(Address address, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		boolean result = false;

		if(user == null) {
			System.out.println("로그인 되어있지 않음");
			return result;
		}

		address.setId(user.getId());
		result = userService.insertAddress(address);

		return result;
	}

	@RequestMapping(value = "address/modify", method = RequestMethod.POST)
	@ResponseBody
	public boolean modifyAddress(Address address, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		boolean result = false;

		if(user == null) {
			System.out.println("로그인 되어있지 않음");
			return result;
		}

		address.setId(user.getId());
		result = userService.updateAddress(address);

		return result;
	}

	@RequestMapping(value = "address/remove", method = RequestMethod.POST)
	@ResponseBody
	public boolean removeAddress(int anum, HttpServletRequest req) {

		System.out.println("aaa");
		System.out.println("aNum : " + anum);
		User user = (User)req.getSession().getAttribute("user");
		boolean result = false;

		if(user == null) {
			System.out.println("주소 삭제 - 로그인 되어있지 않음");
			return result;
		}

		result = userService.removeAddress(user.getId(), anum);

		return result;
	}

	@RequestMapping("/mypage/modifypwd")
	public String modifyPwd(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/modifyPwd";
	}

	@RequestMapping("/mypage/removeUser")
	public String removeUser(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/removeUser";
	}
	
	@RequestMapping("/mypage/channel")
	public String myChannel(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/channel";
	}

	@RequestMapping("/nav_callback")
	public String myChannelNavCallback(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		
		return "mypage/channel/navCallback";
	}

	@RequestMapping(value = "/naver/add", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> naverAdd(String email, HttpServletRequest req) {
		HashMap<String, String> result = new HashMap<String,String>();
		if(email == null) {
			result.put("email", "false");
		}

		User user = (User)req.getSession().getAttribute("user");
		boolean navAddRes = userService.addNaverId(email, user.getId());

		System.out.println("navAddRes : " + navAddRes);

		result.put("navAdd", ""+navAddRes);
		result.put("result", email);
		return result;
	}

	@RequestMapping("/mypage/point")
	public String myPoint(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/point";
	}

	
	
	
	

}
