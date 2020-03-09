package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

public class Testa {
    @Autowired
    private RestTemplate restTemplate;
    public Map test(){
        Map map=new HashMap();
        return map;
    }
}
