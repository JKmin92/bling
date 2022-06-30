package kr.com.amean.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import kr.com.amean.entity.bank.Bank;
import kr.com.amean.entity.bank.BankTake;
import kr.com.amean.entity.bank.Cumalative;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Channel;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.ExperienceSerivce;
import kr.com.amean.service.UserService;
import kr.com.amean.util.SHA256;



@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired UserService userService;
	@Autowired ExperienceSerivce experienceService;
	
	@RequestMapping("/loginView")
	public ModelAndView loginView(HttpServletRequest req, String loate, int eNum) {
		
		if(req.getSession().getAttribute("user")==null) {
			return new ModelAndView("redirect:/");
		}
		
		ModelAndView mav = new ModelAndView("ntf/login");
		mav.addObject("locate", loate);
		mav.addObject("eNum", eNum);
		return mav;
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
		String userKey = userService.getUserKey(id);
		String pw = SHA256.getEncrypt(password, userKey);
		User user = userService.login(id, pw);
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

	@RequestMapping(value="/login/channelgo", method=RequestMethod.POST)
	@ResponseBody
	public boolean loginChannelgo(String channel, String id, String email, HttpServletRequest req) {
		HttpSession session = req.getSession();
		User user = userService.loginForChannel(channel, id);
		boolean result = false;

		if(user != null) {
			session.setAttribute("user", user);
			result = true;
		}

		return result;
	}

	@RequestMapping(value = "/leftmenu/state", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> experStateList(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		List<Integer> stateList = new ArrayList<Integer>();
		List<Apply> applyList = experienceService.userApplyList(user.getId());
		List<Apply> userApplyOn = new ArrayList<Apply>();
		List<Apply> experienceApplyOn = new ArrayList<Apply>();
		List<Apply> nonCommitApplyList = new ArrayList<Apply>();
		List<Apply> commitApplyList = new ArrayList<Apply>();
		List<Channel> channelList =new ArrayList<Channel>();
		Channel blog = userService.basicChannel(user.getId(), 1);
		Channel instagram = userService.basicChannel(user.getId(), 2);
		Channel facebook = userService.basicChannel(user.getId(), 3);
		Channel youtube = userService.basicChannel(user.getId(), 4);
		Bank bank = userService.selectBank(user.getId());
		List<InterestCampaign> interestCampaignList = experienceService.selectInterestCampaignList(user.getId());


		for(Apply apply : applyList) {
			if(apply.getState() == 1) {
				userApplyOn.add(apply);
			}

			if(apply.getState() == 2) {
				experienceApplyOn.add(apply);
			}

			if(apply.getState() == 3) {
				nonCommitApplyList.add(apply);
			}

			if(apply.getState() == 4 || apply.getState() == 5) {
				commitApplyList.add(apply);
			}
		}

		stateList.add(userApplyOn.size());
		stateList.add(experienceApplyOn.size());
		stateList.add(nonCommitApplyList.size());
		stateList.add(commitApplyList.size());

		channelList.add(blog);
		channelList.add(instagram);
		channelList.add(facebook);
		channelList.add(youtube);

		resultMap.put("stateList", stateList);
		resultMap.put("channelList", channelList);
		resultMap.put("bank", bank);
		resultMap.put("interestCampaignCnt", interestCampaignList.size());
		

		return resultMap;
	}

	@RequestMapping("/joinView")
	public String joinView(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			return "redirect:/";
		}
		return "ntf/join/first";
	}

	@RequestMapping("/joinViewChannel")
	public ModelAndView joinViewChannel(String channel, String channelId, String email, HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			return new ModelAndView("redirect:/");
		}

		ModelAndView mav = new ModelAndView("ntf/join/first");
		mav.addObject("channel", channel);
		mav.addObject("channelId", channelId);
		mav.addObject("email", email);

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "joinFrist", method = RequestMethod.POST)
	public HashMap<String, Boolean> joinFirst (User user, String channel, String channelId, HttpServletRequest req) {
		
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		if(userService.idCheck(user.getId())) {
			result.put("data", false);
			return result;
		}

		if(channel != null) {
			if(channel.equals("kakao")) {
				user.setKakao_id(channelId);
			} else if (channel.equals("naver")) {
				user.setNaver_id(channelId);
			} else if (channel.equals("facebook")) {
				user.setFacebook_id(channelId);
			}
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
	public HashMap<String, Object> joinSecond(String[] interestList,
	String[] mainLocate, String[] subLocate, HttpServletRequest req) {

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("joinUser");
		boolean joinResult = false;
		boolean locateResult = false;
		boolean interestResult = false;
		boolean totalResult = false;
		String salt = SHA256.generateSalt();

		user.setGender("gender");
		user.setPassword(SHA256.getEncrypt(user.getPassword(), salt));
		user.setUserKey(salt);
		joinResult = userService.join(user);

		for(int i=0; i<mainLocate.length; i++) {
			Area area = new Area(user.getId(), mainLocate[i], subLocate[i]);
			locateResult = userService.addArea(area);
		}

		if(interestList.length >= 1) {
			List<Interest> interests = new ArrayList<Interest>();

			for(String itme : interestList) {
				Interest interest = new Interest(user.getId(), itme);
				interests.add(interest);
			}
			
			for(Interest interest : interests) {
				interestResult = userService.addInterest(interest);
			}
		}

		totalResult = joinResult && locateResult && interestResult;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("locate", "/user/joinCompletion");
		map.put("result", totalResult);

		if(totalResult) {
			Bank bank = new Bank();
			bank.setId(user.getId());
			bank.setPresentPoint(0);
			bank.setCumalatePoint(0);
			totalResult = userService.insertBank(bank);
		}
		

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
	
	
	@RequestMapping("/mypage")
	public ModelAndView mypageView(HttpServletRequest req) {
		
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}	
		
		ModelAndView mav = new ModelAndView("mypage/mypage");
		List<Apply> applyList = experienceService.userApplyList(user.getId());
		List<Apply> userApplyOn = new ArrayList<Apply>();
		List<Apply> experienceApplyOn = new ArrayList<Apply>();
		List<Apply> nonCommitApplyList = new ArrayList<Apply>();
		List<Apply> commitApplyList = new ArrayList<Apply>();
		List<Experience> experienceList = new ArrayList<Experience>();

		for(Apply apply : applyList) {
			if(apply.getState() == 1) {
				userApplyOn.add(apply);
			}

			if(apply.getState() == 2) {
				experienceApplyOn.add(apply);
			}

			if(apply.getState() == 3) {
				nonCommitApplyList.add(apply);
			}

			if(apply.getState() == 4 || apply.getState() == 5) {
				commitApplyList.add(apply);
			}
		}

		for(Apply apply : userApplyOn) {
			experienceList.add(experienceService.selectExperience(apply.getE_num()));
		}

		mav.addObject("applyOnCount", userApplyOn.size());
		mav.addObject("experApplyOnCount", experienceApplyOn.size());
		mav.addObject("nonCommitCount", nonCommitApplyList.size());
		mav.addObject("commitCount", commitApplyList.size());
		mav.addObject("experienceList", experienceList);

		return mav;
	}
	
	@RequestMapping(value = "/applyExperienceList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> applyExperienceList(HttpServletRequest req) {
		
		User user = (User)req.getSession().getAttribute("user");
		
		List<Apply> applyListOri = experienceService.userApplyList(user.getId());
		List<Apply> applyList = new ArrayList<Apply>();
		List<Experience> experienceList = new ArrayList<Experience>();
		
		for(Apply apply : applyListOri) {
			if(apply.getState() == 1) {
				experienceList.add(experienceService.selectExperience(apply.getE_num()));
				applyList.add(apply);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("exList", experienceList);
		map.put("appList", applyList);
		
		return map;
		
	}

	@RequestMapping(value = "/deadExperienceList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> deadExperienceList(HttpServletRequest req) {
		
		User user = (User)req.getSession().getAttribute("user");
		Date today = new Date();
		
		List<Apply> applyListOri = experienceService.userApplyList(user.getId());
		List<Apply> applyList = new ArrayList<Apply>();
		List<Experience> experienceList = new ArrayList<Experience>();

		for(Apply apply : applyListOri) {
			if(apply.getState() == 2 || apply.getState() == 3) {
				if(today.compareTo(apply.getCreateDate()) > 0) {
					experienceService.changeApplyState(apply.getA_num(), 3);
				}
			}
		}
		
		for(Apply apply : applyListOri) {
			if(apply.getState() == 3) {
				experienceList.add(experienceService.selectExperience(apply.getE_num()));
				applyList.add(apply);
			}
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("experienceList", experienceList);
		map.put("applyList", applyList);
		
		return map;
	}

	@RequestMapping(value = "/getReivewList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getReivewList(HttpServletRequest req) {
		
		User user = (User)req.getSession().getAttribute("user");
		
		List<Apply> applyListOri = experienceService.userApplyList(user.getId());
		List<Apply> applyList = new ArrayList<Apply>();
		List<Review> reviewList = new ArrayList<Review>();
		List<Experience> experienceList = new ArrayList<Experience>();
		
		for(Apply apply : applyListOri) {
			/**
			 * apply state
			 * 4 = 작성완료
			 * 5 = 수정중
			 * 6 = 최종완료
			 */
			if(apply.getState() == 4 || apply.getState() == 5 || apply.getState() == 6) {
				experienceList.add(experienceService.selectExperience(apply.getE_num()));
				applyList.add(apply);
				reviewList.add(experienceService.getReview(apply.getA_num(), user.getId()));
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("experienceList", experienceList);
		map.put("applyList", applyList);
		map.put("reviewList", reviewList);
		
		return map;
	}

	@RequestMapping("/mypage/applyExperience")
	public ModelAndView applyExperience(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/experience/applyEx");

		return mav;
	}

	@RequestMapping("/mypage/applyDetail")
	public String applyDetail(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return "redirect:/user/login";
		}

		return "mypage/experience/applyDetail";
	}

	@RequestMapping(value = "/experience/getApply", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getApply(String eNum, HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();

		Experience experience = experienceService.selectExperience(Integer.parseInt(eNum));
		Apply apply = experienceService.showApply(experience.getE_num(), user.getId());
		Address add = userService.applyAddress(apply.getAddressNum());
		Channel channel = userService.applyChannel(user.getId(), apply.getC_num());
		Guide guide = experienceService.selectEpxerGuideForENum(experience.getE_num());

		String address = "(" + add.getZipCode() + ") " + add.getAddress() + " " + add.getDetail();
		map.put("experience", experience);
		map.put("apply", apply);
		map.put("address", address);
		map.put("user", user);
		map.put("channel", channel);
		map.put("guide", guide);

		return map;
	}

	@RequestMapping("/mypage/getExperCount")
	@ResponseBody
	public HashMap<String, Object> getEpxerienceCounter(HttpServletRequest req) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		User user = (User)req.getSession().getAttribute("user");
		List<Apply> applyList = experienceService.userApplyList(user.getId());
		List<Apply> userApplyOn = new ArrayList<Apply>();
		List<Apply> experienceApplyOn = new ArrayList<Apply>();
		List<Apply> nonCommitApplyList = new ArrayList<Apply>();
		List<Apply> commitApplyList = new ArrayList<Apply>();
		List<Channel> channelOriList = userService.userChannel(user.getId());
		List<Channel> channelList = new ArrayList<Channel>();
		Channel blogChannel = null;
		Channel instaChannel = null;
		Channel facebookChannel = null;
		Channel youtubeChannel = null;

		for(Apply apply : applyList) {
			if(apply.getState() == 1) {
				userApplyOn.add(apply);
			}

			if(apply.getState() == 2) {
				experienceApplyOn.add(apply);
			}

			if(apply.getState() == 3) {
				nonCommitApplyList.add(apply);
			}

			if(apply.getState() == 4 || apply.getState() == 5) {
				commitApplyList.add(apply);
			}
		}

		for(Channel channel : channelOriList) {
			if(channel.getChannelCode() == 1 && channel.isBasic() == true) {
				blogChannel = channel;
			}

			if(channel.getChannelCode() == 2 && channel.isBasic() == true) {
				instaChannel = channel;
			}

			if(channel.getChannelCode() == 3 && channel.isBasic() == true) {
				facebookChannel = channel;
			}

			if(channel.getChannelCode() == 4 && channel.isBasic() == true) {
				youtubeChannel = channel;
			}
		}

		channelList.add(blogChannel);
		channelList.add(instaChannel);
		channelList.add(facebookChannel);
		channelList.add(youtubeChannel);

		map.put("applyOnCount", userApplyOn.size());
		map.put("experApplyOnCount", experienceApplyOn.size());
		map.put("nonCommitCount", nonCommitApplyList.size());
		map.put("commitCount", commitApplyList.size());
		map.put("channelList", channelList);
		map.put("user", user);

		return map;
	}

	@RequestMapping("/mypage/applyExperList")
	public String applyExperList() {
		return "mypage/experience/applyExperList";
	}

	@RequestMapping("/mypage/selectExper")
	public ModelAndView selectExperList(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/experience/selectExper");

		return mav;

	}

	@RequestMapping(value = "/mypage/selectExperienceList", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> selectExperienceList(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		HashMap<String, Object> map = new HashMap<String,Object>();
		List<Apply> applyListOri = experienceService.userApplyList(user.getId());
		List<Apply> applyList = new ArrayList<Apply>();
		List<Experience> experienceList = new ArrayList<Experience>();

		for(Apply apply : applyListOri) {
			if(apply.getState() == 2) {
				applyList.add(apply);
			}
		}

		for(Apply apply : applyList) {
			experienceList.add(experienceService.selectExperience(apply.getE_num()));
		}

		map.put("applyList", applyList);
		map.put("experienceList", experienceList);

		return map;
	}

	@RequestMapping("/mypage/insertExper")
	public ModelAndView insertExperList(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/experience/experInsertList");

		return mav;
	}

	@RequestMapping("/mypage/registerReview")
	public ModelAndView registerReviewList(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/experience/registerReview");

		return mav;
	}

	@RequestMapping("/mypage/userInfo")
	public ModelAndView userInfo(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/userInfo");


		return mav;
	}

	@RequestMapping("/mypage/userInfoAdd")
	public ModelAndView userInfoAdd(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/user/login");
		}

		ModelAndView mav = new ModelAndView("mypage/userInfoAdd");


		return mav;
	}

	@RequestMapping(value = "/mypage/userInfoAdd/getData", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> userInfoAddData(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();

		if(user == null) {
			map.put("user", false);
			return map;
		}

		
		List<Interest> interestList = userService.userInterest(user.getId());
		List<Area> areaList = userService.userArea(user.getId());
		map.put("interestList", interestList);
		map.put("areaList", areaList);

		return map;
	}

	@RequestMapping(value = "/mypage/getUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getUserInfo(HttpServletRequest req) {
		HashMap<String, Object> result = new HashMap<String,Object>();
		User user = (User)req.getSession().getAttribute("user");
		List<Address> addressList = userService.userAddressList(user.getId());

		result.put("user", user);
		if(addressList.size() >= 1) {
			Address address = new Address();
			for(Address ad : addressList) {
				if(ad.isBasic()) {
					address = ad;
				}
			}
			result.put("address", address);
		} else {
			result.put("address", "");
		}

		List<Channel> channelList = new ArrayList<Channel>();
		channelList.add(userService.basicChannel(user.getId(), 1));
		channelList.add(userService.basicChannel(user.getId(), 2));
		channelList.add(userService.basicChannel(user.getId(), 3));
		channelList.add(userService.basicChannel(user.getId(), 4));
		result.put("channelList", channelList);
		

		return result;
	}

	@RequestMapping(value = "/mypage/modifyUser", method = RequestMethod.POST)
	@ResponseBody
	public boolean modifyUser(String password, String nickName, String phone, String zipcode, String address, String detail, String sAgr, HttpServletRequest req){
		User user = (User)req.getSession().getAttribute("user");
		boolean result = false;
		if(password != null) {
			if(password.length() >= 1) {
				String salt = SHA256.generateSalt();
				user.setPassword(SHA256.getEncrypt(password, salt));
				user.setUserKey(salt);
			}
		}

		user.setNickName(nickName);
		user.setPhone_number(phone);
		boolean setSAgr = false;
		if(sAgr.equals("on") || sAgr.equals("true")) {
			setSAgr = true;
		}
		user.setSAgr(setSAgr);

		Address userAddress = new Address(user.getId(), address, detail, zipcode, true);
		result = userService.updateUserInfo(user);

		if(address != null) {
			if(address.length() >= 1) {
				List<Address> addressList = userService.userAddressList(user.getId());
				if(addressList.size() == 0) {
					int res = userService.insertAddress(userAddress);
					if(res != 0) {
						result = true;
					}
				} else {
					userAddress.setANum(addressList.get(0).getANum());
					result = userService.updateAddress(userAddress);
				}
			}
		}

		HttpSession session = req.getSession();
		User userNew = userService.login(user.getId(), user.getPassword());

		if(userNew != null) {
			session.setAttribute("user", userNew);
		} else {
			System.out.println("로그인 실패 : 회원정보 없음 또는 비밀번호 틀림");
		}

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

		List<Address> userAdress = userService.userAddressList(user.getId());
		if(userAdress.size() <= 0) {
			mav.addObject("first", true);
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

		System.out.println(address.getAddress());

		address.setId(user.getId());
		int res = userService.insertAddress(address);
		if(res != 0) {
			result = true;
		}

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

	@RequestMapping(value = "/address/remove", method = RequestMethod.POST)
	@ResponseBody
	public boolean removeAddress(String addressNum, HttpServletRequest req) {

		int anum = Integer.parseInt(addressNum);
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
	
	@RequestMapping(value = "/mypage/channel", method = RequestMethod.POST)
	@ResponseBody
	public boolean myChannel(String link, String channel, HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		boolean result = false;

		if(channel.equals("naver")) {
			link = link.replace("https://blog.naver.com/", "");
			link = link.replace("https://m.blog.naver.com/", "");
			if(link.contains("/")) {
				link = link.replace("/", "");
			}
			Channel cha = new Channel(user.getId(), 1, link, true);
			Channel basicCha = userService.basicChannel(user.getId(), 1);

			if(basicCha != null) {
				cha.setC_num(basicCha.getC_num());
				result = userService.updateChanel(cha);
			} else {
				int res = userService.insertChannel(cha);
				if(res != 0) result = true;
			}
			
		}

		if(channel.equals("instagram")) {
			link = link.replace("https://www.instagram.com/", "");
			if(link.contains("/")) {
				link = link.replace("/", "");
			}
			Channel cha = new Channel(user.getId(), 2, channel, true);
			Channel basicCha = userService.basicChannel(user.getId(), 2);

			if(basicCha != null) {
				cha.setC_num(basicCha.getC_num());
				result = userService.updateChanel(cha);
			} else {
				int res = userService.insertChannel(cha);
				if(res != 0) result = true;
			}
		}

		if(channel.equals("youtube")) {
			Channel cha = new Channel(user.getId(), 4, channel, true);
			Channel basicCha = userService.basicChannel(user.getId(), 4);

			if(basicCha != null) {
				cha.setC_num(basicCha.getC_num());
				result = userService.updateChanel(cha);
			} else {
				int res = userService.insertChannel(cha);
				if(res != 0) result = true;
			}
		}

		if(channel.equals("facebook")) {
			Channel cha = new Channel(user.getId(), 3, channel, true);
			Channel basicCha = userService.basicChannel(user.getId(), 3);

			if(basicCha != null) {
				cha.setC_num(basicCha.getC_num());
				result = userService.updateChanel(cha);
			} else {
				int res = userService.insertChannel(cha);
				if(res != 0) result = true;
			}
		}

		return result;
	}

	@RequestMapping(value = "/mypage/userInfoAddModify", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> userInfoAddModify(String[] interestList, String[] mainLocate, String[] subLocate, HttpServletRequest req) {

		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		User user = (User)req.getSession().getAttribute("user");
		boolean res = false;
		
		if(user == null) {
			result.put("user", false);
			return result;
		}

		res = userService.deleteArea(user.getId());
		res = userService.deleteInterest(user.getId());

		for(String item : interestList) {
			Interest interest = new Interest(user.getId(), item);
			res = userService.addInterest(interest);
		}

		for(int i=0; i<mainLocate.length; i++){
			Area area = new Area(user.getId(), mainLocate[i], subLocate[i]);
			res = userService.addArea(area);
		}


		result.put("result", res);
		return result;
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

		result.put("navAdd", ""+navAddRes);
		result.put("result", email);
		return result;
	}

	@RequestMapping("/mypage/interestExper")
	public ModelAndView interestExper(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/");
		}

		ModelAndView mav = new ModelAndView("mypage/interestExper");

		return mav;
	}



	@RequestMapping("/mypage/point")
	public ModelAndView myPoint(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/");
		}

		ModelAndView mav = new ModelAndView("mypage/point");

		return mav;
	}

	@RequestMapping("/mypage/point/list")
	public String myPointList(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/point/add";
	}

	@RequestMapping(value = "/mypage/getPoint", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Integer> getUserPoint(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		if(user == null) {
			map.put("user", 0);
			return map;
		}

		Bank bank = userService.selectBank(user.getId());
		map.put("presentPoint", bank.getPresentPoint());
		map.put("cumalatePoint", bank.getCumalatePoint());

		return map;
	}

	@RequestMapping(value = "/mypage/point/cumalative", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> cumalativePointList(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();
		if(user == null) {
			map.put("user", false);
			return map;
		}
		
		List<Cumalative> cumalativeList = userService.selectCumalativeList(user.getId());
		map.put("cumalativeList", cumalativeList);

		return map;
	}

	@RequestMapping("/mypage/point/output")
	public String myPointOutList(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/point/output";
	}

	@RequestMapping(value = "/mypage/point/bankTake", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Object> bankTakePointList(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();
		if(user == null) {
			map.put("user", false);
			return map;
		}
		
		List<BankTake> cumalativeList = userService.selectTakeList(user.getId());
		map.put("bankTakeList", cumalativeList);

		return map;
	}

	@RequestMapping("/mypage/point/pointApply")
	public String myPointApply(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") == null) {
			return "redirect:/";
		}
		return "mypage/point/pointApply";
	}

	@RequestMapping(value = "/mypage/getPresentPoint", method = RequestMethod.GET)
	@ResponseBody
	public Bank getPresentPoint(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return null;
		}

		Bank bank = userService.selectBank(user.getId());
		return bank;
	}

	@RequestMapping(value = "/mypage/applyPointGo", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> applyPointGo(String holder, String bankName, String bankNumber, String applyPoint, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();
		boolean result = false;
		if(user == null) {
			map.put("user", false);
			return map;
		}

		

		Bank bank = userService.selectBank(user.getId());

		if(bank.getPresentPoint() < 10000) {
			map.put("pointShort", true);
			return map;
		}

		bank.setBankName(bankName);
		bank.setHolder(holder);
		bank.setBankNumber(bankNumber);
		bank.setPresentPoint(bank.getPresentPoint() - Integer.parseInt(applyPoint));
		result = userService.updateBank(bank);

		List<Cumalative> cumalativeList = userService.selectCumalativeList(user.getId());
		Date today = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(today);
		for(Cumalative cumalative : cumalativeList) {
			Calendar cumalCal = Calendar.getInstance();
			cumalCal.setTime(cumalative.getSaveDate());
			int todayMonth = cal.get(Calendar.MONTH);
			int cumalSaveDateMonth = cumalCal.get(Calendar.MONTH);
			if(todayMonth == cumalSaveDateMonth) {
				int todayDay = cal.get(Calendar.DATE);
				int cumalSaveDay = cumalCal.get(Calendar.DATE);

				if(cumalSaveDay <= 15) {
					if(todayDay <= 15) {
						map.put("day", false);
						return map;
					}
				} else if(cumalSaveDay > 15) {
					if(todayDay > 15) {
						map.put("day", true);
						return map;
					}
				}
			}
		}

		

		BankTake bankTake = new BankTake(bank.getB_num(), user.getId(), new Date(), "출금신청", Integer.parseInt(applyPoint), 0);
		result = userService.insertBankTake(bankTake);

		map.put("result", result);
		return map;
	}

	@RequestMapping("/mypage/inqury/list")
	public ModelAndView inquryList(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/user/login?locate=inquery");
		}

		ModelAndView mav = new ModelAndView("mypage/inqury/list");

		return mav;
	}

	@RequestMapping("/mypage/inqury/detail")
	public ModelAndView inquryDetail(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/");
		}

		ModelAndView mav = new ModelAndView("mypage/inqury/detail");

		return mav;
	}

	@RequestMapping("/mypage/inqury/regist")
	public ModelAndView inquryRegist(HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");

		if(user == null) {
			return new ModelAndView("redirect:/");
		}

		ModelAndView mav = new ModelAndView("mypage/inqury/regist");

		return mav;
	}

	@RequestMapping(value = "/mypage/channelModify", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Integer> channelModify(String channel, String id, HttpServletRequest req) {
		HashMap<String, Integer> map = new HashMap<String,Integer>();

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			map.put("user", -1);
			return map;
		}

		if(channel.equals("kakao")) {
			String channelID = user.getKakao_id();
			if(channelID == null) {
				boolean result = userService.onChannelKakaoId(user.getId(), id);
				if(result != false) {
					map.put("result", 1);
				}
			} else {
				boolean result = userService.offChannelKakaoId(user.getId());
				if(result != false) {
					map.put("result", 2);
				}
			}
		} else if(channel.equals("naver")) {
			String channelID = user.getNaver_id();
			if(channelID == null) {
				boolean result = userService.onChannelNaverId(user.getId(), id);
				if(result != false) {
					map.put("result", 1);
				}
			} else {
				boolean result = userService.offChannelNaverId(user.getId());
				if(result != false) {
					map.put("result", 2);
				}
			}
		} else if(channel.equals("facebook")) {
			String channelID = user.getFacebook_id();
			if(channelID == null) {
				boolean result = userService.onChannelFacebookId(user.getId(), id);
				if(result != false) {
					map.put("result", 1);
				}
			} else {
				boolean result = userService.offChannelFacebookId(user.getId());
				if(result != false) {
					map.put("result", 2);
				}
			}
		}

		HttpSession session = req.getSession();
		User userNew = userService.login(user.getId(), user.getPassword());

		if(userNew != null) {
			session.setAttribute("user", userNew);
		} else {
			System.out.println("로그인 실패 : 회원정보 없음 또는 비밀번호 틀림");
		}


		return map;
	} 

	@RequestMapping("/find/password")
	public String findPassword() {
		return "ntf/join/findPassword";
	}

	@RequestMapping(value = "/password/find", method = RequestMethod.POST)
	@ResponseBody
	public String passwordFind(String id, String phone) {
		String userID = userService.findUser(id, phone);
		return userID;
	}

	@RequestMapping("/change/password/view")
	public ModelAndView chagePasswordView(String id, int code, String phone) {

		String userID = userService.findUser(id, phone);

		if(userID == null || userID == "" || userID.length() <= 0) {
			return new ModelAndView("redirect:/user/find/password");
		}

		ModelAndView mav = new ModelAndView("ntf/join/change/password");
		mav.addObject("code", code);
		mav.addObject("id", id);
		return mav;
	}

	@RequestMapping(value = "/change/password/find", method = RequestMethod.POST)
	@ResponseBody
	public boolean changePasswordtoFind(String id, String password) {
		String salt = SHA256.generateSalt();
		boolean result = userService.updatePasswordtoFind(id, SHA256.getEncrypt(password, salt), salt);

		return result;
	}
	
	

}
