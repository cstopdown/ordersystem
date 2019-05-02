package com.order.service;

import com.order.dao.UserDao;
import com.order.domain.User;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkPayPasswordServlet")
public class CheckPayPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //获取支付密码参数
        String paypwd= request.getParameter("paypwd");
        String uid=request.getParameter("uid");
        UserDao dao = new UserDaoImpl();
        boolean flag=dao.checkPayPassword(uid,paypwd);
        if(flag){
            response.getWriter().write("true");
        }else {
            response.getWriter().write("false");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
