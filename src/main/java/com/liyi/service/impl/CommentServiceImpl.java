package com.liyi.service.impl;

import com.liyi.dao.CommentMapper;
import com.liyi.pojo.Comment;
import com.liyi.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.service.impl
 * @date 2020/4/22 10:15
 * @Copyright © liyi
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentMapper commentMapper;



    @Override
    public int addComment(Comment comment) {
        int num = commentMapper.insert(comment);
        return num;
    }
}
