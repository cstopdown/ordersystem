package com.order.service;

import com.order.dao.UserDao;
import com.order.domain.User;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //浏览器请求和响应数据编码
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //验证码校验
        HttpSession session = request.getSession();
        Object checkcode = session.getAttribute("checkcode");
        String code=request.getParameter("checkcode");
        if(!code.equalsIgnoreCase((String) checkcode)) {
            request.setAttribute("checkcodefail", "验证码错误");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        //创建User对象
        User user=new User();
        String username=request.getParameter("username");
        String nickname=request.getParameter("nickname");
        String password=request.getParameter("password");
        int balance=0;
        String paypassword="123456";
        //给User对象赋值
        user.setNickname(nickname);
        user.setId(username);
        user.setPassword(password);
        user.setBalance(balance);
        user.setPaypassword(paypassword);

        UserDao userDao=new UserDaoImpl();
        if(userDao.registe(user)==false){
            request.setAttribute("msg", "请重新填写账号");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else{
            response.sendRedirect("SuccessReg.html");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
