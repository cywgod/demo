package com.example.demo.Controller;

import com.example.demo.Pojo.User;
import com.example.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.util.List;

@Controller
public class TestController {
    @Autowired
    UserService userService;
    @RequestMapping("hello")
    public String test(HttpServletRequest request){

        List<User> list=userService.findsome();
        System.out.println(list);
        request.getSession().setAttribute("hello", list);
        return "index";
    }
}
