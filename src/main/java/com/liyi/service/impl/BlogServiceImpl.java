package com.liyi.service.impl;

import java.util.ArrayList;

import com.liyi.dao.AuthorMapper;
import com.liyi.dao.BlogMapper;
import com.liyi.dao.CommentMapper;
import com.liyi.pojo.Author;
import com.liyi.pojo.AuthorExample;
import com.liyi.pojo.Blog;
import com.liyi.pojo.Comment;
import com.liyi.service.AuthorService;
import com.liyi.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.service.impl
 * @date 2020/4/7 9:34
 * @Copyright © liyi
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;


    @Override
    public List<Blog> getByTitle(String title) {
        ArrayList<Blog> result = (ArrayList<Blog>) blogMapper.getByTitle(title);
        return result;
    }

    @Override
    public void del(Integer id) {
// 多表删除先删除从表
//        先拿到要删除的blog
        Blog blog = blogMapper.selectByPrimaryKey(id);
//        删除评论
        blogMapper.deleteCommentByBlogID(id);
//        删除blog
        blogMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void insert(Blog blog) {
        blogMapper.insert(blog);
    }

    @Override
    public List<String> getTypes() {
        List<String> types = blogMapper.getTypes();
        return types;
    }

    @Override
    public Blog getByid(Integer id) {
        Blog blog = blogMapper.selectByPrimaryKey(id);
        return blog;
    }

    @Override
    public int updateBlog(Blog blog) {
        int num = blogMapper.updateByPrimaryKey(blog);
        return num;
    }

    @Override
    public List<Blog> getLoginInit(String username) {
        List<Blog> lists = blogMapper.getLoginInit(username);
        return lists;
    }



}
