package com.liyi.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liyi.pojo.Author;
import com.liyi.pojo.Blog;
import com.liyi.pojo.Comment;
import com.liyi.pojo.Msg;
import com.liyi.service.AuthorService;
import com.liyi.service.BlogService;

import com.liyi.service.CommentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * @author 李毅
 * @version V1.0
 * @Package com.liyi.controller
 * @date 2020/4/7 9:23
 * @Copyright © liyi
 */
@Controller
@RequestMapping(value = "Blog")
@CrossOrigin
public class BlogController {
    private static Logger log = Logger.getLogger(String.valueOf(BlogController.class));
    Logger logger = Logger.getLogger(this.getClass());
    @Autowired
    private BlogService blogService;
    @Autowired
    private AuthorService authorService;
    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "init", method = RequestMethod.GET)
    @ResponseBody
    public Msg getInitJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //        调用分页查询
        PageHelper.startPage(pn, 5);
        List<Blog> blogs = blogService.getByTitle("");
        PageInfo<Blog> pages = new PageInfo<>(blogs, 4);
        return Msg.success().add("PageInfo", pages);
    }
    @GetMapping("loginInit")
    @ResponseBody
    public Msg loginInit(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String username) {
        System.out.println(username);
//                调用分页查询
        PageHelper.startPage(pn, 5);
        List<Blog> blogs = blogService.getLoginInit(username);
        System.out.println(blogs);
        PageInfo<Blog> pages = new PageInfo<>(blogs, 4);
        return Msg.success().add("PageInfo", pages);
    }
    //    初始化数据
//    @RequestMapping(value = "/init")
//    String init(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
////        调用分页查询
//        PageHelper.startPage(pn, 5);
//        List<Blog> blogs = blogService.getByTitle(null);
//        PageInfo<Blog> pages = new PageInfo<>(blogs, 5);
//        model.addAttribute("blogs", blogs);
//        model.addAttribute("pageInfo", pages);
//
//
//        return "init";
//    }

    //    删除数据
    @RequestMapping(value = "del/{id}")
    String del(@PathVariable(value = "id") Integer id) {
        blogService.del(id);
        return "init";

    }

    @RequestMapping(value = "title")
    @ResponseBody
    Msg getBlogByTitle(@RequestParam(value = "title", defaultValue = "") String title) {
        //        调用分页查询
        PageHelper.startPage(1, 5);
        List<Blog> blogs = blogService.getByTitle(title);

        PageInfo<Blog> pages = new PageInfo<>(blogs, 5);
        log.debug("================");
        return Msg.success().add("PageInfo", pages);
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    Msg login(@ModelAttribute("author") Author author) {
// 调用 登录方法
        List<Author> author1 = authorService.login(author.getUsername(), author.getPassword());
        if (author1.isEmpty()) {
            //        失败返回信息
            return Msg.fail();

        } else {
            //            登录成功返回信息
            return Msg.success().add("User", author1);
        }

    }

    @RequestMapping(value = "addBlog/{author_name}", method = RequestMethod.POST)
    @ResponseBody
    Msg insert(HttpServletRequest request, @PathVariable String author_name) throws ParseException {
        System.out.println(author_name);
//        根据作者名拿到作者id
        Author author = authorService.getByName(author_name);
//        获取id
        Integer authorId = author.getId();
        String title = (String) request.getParameter("title");
        String content = (String) request.getParameter("content");
        String type = (String) request.getParameter("type");
        //    String 转 Data
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        String time = (String) request.getParameter("create_time");
        Date create_time = ft.parse(time);
        blogService.insert(new Blog(title, content, create_time, type, authorId));

        return Msg.success();
    }

    //动态获取博文类型
    @RequestMapping(value = "types", method = RequestMethod.GET)
    @ResponseBody
    Msg getTypes() {
        List<String> types = blogService.getTypes();
        return Msg.success().add("types", types);
    }

    //    Author注册
    @RequestMapping(value = "register", method = RequestMethod.POST)
    @ResponseBody
    Msg register(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        Author author = new Author(username, password, email, address, phone);
        authorService.registerAuthor(author);
        return Msg.success();
    }

    //    用户名校验
    @RequestMapping(value = "register/{username}", method = RequestMethod.POST)
    @ResponseBody
    Msg checkName(@PathVariable String username) {
        Boolean isok = authorService.checkName(username);
        if (isok) {
            return Msg.success();
        } else {
            return Msg.fail();
        }
    }

    //toUpdate
    @RequestMapping(value = "toUpdate/{id}", method = RequestMethod.GET)
    @ResponseBody
    Msg toUpdate(@PathVariable("id") Integer id) {
        Blog blog = blogService.getByid(id);
        return Msg.success().add("blog", blog);
    }

    //Update
    @RequestMapping(value = "update/{authorId}" , method = RequestMethod.POST)
    @ResponseBody
    Msg update(@PathVariable("authorId") Integer authorId, HttpServletRequest request) throws ParseException {
        String title = request.getParameter("BlogTitle");
        String content = request.getParameter("content");
        String type = request.getParameter("type");
        Integer id = Integer.valueOf(request.getParameter("blogId"));
        //    String 转 Data
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
        //        将字符串转换成Date类型
        String time = (String) request.getParameter("create_time");
        Date create_time = ft.parse(time);
        int num = blogService.updateBlog(new Blog(id, title, content, create_time, type, authorId));
        return Msg.success();
    }

    //删除Blog
    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    Msg delete(@PathVariable("id") Integer id, HttpServletRequest request) {
        blogService.del(id);
        return Msg.success();


    }

    //    添加评论
    @RequestMapping(value = "addComment", method = RequestMethod.POST)
    @ResponseBody
    Msg addComment(HttpServletRequest request, @ModelAttribute("comment") Comment comment) throws ParseException {
        commentService.addComment(comment);
        return Msg.success();
    }

}
