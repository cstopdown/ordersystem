package com.order.impl;

import com.order.dao.UserDao;
import com.order.domain.User;
import com.order.util.JdbcUtil;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDaoImpl implements UserDao {
    @Override
    public User login(User loginuser) {
        try {
            String id=loginuser.getId();
            String password=loginuser.getPassword();
            String sql="select * from  user where id=? and password = ?";
            JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id, password);
            return user;
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public boolean registe(User registeuser) {
        String id=registeuser.getId();
        String password=registeuser.getPassword();
        String nickname=registeuser.getNickname();
        if(existsUser(id)==true){
            return false;
        }else{
            String sql="insert into user (id,password,nickname) values(?,?,?)";
            JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
            template.update(sql, id,password,nickname);
            return true;
        }
    }

    @Override
    public boolean existsUser(String id) {
        try {
            String sql="select * from  user where id=? ";
            JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
            User user=template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
            return user!=null;



        } catch (DataAccessException e) {
            return false;
        }
    }

    @Override
    public int pay(String nickname) {
        String sql="select * from user where nickname=?";
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        User user=template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), nickname);
        return  user.getBalance();
    }

    @Override
    public boolean updateAccount(int balance,String id) {
        String sql="update user set balance=? where id=?";
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        int i=template.update(sql,balance,id);
        return i==0;
    }


}

