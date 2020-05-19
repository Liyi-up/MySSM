package com.liyi.dao;

import com.liyi.pojo.Author;
import com.liyi.pojo.AuthorExample;

import java.io.Serializable;
import java.util.List;

import com.liyi.pojo.Blog;
import org.apache.ibatis.annotations.Param;

public interface AuthorMapper  {
    int countByExample(AuthorExample example);

    int deleteByExample(AuthorExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Author record);

    int insertSelective(Author record);

    List<Author> selectByExample(AuthorExample example);

    Author selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Author record, @Param("example") AuthorExample example);

    int updateByExample(@Param("record") Author record, @Param("example") AuthorExample example);

    int updateByPrimaryKeySelective(Author record);

    int updateByPrimaryKey(Author record);

    List<Author> getAllAuthor();

    Author getByAuthorName(String name);
}