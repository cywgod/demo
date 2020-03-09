package com.example.demo.Controller;

import com.example.demo.Pojo.User;
import com.example.demo.Service.UserService;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.awt.*;
import java.util.*;
import java.util.List;

@RestController
public class ApiTest {
    @Autowired
    private UserService userService;
    @RequestMapping("api")
    public void test(){
        RestTemplate restTemplate=new RestTemplate();
        String uri="http://localhost:8080/api";
        String result = restTemplate.getForObject(uri, String.class);
        System.out.println(result);

    }
    @RequestMapping(value = "now")
    public  void now(){
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://server.test.hzrjj.com/crm/open/clue";
        String result = restTemplate.getForObject(url, String.class);
        System.out.println(result);
    }

    @GetMapping("ccc")
    private static void getEmployees(){
        final String uri = "http://localhost:8080/api";

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        HttpEntity<String> entity = new HttpEntity<String>("parameters", headers);

        ResponseEntity<String> result = restTemplate.exchange(uri, HttpMethod.GET, entity, String.class);

        System.out.println(result);
    }

    @RequestMapping("object")
    public void test1(){
        RestTemplate restTemplate=new RestTemplate();
        String uri="http://shtlkj.club/api";
        User result = restTemplate.getForObject(uri, User.class);
        System.out.println(result);
    }
}
