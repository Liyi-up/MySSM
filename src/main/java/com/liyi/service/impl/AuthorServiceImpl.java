package com.liyi.service.impl;

import java.util.ArrayList;

import com.liyi.dao.AuthorMapper;
import com.liyi.pojo.Author;
import com.liyi.pojo.AuthorExample;
import com.liyi.service.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.service.impl
 * @date 2020/4/3 11:00
 * @Copyright © liyi
 */
@Service
public class AuthorServiceImpl implements AuthorService {

    //自动将AuthorMapper自动注入到spring容器中 每
    // 一个对象的【方法】【属性】【构造器】都继承自父类AccessibleObject，
    // 其中setAccessible(true);方法用于开启控制访问权限
    @Autowired
    private AuthorMapper authorMapper;

    @Override
    public List<Author> selectAll() {
        ArrayList<Author> result = (ArrayList<Author>) authorMapper.getAllAuthor();
        return result;
    }

    @Override
    public List<Author> login(String username, String password) {
//        调用Example
        AuthorExample authorExample = new AuthorExample();
//        创建准则
        AuthorExample.Criteria criteria = authorExample.createCriteria();
//        使用准则来调用多参数查询
        criteria.andUsernameEqualTo(username);
        criteria.andPasswordEqualTo(password);
        List<Author> author = authorMapper.selectByExample(authorExample);
        return author;
    }

    @Override
    public Author getByName(String name) {
        Author author = authorMapper.getByAuthorName(name);
        return author;
    }

    @Override
    public int registerAuthor(Author author) {
        int num = authorMapper.insert(author);
        return num;
    }

    //    用户名校验
    @Override
    public boolean checkName(String name) {
        boolean isok;
        //        调用Example
        AuthorExample authorExample = new AuthorExample();
//        创建准则
        AuthorExample.Criteria criteria = authorExample.createCriteria();
//        使用准则来调用多参数查询
        criteria.andUsernameEqualTo(name);
        int count = authorMapper.countByExample(authorExample);
        System.out.println(count);
        if (count > 0) {
            isok = false;
        } else {
            isok = true;
        }
        return isok;
    }


}
