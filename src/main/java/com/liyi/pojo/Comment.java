package com.liyi.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
@Data
@NoArgsConstructor
public class Comment implements Serializable {
    private Integer id;

    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd")//页面写入数据库时格式化
    private Date postdate;

    private Integer blogId;

    public Comment(String content, Date postdate, Integer blogId) {
        this.content = content;
        this.postdate = postdate;
        this.blogId = blogId;
    }
}