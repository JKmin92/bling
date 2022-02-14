package kr.com.amean.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mana")
public class ManaContoroller {
    
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
    
}
