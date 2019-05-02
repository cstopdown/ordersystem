package com.order.service;

import com.order.dao.GoodsDao;
import com.order.dao.UserDao;
import com.order.domain.Goods;
import com.order.domain.User;
import com.order.impl.GoodsDaoImpl;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/checkBalanceEnoughServlet")
public class CheckBalanceEnoughServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;utf-8");
        String uid=request.getParameter("uid");
        String gid = request.getParameter("gid");
        GoodsDao goodsDao =new GoodsDaoImpl();
        Goods goods = goodsDao.queryById(gid);
        UserDao userDao = new UserDaoImpl();
        User user =userDao.getUserById(uid);
        int balance = user.getBalance();
        int price = goods.getPrice();
        if(balance>=price){
            response.getWriter().write("true");
        }else {
            response.getWriter().write("false");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
