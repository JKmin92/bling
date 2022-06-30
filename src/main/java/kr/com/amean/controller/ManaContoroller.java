package kr.com.amean.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Channel;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.BoardService;
import kr.com.amean.service.ExperienceSerivce;
import kr.com.amean.service.UserService;


@Controller
@RequestMapping("/mana")
public class ManaContoroller {

    @Autowired
    ExperienceSerivce experienceSerivce;

    @Autowired
    UserService userService;

    @Autowired
    BoardService boardService;
    
    @RequestMapping("")
    public ModelAndView manaMain() {
        List<Experience> experienceList = experienceSerivce.selectExperienceList();
        ModelAndView mav = new ModelAndView("ntf/manage/experList");
        mav.addObject("experienceList", experienceList);
        return mav;
    }

    @RequestMapping("/experApply")
    public ModelAndView experApply(int e_num) {
        ModelAndView mav = new ModelAndView("ntf/manage/experApply");
        Experience experience = experienceSerivce.selectExperience(e_num);
        List<Apply> applyList = experienceSerivce.applyListManager(e_num);
        Guide guide = experienceSerivce.selectEpxerGuideForENum(e_num);
        int gNum = 0;
        if(guide != null) gNum = guide.getGNum();

        mav.addObject("experience", experience);
        mav.addObject("applyList", applyList);
        mav.addObject("gNum", gNum);
        return mav;
    }

    @RequestMapping(value = "/getApply", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> getApply(String aNum) {

        int a_num = Integer.parseInt(aNum);

        Apply apply = experienceSerivce.selectApply(a_num);
        Address addressData = userService.applyAddress(apply.getAddressNum());
        Experience experience = experienceSerivce.selectExperience(apply.getE_num());
        User user = userService.userData(apply.getId());

        HashMap<String, Object> result = new HashMap<String,Object>();

        if(experience.isKind_n()) {

            List<Channel> userChannelList = userService.userChannel(user.getId());
            Channel applyChannel = new Channel();
            for(Channel thisChannel : userChannelList) {
                if(thisChannel.getC_num() == apply.getC_num() && thisChannel.getChannelCode() == 1) {
                    applyChannel = thisChannel;
                }
            }

            
            List<Integer> visitCount = new ArrayList<Integer>();
            result.put("channel", applyChannel.getUrl());

            try {
                URL url = new URL("https://blog.naver.com/NVisitorgp4Ajax.nhn?blogId=" + applyChannel.getUrl());
                HttpsURLConnection con = (HttpsURLConnection)url.openConnection();

                con.setDoOutput(true);
                con.setRequestMethod("GET");

                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
                String line;
                String resultLine ="";

                while((line=in.readLine()) != null) {
                    resultLine += line;
                }

                in.close();

                Document xml = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new ByteArrayInputStream(resultLine.getBytes()));
                xml.getDocumentElement().normalize();

                NodeList nodeList = xml.getElementsByTagName("visitorcnt");

                for(int i=0; i<nodeList.getLength(); i++) {
                    
                    Node node = nodeList.item(i);
                    if(node.getNodeType() == Node.ELEMENT_NODE) {
                        Element element = (Element)node;
                        visitCount.add(Integer.parseInt(element.getAttribute("cnt")));
                    }
                }
                
                int maxVisitCount = visitCount.get(0);
                int minVisitCount = visitCount.get(0);

                for(int visit : visitCount) {
                    if(maxVisitCount < visit) {
                        maxVisitCount = visit;
                    }

                    if(minVisitCount > visit) {
                        minVisitCount = visit;
                    }
                }
                String visitRange = minVisitCount + " ~ " + maxVisitCount;
                result.put("visitRange", visitRange);
            } catch(Exception e) {
                e.printStackTrace();
            }
        } else if(experience.isKind_i()) {
            List<Channel> userChannelList = userService.userChannel(user.getId());
            Channel applyChannel = new Channel();
            
            for(Channel thisChannel : userChannelList) {
                if(thisChannel.getC_num() == apply.getC_num() && thisChannel.getChannelCode() == 2) {
                    applyChannel = thisChannel;
                }
            }
            result.put("channel", applyChannel.getUrl());
        }

        if(experience.getMCategory().equals("제품")) {
            String address = "(" + addressData.getZipCode() + ")" + addressData.getAddress() + " " + addressData.getDetail();
            result.put("address", address);
        }
        
        result.put("user", user);
        result.put("experience", experience);


        return result;
    }

