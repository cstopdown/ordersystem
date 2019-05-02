package com.order.impl;

import com.order.dao.GoodsDao;
import com.order.domain.Goods;
import com.order.util.JdbcUtil;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sound.midi.Soundbank;
import java.util.List;

public class GoodsDaoImpl implements GoodsDao {
    @Override
    public List<Goods> showAllByKind(String kind,int state) {
        //查询语句
        String sql="select * from goods where kind = ? and state = ?";

        //开始查询
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        List<Goods> list = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class), kind, state);
        return list;
    }

    @Override
    public Goods queryById(String id) {
        String sql="select * from goods where id=?";
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        Goods goods=template.queryForObject(sql, new BeanPropertyRowMapper<Goods>(Goods.class), id);
        return goods;
    }




}
