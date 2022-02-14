package kr.com.amean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @RequestMapping("/list")
    public String boardList(int bc) {

        return "tf/board/list";
    }

    @RequestMapping("/detail")
    public String boardDetail(int bdc) {
        return "tf/board/detail";
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
    
}
