package com.liyi.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.pojo
 * @date 2020/4/7 17:18
 * @Copyright © liyi
 */
//通用返回信息类
public class Msg {
    //    状态码 1成功 0失败
    private int code;
    //    提示信息
    private String message;
    //    用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<String, Object>();

    public static Msg success() {
        Msg message = new Msg();
        message.setCode(1);
        message.setMessage("处理成功");
//        返回一个msg对象
        return message;
    }


    public static Msg fail() {
        Msg message = new Msg();
        message.setCode(0);
        message.setMessage("处理失败");
        return message;
    }

    public Msg add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
