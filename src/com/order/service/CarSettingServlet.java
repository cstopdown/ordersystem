package com.order.service;

import com.order.domain.Goods;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/CarSettingServlet")
public class CarSettingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        if(id==1){
            Map<Goods,Integer> map=( Map<Goods,Integer>) request.getSession().getAttribute("ordercar1");
            for (Goods goods:map.keySet()) {
                if(goods.getName().equalsIgnoreCase(name)){
                   map.put(goods,map.get(goods)+1);
                    break;
                }
            }
            response.sendRedirect("OrderCar.jsp");
        }else{
            Map<Goods,Integer> map=( Map<Goods,Integer>) request.getSession().getAttribute("ordercar1");
            for (Goods goods:map.keySet()) {
                if(goods.getName().equalsIgnoreCase(name)){
                    map.put(goods,map.get(goods)-1);
                    if(map.get(goods)==0){
                        map.remove(goods);
                    }
                    break;
                }
            }
            response.sendRedirect("OrderCar.jsp");
        }


    }







    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
     }
}
