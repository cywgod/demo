package com.example.demo.Service.impl;

import com.example.demo.Dao.UserDaoMapper;
import com.example.demo.Pojo.User;
import com.example.demo.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDaoMapper userDaoMapper;

    @Override
    public  List<User> findsome() {
        return userDaoMapper.findsome();
    }
}
