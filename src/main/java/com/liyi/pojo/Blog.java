package com.liyi.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Blog implements Serializable {
    //        定义时间格式输出对象转换输出时间
    DateFormat df = new SimpleDateFormat("yyy-MM-dd");
    private Integer id;

    private String title;

    private String content;
    //    @JSONField(format="yyyy-MM-dd")//数据库导出页面时json格式化
    @DateTimeFormat(pattern = "yyyy-MM-dd")//页面写入数据库时格式化
    private Date createTime;

    private String type;

    private Integer authorId;
    private Author author;
    private List<Comment> comments;
    public Blog() {

    }

    public Blog(Integer id,String title, String content, Date createTime, String type, Integer authorId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.type = type;
        this.authorId = authorId;
    }
    public Blog(String title, String content, Date createTime, String type, Integer authorId) {
        this.title = title;
        this.content = content;
        this.createTime = createTime;
        this.type = type;
        this.authorId = authorId;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getCreateTime() {
        return df.format(createTime);
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getAuthorId() {
        return authorId;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", type='" + type + '\'' +
                ", authorId=" + authorId +
                ", author=" + author +
                ", comments=" + comments +
                '}';
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }
}