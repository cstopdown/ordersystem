package com.order.impl;

import com.order.dao.UserDao;
import com.order.domain.User;
import com.order.util.JdbcUtil;
import org.junit.Test;
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
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
            return true;


        } catch (DataAccessException e) {
            return false;
        }
    }

    @Test
    public void testexistsUser() {
        try {
            String id="1526792204";
            String sql="select * from  user where id=? ";
            JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
            System.out.println("存在");
        } catch (DataAccessException e) {
            System.out.println("不存在");
        }
    }

}
