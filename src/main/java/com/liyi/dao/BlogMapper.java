package com.liyi.dao;

import com.liyi.pojo.Blog;
import com.liyi.pojo.BlogExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BlogMapper {
    int countByExample(BlogExample example);

    int deleteByExample(BlogExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Blog record);

    int insertSelective(Blog record);

    List<Blog> selectByExample(BlogExample example);

    Blog selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Blog record, @Param("example") BlogExample example);

    int updateByExample(@Param("record") Blog record, @Param("example") BlogExample example);

    int updateByPrimaryKeySelective(Blog record);

    int updateByPrimaryKey(Blog record);


    List<Blog> getByTitle(String title);

    void deleteCommentByBlogID(int blogID);

    void deleteAuthorByBlogID(int authorId);

    List<String> getTypes();

    // 登录后的数据
    List<Blog> getLoginInit(String username);
}