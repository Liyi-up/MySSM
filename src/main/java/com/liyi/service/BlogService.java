package com.liyi.service;

import com.liyi.pojo.Blog;

import java.util.List;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.service
 * @date 2020/4/7 9:30
 * @Copyright © liyi
 */
public interface BlogService {


    //    标题模糊查询
    List<Blog> getByTitle(String title);

    //删除数据
    void del(Integer id);

    //    新增一条blog
    void insert(Blog blog);

    //    动态获取所有的博客类型
    List<String> getTypes();

    //    根据id查询blog
    Blog getByid(Integer id);

    //    更新Blog
    int updateBlog(Blog blog);

    // 登录后的数据
    List<Blog> getLoginInit(String username);
}
