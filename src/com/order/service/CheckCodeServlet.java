package com.order.service;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width=100;
        int height=50;
        BufferedImage image=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //设置图片
        Graphics graphics = image.getGraphics();
        graphics.setColor(Color.PINK);
        graphics.fillRect(0, 0, width, height);
        Random random=new Random();
        String s="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        graphics.setColor(Color.blue);
        int length=s.length();
        StringBuffer sb = new StringBuffer();
        int x=20;
        for (int i = 0; i <4 ; i++) {
            int index=random.nextInt(length);
            char c=s.charAt(index);
            sb.append(c);
            graphics.drawString(c+"", x, 25);
            x=x+20;
        }

        String code=sb.toString();
        HttpSession session = request.getSession();
        session.setAttribute("checkcode", code);

        //将图片输出到页面
        ImageIO.write(image, "jpg", response.getOutputStream());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
