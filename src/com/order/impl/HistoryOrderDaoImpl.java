package com.order.impl;

import com.order.dao.HistoryOrderDao;
import com.order.domain.HistoryOrder;
import com.order.util.JdbcUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class HistoryOrderDaoImpl  implements HistoryOrderDao {


    @Override
    public boolean insert(String date, int sum, int state, String desc, String owner) {
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        int i=template.update("insert into histotyorder values (null,?,?,?,?,?)",date,sum,state,desc,owner);
        return  i>0;


    }

    @Override
    public List<HistoryOrder> showAll(String owner) {
        JdbcTemplate template=new JdbcTemplate(JdbcUtil.getDataSource());
        String sql="select * from histotyorder where owner ='"+owner+"'";
        List<HistoryOrder> list=template.query(sql,new BeanPropertyRowMapper<HistoryOrder>(HistoryOrder.class));
        return  list;
    }


}
