package kr.com.amean.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Channel;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.ExperienceSerivce;
import kr.com.amean.service.UserService;


@Controller
@RequestMapping("experience")
public class ExperienceController {
	
	@Autowired ExperienceSerivce experienceService;
	@Autowired UserService userService;

	public static void alert(HttpServletResponse response, String text) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		out.println("<script>alert('" + text + "');</script>");
		out.flush();
	}

	@RequestMapping("")
	public ModelAndView experienceView(int mCategory) {

		ModelAndView mav = new ModelAndView("tf/experience/list");
		List<String> filterList = new ArrayList<String>();
		String tagName = null;
		String categoryName = "";

		if(mCategory == 1) {
			tagName = "product";
			categoryName = "제품";
		} else if(mCategory == 2) {
			tagName = "shop";
			categoryName = "방문";
		} else if(mCategory == 3) {
			categoryName = "기자단";
		} else if(mCategory == 4) {
			tagName = "service";
			categoryName = "서비스";
		} else if(mCategory == 5) {
			tagName = "ealry";
			categoryName = "얼리버드";
		} else if(mCategory == 6) {
			categoryName = "프리미엄";
		}

		if(mCategory == 1 || mCategory == 2 || mCategory == 4 || mCategory == 5) {
			try {
				String filePath = this.getClass().getResource("/list/experienceFilterList.xml").getPath();
				filePath = filePath.replaceFirst("%20", " ");
				File file = new File(filePath);
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder builder = factory.newDocumentBuilder();
				Document document = builder.parse(file);
				NodeList nodeList = document.getElementsByTagName(tagName);
				NodeList mCategoryNodeList = document.getElementsByTagName("mCategory");

				for(int temp=0; temp<nodeList.getLength(); temp++) {
					Node node = nodeList.item(temp);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element)node;
						filterList.add(getTagValue("item", element));
					}
				}

				mav.addObject("filterList", filterList);

			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		mav.addObject("categoryName", categoryName);
		return mav;
	}

	private static String getTagValue(String tag, Element element) {
		NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
		return nodeList.item(0).getNodeValue();
	}

	@RequestMapping(value = "/getExper")
	@ResponseBody
	public HashMap<String, Object> getExperienceList(String mCategory, String sCategory, String area, String subArea, String kind, String sort) {

		boolean kind_n = false;
		boolean kind_i = false;
		boolean kind_s = false;
		boolean kind_h = false;
		boolean kind_r = false;

		if(kind != null) {
			if(kind.equals("kind_n")) {
				kind_n = true;
			}
	
			if(kind.equals("kind_i")) {
				kind_i = true;
			}
	
			if(kind.indexOf("or") >= 0) {
				String[] kindArray = kind.split("or");

				for(String k : kindArray) {
					if(k.equals("kind_s")) {
						kind_s = true;
					}

					if(k.equals("kind_h")) {
						kind_h = true;
					}

					if(k.equals("kind_r")) {
						kind_r = true;
					}
				}
			}
		}
		

		List<Experience> experienceList = null;
		List<Experience> resultExperienceList = new ArrayList<Experience>();
		List<Apply> applyList = null;
		String mainCategory = null;
		Date now = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(now);
		calendar.clear(Calendar.SECOND);
		calendar.clear(Calendar.MINUTE);
		calendar.clear(Calendar.HOUR_OF_DAY);
		calendar.add(Calendar.DATE, -1);
		now = calendar.getTime();

		if(Integer.parseInt(mCategory) == 1) {
			mainCategory = "제품";
		} else if(Integer.parseInt(mCategory) == 2) {
			mainCategory = "방문";
		} else if(Integer.parseInt(mCategory) == 3) {
			mainCategory = "기자단";
		} else if(Integer.parseInt(mCategory) == 4) {
			mainCategory = "프리미엄";
		}

		experienceList = experienceService.selectExperienceList(mainCategory);
		for(Experience experience : experienceList) {
			if(!experience.isOpen()) continue;
			resultExperienceList.add(experience);
		}
		

		for(int i=0; i<=experienceList.size()-1; i++) {
			if(now.after(experienceList.get(i).getEndDate())) {
				resultExperienceList.remove(experienceList.get(i));	
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(sCategory != null && sCategory.length() > 0) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).getSCategory().equals(sCategory)) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}
		
		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(area != null && area.length() > 0) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).getArea().equals(area)) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(subArea != null && subArea.length() > 0 && !subArea.equals("")) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).getSubArea().equals(subArea)) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(kind_n) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).isKind_n()) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(kind_i) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).isKind_i()) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(kind_h) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).isKind_h()) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(kind_r) {
			for(int i=0; i<=experienceList.size()-1; i++) {
				if(!experienceList.get(i).isKind_r()) {
					resultExperienceList.remove(experienceList.get(i));
				}
			}
		}

		experienceList.clear();
		for(Experience experience : resultExperienceList) {
			experienceList.add(experience);
		}

		if(sort != null) {
			int s = Integer.parseInt(sort);
			if(s == 2) {
			
				Collections.sort(experienceList, new Comparator<Experience>() {
					@Override
					public int compare(Experience o1, Experience o2) {
						if(o1.getEndDate().getTime() - o2.getEndDate().getTime() > 0) {
							return -1;
						} else if(o1.getEndDate().getTime() - o2.getEndDate().getTime() < 0) {
							return 1;
						} else {
							return 0;
						}
					}
				});
			} else if(s == 1) {
				Collections.sort(experienceList, new Comparator<Experience>() {

					@Override
					public int compare(Experience o1, Experience o2) {
						if(o1.getApplyCount() > o2.getApplyCount()) {
							return 1;
						} else if(o1.getApplyCount() < o2.getApplyCount()) {
							return -1;
						} else {
							return 0;
						}
					}
					
				});
			}
		}
		

		HashMap<String, Object> result = new HashMap<String,Object>();
		result.put("experienceList", experienceList);
		result.put("applyList", applyList);
		return result;
	}

	@RequestMapping("detail")
	public ModelAndView experienceDetail(String eNum) {
		
		ModelAndView mav = new ModelAndView("tf/experience/detail");
		
		return mav;
	}

	@RequestMapping(value = "/detail/getExperience", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> getExperience(String eNum, HttpServletRequest req) {

		Experience experience = experienceService.selectExperience(Integer.parseInt(eNum));
		Guide guide = experienceService.selectEpxerGuideForENum(Integer.parseInt(eNum));
		boolean interestCampaignCheck = false;

		User user = (User)req.getSession().getAttribute("user");
		if(user != null) {
			List<InterestCampaign> interestCampaigns = experienceService.selectInterestCampaignList(user.getId());
			for(InterestCampaign interestCampaign : interestCampaigns) {
				if(interestCampaign.getE_num() == Integer.parseInt(eNum)) {
					interestCampaignCheck = true;
				}
			}
		}


		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("experience", experience);
		map.put("guide", guide);
		map.put("interestCampaignCheck", interestCampaignCheck);

		return map;
	}

	@RequestMapping(value = "/cancelApply", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> experienceDelete(String eNum, HttpServletRequest request) throws Exception {
		User user = (User)request.getSession().getAttribute("user");
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		if(user == null) {
			result.put("user", false);
			return result;
		}
		
		Apply apply = experienceService.showApply(Integer.parseInt(eNum), user.getId());

		
		if(apply != null) {
			result.put("result", experienceService.cancelApply(apply.getA_num(), user.getId()));
		} else {
			result.put("already", false);
			return result;
		}
		

		return result;
	}


	
	@RequestMapping("apply")
	public ModelAndView experienceApply(HttpServletRequest req, int eNum) {

		User user = (User)req.getSession().getAttribute("user");
		if(user == null) {
			return new ModelAndView("redirect:/experience/detail?eNum="+eNum);
		}

		Experience experience = experienceService.selectExperience(eNum);
		List<Consent> consentList = experienceService.selectConsent(experience.getE_num());
		for(Consent consent:consentList) {
			System.out.println("apply consent : " + consent.getTitle());
		}
		List<Address> addressList = userService.userAddressList(user.getId());
		Address address = null;
		if(addressList.size() >= 1) {
			for(Address ad : addressList) {
				if(ad.isBasic() == true) {
					address = ad;
				}
			}
		}
		ModelAndView mav = new ModelAndView("tf/experience/apply");
		mav.addObject("user", user);
		mav.addObject("experience", experience);
		mav.addObject("address", address);
		mav.addObject("consentList", consentList);

		Apply apply = experienceService.showApply(eNum, user.getId());
		mav.addObject("apply", apply);

		Guide guide = experienceService.selectEpxerGuideForENum(experience.getE_num());
		mav.addObject("guide", guide);

		List<Channel> channelList = userService.userChannel(user.getId());
		Channel navChannel = new Channel();
		Channel insChannel = new Channel();
		for(Channel checkChannel : channelList) {
			if(checkChannel.getChannelCode() == 1 && checkChannel.isBasic()) {
				navChannel = checkChannel;
			} else if(checkChannel.getChannelCode() == 2 && checkChannel.isBasic()) {
				insChannel = checkChannel;
			}
		}

		mav.addObject("navChannelURL", navChannel.getUrl());
		mav.addObject("insChannelURL", insChannel.getUrl());

		return mav;
	}

	@RequestMapping(value = "experienceApply")
	@ResponseBody
	public boolean experienceApply(String eNum, String zipcode, String address, String detail, String caution_agree, String agree_marketing, String agree_userinfo, String navId, String insId, String userAnser, HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		int e_num = Integer.parseInt(eNum);
		boolean result = false;
		if(user == null) {
			return false;
		}
		
		int channelNumber = 0;
		if(navId != null) {
			navId = navId.replace("https://blog.naver.com/", "");
			navId = navId.replace("https://m.blog.naver.com/", "");

			Channel basicChannel = userService.basicChannel(user.getId(), 1);
			boolean basic = false;

			if(basicChannel == null) {
				basic = true;
				Channel channel = new Channel(user.getId(), 1, navId, basic);
				channelNumber= userService.insertChannel(channel);
			} else {

				if(basicChannel.getUrl().equals(navId)) {
					channelNumber = basicChannel.getC_num();
				} else {
					Channel channel = new Channel(user.getId(), 1, navId, basic);
					channelNumber= userService.insertChannel(channel);
				}
			}

			
		} else if(insId != null) {
			insId = insId.replace("https://www.instagram.com/", "");

			Channel basicChannel = userService.basicChannel(user.getId(), 2);
			boolean basic = false;

			if(basicChannel == null) {
				basic = true;
				Channel channel = new Channel(user.getId(), 2, insId, basic);
				channelNumber = userService.insertChannel(channel);
			} else {
				if(basicChannel.getUrl().equals(insId)) {
					channelNumber = basicChannel.getC_num();
				} else {
					Channel channel = new Channel(user.getId(), 2, insId, basic);
					channelNumber = userService.insertChannel(channel);
				}
			}

		} else {
			Experience experience = experienceService.selectExperience(e_num);
			if(experience.isKind_n()) {
				Channel userChannel = userService.basicChannel(user.getId(), 1);
				channelNumber = userChannel.getC_num();
			} else if(experience.isKind_i()) {
				Channel userChannel = userService.basicChannel(user.getId(), 2);
				channelNumber = userChannel.getC_num();
			}
		}
		
		int addressNumber = 0;
		List<Address> addressList = userService.userAddressList(user.getId());
		Address basicAddress = null;
		if(addressList.size() > 0) {
			for(Address add : addressList) {
				if(add.isBasic()) {
					basicAddress = add;
				}
			}

			if(basicAddress != null) {
				if(!basicAddress.getAddress().equals(address) || !basicAddress.getZipCode().equals(zipcode) || !basicAddress.getDetail().equals(detail)) {
					Address userAddress = new Address(user.getId(), address, detail, zipcode, false);
					addressNumber = userService.insertAddress(userAddress);
				} else {
					addressNumber = basicAddress.getANum();
					System.out.println("basicAddress aNum : " + basicAddress.getANum());
				}
			} else {
				Address userAddress = new Address(user.getId(), address, detail, zipcode, true);
				addressNumber = userService.insertAddress(userAddress);
			}
			
		} else {
			Address userAddress = new Address(user.getId(), address, detail, zipcode, true);
			addressNumber = userService.insertAddress(userAddress);
			System.out.println("Dfdfdfa");
		}

		Date today = new Date();

		Apply apply = new Apply();
		apply.setId(user.getId());
		apply.setE_num(e_num);
		apply.setAddressNum(addressNumber);
		apply.setInsertDate(today);
		apply.setC_num(channelNumber);
		apply.setState(1);
		apply.setCancel_date(null);
		apply.setCancel_reason(null);
		apply.setCancel_state(false);

		System.out.println("addressNumber : " + addressNumber);
		System.out.println("channelNumber : " + channelNumber);

		int res = experienceService.insertApply(apply);

		if(res != 0 ) {
			experienceService.addApplyCount(e_num);
			result = true;

			if(userAnser != null && userAnser != "") {
				String[] userAnserArray = userAnser.split(",");
				List<Consent> consentList = experienceService.selectConsent(e_num);

				for(int i=0; i<= userAnserArray.length-1; i++) {
					UserConsent userConsent = new UserConsent(consentList.get(i).getC_num(), res, user.getId(), userAnserArray[i]);
					experienceService.registUserConsent(userConsent);
				}
			}
		}

		return result;
	}

	@RequestMapping("applyAddress")
	@ResponseBody
	public HashMap<String, Object> basicAddress(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("basicAddress", userService.basicAddress(user.getId()));
		List<Address> list = userService.userAddressList(user.getId());
		map.put("addressTag", list);
		return map;
	}

	@RequestMapping("selectAddress")
	@ResponseBody
	public Address activeAddress(HttpServletRequest req, int aNum) {
		User user = (User)req.getSession().getAttribute("user");
		return userService.activeAddress(user.getId(), aNum);
	}

	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> insertReview(String eNum, String aNum, String blog, String instagram, MultipartFile homepage, MultipartFile store, MultipartFile receipt, HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		boolean inserReviewResult = false;
		int a_num = Integer.parseInt(aNum);
		int e_num = Integer.parseInt(eNum);

		if(user == null) {
			HashMap<String, Boolean> userFalse = new HashMap<String,Boolean>();
			userFalse.put("user", false);
			return userFalse;
		}

		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		
		String homepageImg = "";
		String storeImg = "";
		String receiptImg = "";
		if(homepage != null && homepage.toString() != "") homepageImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), homepage, req, e_num);
		if(store != null && store.toString() != "") storeImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), store, req, e_num);
		if(receipt != null && receipt.toString() != "") receiptImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), receipt, req, e_num);

		Review review = new Review(a_num, user.getId(), e_num, new Date(), blog, instagram, homepageImg, storeImg, receiptImg, 1);
		int reviewNum = experienceService.experienceReport(review);
		if(reviewNum != 0) inserReviewResult = true;

		//boolean reviewCaptureUpdate = experienceService.reviewReport(reviewNum, blog, instagram, homepageImg, storeImg, receiptImg);
		//if(reviewCaptureUpdate) inserReviewResult = true;
		///else inserReviewResult = false;

		boolean submitReport = experienceService.submitReport(a_num);
		if(submitReport) inserReviewResult = true;
		else inserReviewResult = false;

		result.put("result", inserReviewResult);
		return result;
	}

	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Boolean> updateReview(String rNum, String eNum, String blog, String instagram, MultipartFile homepage, MultipartFile store, MultipartFile receipt, HttpServletRequest req) {

		User user = (User)req.getSession().getAttribute("user");
		boolean inserReviewResult = false;
		int r_num = Integer.parseInt(rNum);
		int e_num = Integer.parseInt(eNum);

		if(user == null) {
			HashMap<String, Boolean> userFalse = new HashMap<String,Boolean>();
			userFalse.put("user", false);
			return userFalse;
		}

		
		HashMap<String, Boolean> result = new HashMap<String,Boolean>();
		
		String homepageImg = "";
		String storeImg = "";
		String receiptImg = "";
		if(homepage != null) homepageImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), homepage, req, e_num);
		if(store != null) storeImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), store, req, e_num);
		if(receipt != null) receiptImg = getReivewCapture(user.getNickName()+ "_"+user.getId(), receipt, req, e_num);

		Review review = new Review();
		review.setR_num(r_num);
		review.setBlog(blog);
		review.setInstagram(instagram);
		review.setHomepage(homepageImg);
		review.setStore(storeImg);
		review.setReceipt(receiptImg);
		review.setState(1);

		boolean updateReview = experienceService.modifyReview(review);
		
		if(updateReview) inserReviewResult = true;
		else inserReviewResult = false;

		result.put("result", inserReviewResult);
		return result;
	}

	public String getReivewCapture(String fileName, MultipartFile file, HttpServletRequest request, int e_num) {
		String result = null;
        String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;

        if(!file.getOriginalFilename().equals("")) {
            fileRoot = contextRoot + "resources/upload/experience/"+e_num + "/review/";
            String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String savedFileName = fileName + extension;
            File fileUpload = new File(fileRoot + savedFileName);
            System.out.println("save locate : " + fileRoot + savedFileName);
            
            try {
                if(!fileUpload.exists()) {
                    fileUpload.mkdirs();
                }
                file.transferTo(fileUpload);
                result = "resources/upload/experience/"+e_num + "/review/" + savedFileName;
            } catch (Exception e) {
                e.printStackTrace();
                result = null;
            }
        }

		return result;
	}

	@RequestMapping(value = "/relative/list", method = RequestMethod.POST)
	@ResponseBody
	public List<Experience> relativeList(String eNum) {
		int e_num = Integer.parseInt(eNum);

		Experience experience = experienceService.selectExperience(e_num);

		List<Experience> experienceListOri = experienceService.selectExperienceList();
		List<Experience> experienceList = new ArrayList<Experience>();

		for(Experience ex : experienceListOri) {
			if(ex.isOpen()) {
				if(ex.getSCategory().equals(experience.getSCategory())) {

					if(ex.getE_num() == experience.getE_num()) {
						continue;
					}

					experienceList.add(ex);

					if(experienceList.size() >= 5) {
						break;
					}
				}
			}
		}

		if(experienceList.size() < 5) {
			for(Experience ex : experienceListOri) {
				if(ex.isOpen()) {
					if(ex.getMCategory().equals(experience.getMCategory())) {

						if(ex.getE_num() == experience.getE_num()) {
							continue;
						}

						experienceList.add(ex);
					}

					if(experienceList.size() >= 5) {
						break;
					}	
				}
			}
		}

		if(experienceList.size() < 5) {
			for(Experience ex : experienceListOri) {
				if(ex.isOpen()) {
					if(ex.getE_num() == experience.getE_num()) {
						continue;
					}
					experienceList.add(ex);

					if(experienceList.size() >= 5) {
						break;
					}	
				}
			}
		}

		return experienceList;
	}
	
	@RequestMapping("/premium/applyView")
	public String premiumApplyView(HttpServletRequest req) {

		return "tf/experience/premiumApply";
	}

	@RequestMapping("/category")
	public String experCategory() {
		return "tf/experience/category";
	}

	@RequestMapping(value = "/interest/insert", method = RequestMethod.POST)
	@ResponseBody
	public boolean insertInterestCampaign(String eNum, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) return false;

		InterestCampaign interestCampaign = new InterestCampaign(Integer.parseInt(eNum), user.getId());

		return experienceService.registInterestCampaign(interestCampaign);

	}

	@RequestMapping(value = "/interest/delete", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteInterestCampaign(String eNum, HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) return false;

		List<InterestCampaign> interestCampaigns = experienceService.selectInterestCampaignList(user.getId());
		int e_num = Integer.parseInt(eNum);
		int ic_num = 0;
		
		for(InterestCampaign interestCampaign : interestCampaigns) {
			if(interestCampaign.getE_num() == e_num) {
				ic_num = interestCampaign.getIc_num();
			}
		}

		boolean reuslt = experienceService.deleteInterestCampaign(ic_num);

		return reuslt;

	}

	@RequestMapping(value = "/interestCampaign/list", method = RequestMethod.GET)
	@ResponseBody
	public List<Experience> deleteInterestCampaign(HttpServletRequest req) {
		User user = (User)req.getSession().getAttribute("user");
		if(user == null) return null;

		List<InterestCampaign> interestCampaigns = experienceService.selectInterestCampaignList(user.getId());
		List<Experience> experienceList = new ArrayList<Experience>();
		
		for(InterestCampaign interestCampaign : interestCampaigns) {
			experienceList.add(experienceService.selectExperience(interestCampaign.getE_num()));
		}

		return experienceList;

	}
	
}
