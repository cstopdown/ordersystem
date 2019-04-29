package com.order.service;

import com.order.dao.GoodsDao;
import com.order.domain.Goods;
import com.order.impl.GoodsDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet("/ShowOrderCarServlet")
public class ShowOrderCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String kind = request.getParameter("kind");
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        Goods goods = new Goods();
        goods.setName(name);
        goods.setKind(kind);
        goods.setPrice(price);

        Map<Goods, Integer> map1 = (Map<Goods, Integer>) request.getSession().getAttribute("ordercar1");

        if (map1 == null) {
            map1 = new LinkedHashMap<Goods, Integer>();
            request.getSession().setAttribute("ordercar1",map1);
        }
        if(map1.keySet()==null){
            map1.put(goods,1);
        }else{
            boolean flag=false;
            for (Goods goods1:map1.keySet()) {
                  String name1=goods1.getName();
                  if(name1.equalsIgnoreCase(name)){
                      map1.put(goods1,map1.get(goods1)+1);
                      flag=true;
                      break;
                  }
            }
            if(flag){

            }else{
                map1.put(goods,1);
            }
        }


            response.sendRedirect("showGoodsServlet?kind="+kind);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
