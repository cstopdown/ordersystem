package com.order.service;

import com.order.dao.GoodsDao;
import com.order.domain.Goods;
import com.order.impl.GoodsDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.List;

@WebServlet("/showGoodsServlet")
public class ShowGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String kind=request.getParameter("kind");

        //如果是没有传参，默认为奶茶
        if(kind==null){
            kind="milktea";
        }

        //返回list列表中
        GoodsDao dao = new GoodsDaoImpl();
        List<Goods> list = dao.showAllByKind(kind, 1);
        //将结果放入request域中
        request.setAttribute("list", list);
        request.setAttribute("kind", kind);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