    @RequestMapping(value = "changeOpen", method = RequestMethod.POST)
    @ResponseBody
    public boolean changeOpen(String eNum) {
        int e_num = Integer.parseInt(eNum);
        boolean open;
        Experience experience = experienceSerivce.selectExperience(e_num);

        if(experience.isOpen()) open = false;
        else open = true;

        return experienceSerivce.updateExperienceOpen(e_num, open);
    }

    @RequestMapping("/addExper")
    public ModelAndView addExper() {
        ModelAndView mav = new ModelAndView("ntf/manage/addExper");
        List<String> mCategoryList = new ArrayList<String>();
        List<Integer> mCategoryCodeList = new ArrayList<Integer>();
        try {
            String filePath = this.getClass().getResource("/list/experienceFilterList.xml").getPath();
            filePath = filePath.replaceFirst("%20", " ");
            File file = new File(filePath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(file);
            NodeList nodeList = document.getElementsByTagName("mCategory");

            for(int temp=0; temp<nodeList.getLength(); temp++) {
                Node node = nodeList.item(temp);
                if(node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element)node;
                    mCategoryList.add(getTagValue("item", element));
                    mCategoryCodeList.add(Integer.parseInt(getTagValue("code", element)));
                }
            }

            mav.addObject("mCategoryList", mCategoryList);
            mav.addObject("mCategoryCodeList", mCategoryCodeList);

        } catch(Exception e) {
            e.printStackTrace();
        }
        return mav;
    }

