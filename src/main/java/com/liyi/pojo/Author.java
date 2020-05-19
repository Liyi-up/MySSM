package com.liyi.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
@Data
@NoArgsConstructor //无参构造
public class Author implements Serializable {
    private Integer id;


    private String username;

    private String password;

    private String email;

    private String address;

    private String phone;

    public Author(String username, String password, String email, String address, String phone) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.phone = phone;
    }

}