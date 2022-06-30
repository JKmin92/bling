package kr.com.amean.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.com.amean.entity.board.Board;
import kr.com.amean.entity.board.Inquery;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.user.User;
import kr.com.amean.service.BoardService;
import kr.com.amean.service.ExperienceSerivce;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired private BoardService boardService;
    @Autowired private ExperienceSerivce experienceSerivce;

    @RequestMapping("/list")
    public String boardList(int bc) {
        return "tf/board/list";
    }

    @RequestMapping(value = "getList", method = RequestMethod.GET)
    @ResponseBody
    public List<Board> getboardList(int boardCode) {
        return boardService.selectBoardList(boardCode);
    }

    @RequestMapping("/detail")
    public String boardDetail(int b_num) {
        return "tf/board/detail";
    }

    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    @ResponseBody
    public Board getBoardDetail(String b_num) {
        int bNum = Integer.parseInt(b_num);
        Board board = boardService.selectBoard(bNum);
        return board;
    }

    @RequestMapping(value = "/mainNotice", method = RequestMethod.GET)
    @ResponseBody
    public List<Board> getMainNotice() {
        List<Board> boardList = boardService.selectBoardList(1);
        if(boardList.size() > 5) {
            for(int i=5; i<=boardList.size()-1; i++) {
                boardList.remove(i);
            }
        }
        return boardList;
    }

    @RequestMapping("/penalty")
	public String penalty() {
		return "tf/board/penalty";
	}

    @RequestMapping("useContents")
    public String useContents() {
        return "tf/board/useContents";
    }

    @RequestMapping("faq")
    public String faq() {
        return "tf/board/faq";
    }

    @RequestMapping("inqury")
    public String inqury() {
        return "tf/board/inqury";
    }

    @RequestMapping(value = "/user/Inquery", method = RequestMethod.POST)
    @ResponseBody
    public Inquery getUserInquery(String in_num, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("user");
        if(user == null) {
            return null;
        }

        int inNum = Integer.parseInt(in_num);
        Inquery inquery = boardService.getInquery(inNum);

        return inquery;
    }

    @RequestMapping(value = "/user/inpuqeryList", method = RequestMethod.GET)
    @ResponseBody
    public List<Inquery> getInuqeryList(HttpServletRequest req) {

        User user = (User)req.getSession().getAttribute("user");

        List<Inquery> inpueryList = boardService.selectListInquery(user.getId());
        return inpueryList;
    }

    @RequestMapping(value = "/getApplyExper", method = RequestMethod.GET)
    @ResponseBody
    public List<Experience> getApplyExperList(HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("user");

        List<Apply> applyList = experienceSerivce.userApplyList(user.getId());
        List<Experience> applyExperList = new ArrayList<Experience>();

        for(Apply apply : applyList) {
            if(apply.getState() == 1) {
                applyExperList.add(experienceSerivce.selectExperience(apply.getE_num()));
            }
        }

        return applyExperList;
    } 

    @RequestMapping(value = "/getSelectExper", method = RequestMethod.GET)
    @ResponseBody
    public List<Experience> getSelectExperList(HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("user");

        List<Apply> applyList = experienceSerivce.userApplyList(user.getId());
        List<Experience> selectExperList = new ArrayList<Experience>();

        for(Apply apply : applyList) {
            if(apply.getState() >= 2) {
                selectExperList.add(experienceSerivce.selectExperience(apply.getE_num()));
            }
        }

        return selectExperList;
    } 

    @RequestMapping(value = "/registInquery", method = RequestMethod.POST)
    @ResponseBody
    public boolean registInquery(Inquery inquery, HttpServletRequest req) {
        
        User user = (User)req.getSession().getAttribute("user");
        Date today = new Date();

        inquery.setId(user.getId());
        inquery.setState(0);
        inquery.setRegistDate(today);

        return boardService.registInquery(inquery);
    } 
    
}
