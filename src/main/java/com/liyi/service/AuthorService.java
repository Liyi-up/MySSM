package com.liyi.service;

import com.liyi.pojo.Author;
import com.liyi.pojo.Blog;

import java.util.List;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.service
 * @date 2020/4/3 10:59
 * @Copyright © liyi
 */
public interface AuthorService {
    //    查询所有
    List<Author> selectAll();

    //    根据username,password查询Author
    List<Author> login(String username, String password);

    //    根据作者id拿到作者
    Author getByName(String name);

    //    注册
    int registerAuthor(Author author);

    //    用户名校验
    boolean checkName(String name);
}