    @RequestMapping(value = "/addExper/sCategory", method=RequestMethod.POST)
    @ResponseBody
    public List<String> addExperMCategory(String code) {
        List<String> result = new ArrayList<String>();
        String dataMatch = "product";

        if(code.equals("2")) {
            dataMatch = "shop";
        }

        try {
            String filePath = this.getClass().getResource("/list/experienceFilterList.xml").getPath();
            filePath = filePath.replaceFirst("%20", " ");
            File file = new File(filePath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(file);
            NodeList nodeList = document.getElementsByTagName(dataMatch);

            for(int temp=0; temp<nodeList.getLength(); temp++) {
                Node node = nodeList.item(temp);
                if(node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element)node;
                    result.add(getTagValue("item", element));
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    private static String getTagValue(String tag, Element element) {
		NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
		return nodeList.item(0).getNodeValue();
	}

    @RequestMapping("/updateExper")
    public ModelAndView updateExper(int e_num) {

        Experience experience = experienceSerivce.selectExperience(e_num);
        ModelAndView mav = new ModelAndView("ntf/manage/addExper");

        List<String> mCategoryList = new ArrayList<String>();
        List<Integer> mCategoryCodeList = new ArrayList<Integer>();

        try {
            String filePath = this.getClass().getResource("/list/experienceFilterList.xml").getPath();
            filePath = filePath.replaceFirst("%20", " ");
            File file = new File(filePath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(file);
            NodeList nodeList = document.getElementsByTagName("mCategory");

            for(int temp=0; temp<nodeList.getLength(); temp++) {
                Node node = nodeList.item(temp);
                if(node.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element)node;
                    mCategoryList.add(getTagValue("item", element));
                    mCategoryCodeList.add(Integer.parseInt(getTagValue("code", element)));
                }
            }

            mav.addObject("mCategoryList", mCategoryList);
            mav.addObject("mCategoryCodeList", mCategoryCodeList);

        } catch(Exception e) {
            e.printStackTrace();
        }

        
        mav.addObject("experience", experience);
        return mav;
    }

    @RequestMapping("/userList")
    public String userList() {
        return "ntf/manage/userList";
    }

	@RequestMapping(value = "/insertExperience", method = RequestMethod.POST)
    @ResponseBody
	public HashMap<String, Object> insertExperience (String mCategory, String sCategory, String title, String subject, String area, String headCount, String kind_n, String kind_i, String kind_h, String kind_s, String kind_r, String service, String startDate, String endDate, String desDate, String closeDate, HttpServletRequest request) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Experience experience = new Experience();

        experience.setMCategory(mCategory);
        experience.setSCategory(sCategory);
        experience.setTitle(title);
        experience.setSubject(subject);
        experience.setService(service);
        experience.setArea(area);
        experience.setHeadCount(Integer.parseInt(headCount));
        experience.setKind_n(Boolean.parseBoolean(kind_n));
        experience.setKind_i(Boolean.parseBoolean(kind_i));
        experience.setKind_h(Boolean.parseBoolean(kind_h));
        experience.setKind_s(Boolean.parseBoolean(kind_s));
        experience.setKind_r(Boolean.parseBoolean(kind_r));
        experience.setStartDate(formatter.parse(startDate)); 
        experience.setEndDate(formatter.parse(endDate));
        experience.setDesDate(formatter.parse(desDate));
        experience.setCloseDate(formatter.parse(closeDate));
        experience.setOpen(false);

		int resultExperience = experienceSerivce.addExperience(experience);
        boolean iu = false;
        if(resultExperience != 0 && resultExperience > 0) {
            iu = true;
        }

        HashMap<String, Object> result = new HashMap<String,Object>();
        result.put("e_num", resultExperience);
        result.put("iu", iu);
		return result;
	}

    @RequestMapping(value = "/updateExperience", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> updateExperience (String e_num, String mCategory, String sCategory, String title, String subject, String area, String headCount, String kind_n, String kind_i, String kind_h, String kind_s, String kind_r, String service, String startDate, String endDate, String desDate, String closeDate, HttpServletRequest request) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Experience experience = new Experience();

        experience.setE_num(Integer.parseInt(e_num));
        experience.setMCategory(mCategory);
        experience.setSCategory(sCategory);
        experience.setTitle(title);
        experience.setSubject(subject);
        experience.setService(service);
        experience.setArea(area);
        experience.setHeadCount(Integer.parseInt(headCount));
        experience.setKind_n(Boolean.parseBoolean(kind_n));
        experience.setKind_i(Boolean.parseBoolean(kind_i));
        experience.setKind_h(Boolean.parseBoolean(kind_h));
        experience.setKind_s(Boolean.parseBoolean(kind_s));
        experience.setKind_r(Boolean.parseBoolean(kind_r));
        experience.setStartDate(formatter.parse(startDate)); 
        experience.setEndDate(formatter.parse(endDate));
        experience.setDesDate(formatter.parse(desDate));
        experience.setCloseDate(formatter.parse(closeDate));

        boolean resultExperience = experienceSerivce.updateExperience(experience);

        HashMap<String, Object> result = new HashMap<String,Object>();
        result.put("e_num", experience.getE_num());
        result.put("iu", resultExperience);
    
        return result;
    }
    
    @RequestMapping("/addCons")
    public ModelAndView addConsent(String e_num) {
        ModelAndView mav = new ModelAndView("ntf/manage/addConsent");
        int eNum = Integer.parseInt(e_num);
        Experience experience = experienceSerivce.selectExperience(eNum);
        List<Consent> consentList = experienceSerivce.selectConsent(eNum);
        mav.addObject("experience", experience);
        mav.addObject("consentList", consentList);
        return mav;
    }

    @RequestMapping(value = "/insertConsent", method = RequestMethod.POST)
    public ModelAndView inserConsent(String e_num, MultipartFile mainImg, String content, Consent consents, HttpServletRequest request) {

        int eNum = Integer.parseInt(e_num);
        
        String thumnail = imageFileUpload("thumnail", mainImg, request, eNum);
        experienceSerivce.updateExperImage(thumnail, content, eNum);

        if(consents.getConsentList() != null) {
            for(Consent consent : consents.getConsentList()) {
                consent.setE_num(eNum);
                experienceSerivce.insertConsent(consent);
            }
        }
        

        ModelAndView mav = new ModelAndView("redirect:/mana/addExperGuide");
        mav.addObject("e_num", eNum);
        return mav;
    }

    @RequestMapping(value = "/updateConsent", method = RequestMethod.POST)
    public ModelAndView updateConsent(String e_num, MultipartFile mainImg, String content, Consent consents, HttpServletRequest request) {

        int eNum = Integer.parseInt(e_num);
        Experience experience = experienceSerivce.selectExperience(eNum);
        String thumnail = experience.getMain_img();
        
        if(mainImg != null) {
            thumnail = imageFileUpload("thumnail", mainImg, request, eNum);
        }

        experienceSerivce.updateExperImage(thumnail, content, eNum);

        List<Consent> experConsentList = experienceSerivce.selectConsent(eNum);
        boolean equalsCheck = false;

        if(consents.getConsentList() != null) {
            for(Consent consent : consents.getConsentList()) {
                if(experConsentList != null) {
                    for(Consent checkConsent : experConsentList) {
                        if(consent.getC_num() == checkConsent.getC_num()) {
                            experienceSerivce.updateConsent(consent);
                            equalsCheck = true;
                            break;
                        }
                    }
                }

                if(!equalsCheck) {
                    consent.setE_num(eNum);
                    experienceSerivce.insertConsent(consent);
                }
                equalsCheck = false;
            }
        } else {
            if(experConsentList != null) {
                for(Consent consent : experConsentList) {
                    experienceSerivce.removeConsent(consent.getC_num());
                }
            }
            
        }
        

        ModelAndView mav = new ModelAndView("redirect:/mana/addExperGuide");
        mav.addObject("e_num", eNum);
        return mav;
    }

    public static String imageFileUpload(String fileName, MultipartFile file, HttpServletRequest request, int eNum) {
        
        String result = null;
        String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;

        if(!file.getOriginalFilename().equals("")) {
            fileRoot = contextRoot + "resources/upload/experience/"+eNum + "/";
            String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String savedFileName = fileName + extension;
            File fileUpload = new File(fileRoot + savedFileName);
            System.out.println("save locate : " + fileRoot + savedFileName);
            
            try {
                if(!fileUpload.exists()) {
                    fileUpload.mkdirs();
                }
                file.transferTo(fileUpload);
                result = "resources/upload/experience/"+eNum + "/" + savedFileName;
            } catch (Exception e) {
                e.printStackTrace();
                result = null;
            }
        }


        return result;
    }

	@RequestMapping("addExperGuide")
	public ModelAndView addExperGuide(int e_num, HttpServletRequest req) {
        Experience experience = experienceSerivce.selectExperience(e_num);

        ModelAndView mav = new ModelAndView("ntf/manage/addExperGuide");
        mav.addObject("experience", experience);
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

    @RequestMapping("updateGuide")
    public ModelAndView updateGuideView(int gNum) {
        Guide guide = experienceSerivce.selectExperGuide(gNum);
        Experience experience = experienceSerivce.selectExperience(guide.getENum());
        ModelAndView mav = new ModelAndView("ntf/manage/addExperGuide");
        mav.addObject("guide", guide);
        mav.addObject("experience", experience);
        return mav;
    }

    @RequestMapping("board")
    public String boardListView() {
        return "ntf/manage/board/list";
    }

    @RequestMapping(value = "board/list", method = RequestMethod.POST)
    @ResponseBody
    public List<Board> boardList() {
        List<Board> boardListAll = boardService.selectBoardListAll();
        return boardListAll;
    }

    @RequestMapping("board/insert")
    public String boardInsert() {
        return "ntf/manage/board/add";
    }

    @RequestMapping(value = "/board/insertBoard", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertBoard(String boardCode, String category, String title, String content){

        Date today = new Date();
        Board board = new Board();
        board.setBoardCode(Integer.parseInt(boardCode));
        board.setCategory(Integer.parseInt(category));
        board.setTitle(title);
        board.setContent(content);
        board.setRegistDate(today);

        return boardService.insertBoard(board);
    }

    @RequestMapping(value = "/board/updateBoard", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateBoard(String Bnum, String boardCode, String category, String title, String content){

        Board board = new Board();
        board.setB_num(Integer.parseInt(Bnum));
        board.setBoardCode(Integer.parseInt(boardCode));
        board.setCategory(Integer.parseInt(category));
        board.setTitle(title);
        board.setContent(content);

        return boardService.updateBoard(board);
    }

    @RequestMapping(value = "/board/delete", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteBoard(String b_num) {
        return boardService.deleteBoard(Integer.parseInt(b_num));
    }

    @RequestMapping("board/update")
    public ModelAndView boardUpdate(int b_num) {
        ModelAndView mav = new ModelAndView("ntf/manage/board/add");
        mav.addObject("board", boardService.selectBoard(b_num));
        return mav;
    }
    
}
