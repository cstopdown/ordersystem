package com.order.service;

import com.order.domain.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/ClearOrderCarServlet")
public class ClearOrderCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Map<Goods,Integer> map=(Map<Goods,Integer>)request.getSession().getAttribute("ordercar1");
    if(map!=null){
        map.clear();
    }
    response.sendRedirect("OrderCar.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
