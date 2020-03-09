package com.example.demo.Dao;

import com.example.demo.Pojo.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserDaoMapper {
    List<User> findsome();
}
