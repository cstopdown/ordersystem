package com.order.service;

import com.order.dao.UserDao;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CheckUnameServlet")
public class CheckUnameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //浏览器请求和响应数据编码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //账号是否已经注册的校验
        String username = request.getParameter("username");
        UserDao userDao = new UserDaoImpl();
        boolean isExist = userDao.existsUser(username);
        if (isExist) {
            response.getWriter().print(1);
        } else {
            response.getWriter().print(2);
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
    }
}
