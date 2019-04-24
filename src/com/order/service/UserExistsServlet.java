package com.order.service;

import com.order.dao.UserDao;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userExistsServlet")
public class UserExistsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        UserDao dao = new UserDaoImpl();
        boolean b = dao.existsUser(username);
        response.setContentType("text/html;charset=utf-8");
        if(username==""||username==null){
            response.getWriter().write("<font style='color:red'>账户不允许为空</font>");
            return;
        }
        if(b){  //如果存在
            response.getWriter().write("<font style='color:red'>手机号已注册</font>");
        }else {
            response.getWriter().write("<font style='color:green'>可注册</font>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
