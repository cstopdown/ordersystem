package com.order.service;

import com.order.dao.HistoryOrderDao;
import com.order.dao.UserDao;
import com.order.domain.Goods;
import com.order.domain.HistoryOrder;
import com.order.domain.User;
import com.order.impl.HistoryOrderDaoImpl;
import com.order.impl.UserDaoImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.SortedMap;

@WebServlet("/OrderPurchaseServlet")
public class OrderPurchaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        User user = (User) request.getSession().getAttribute("user");
        String _totle = request.getParameter("all");
        int totle=Integer.parseInt(_totle);
        if(user.getBalance()<totle){
            //显示余额不足，然后跳转至个人中心
            response.sendRedirect("balanceNotEnough.jsp");
            return;
        }
        int state=Integer.parseInt(request.getParameter("id"));
           String owner=request.getParameter("nickname");
           StringBuffer desc=new StringBuffer();
           SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           String date=df.format(new Date());
           int sum=0;
           Map<Goods,Integer> map=(Map<Goods,Integer>)request.getSession().getAttribute("ordercar1");
           if (map!=null){
               for (Goods goods:map.keySet()) {
                   String name=goods.getName();
                   int price=goods.getPrice();
                   int value=map.get(goods);
                   int all=price*value;
                   sum=sum+all;
                   desc.append("购买了"+name+value+"个");
               }
           }
           HistoryOrderDao historyOrderDao=new HistoryOrderDaoImpl();
           UserDao userDao=new UserDaoImpl();
           user.setBalance(user.getBalance()-sum);
           userDao.updateAccount(user.getBalance(), owner);
           boolean flag=historyOrderDao.insert(date,sum,state,desc.toString(),owner);
           if(flag){
               response.sendRedirect("historyOrder.jsp");
           }else{
               response.sendRedirect("orderinfo.jsp");
           }



        }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
