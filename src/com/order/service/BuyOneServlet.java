package com.order.service;

import com.order.dao.GoodsDao;
import com.order.dao.HistoryOrderDao;
import com.order.dao.UserDao;
import com.order.domain.Goods;
import com.order.domain.User;
import com.order.impl.GoodsDaoImpl;
import com.order.impl.HistoryOrderDaoImpl;
import com.order.impl.UserDaoImpl;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/buyOneServlet")
public class BuyOneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String uid = request.getParameter("uid");
        String gid = request.getParameter("gid");
        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUserById(uid);
        GoodsDao goodsDao = new GoodsDaoImpl();
        Goods goods = goodsDao.queryById(gid);

        //更新余额
        userDao.updateAccount(user.getBalance()-goods.getPrice(), user.getId());
        request.getSession().setAttribute("user", user);
        //更新订单数据
        HistoryOrderDao historyOrderDao = new HistoryOrderDaoImpl();
        String desc="购买了"+goods.getName()+"1个";
        SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        String date = simpleDateFormat.format(new Date());
        historyOrderDao.insert(date, goods.getPrice(), 1,desc,user.getId() );
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


}

