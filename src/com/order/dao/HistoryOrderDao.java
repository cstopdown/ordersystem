package com.order.dao;

import com.order.domain.HistoryOrder;

import java.util.List;

public interface HistoryOrderDao {
    public boolean insert(String date, int sum, int state, String desc, String owner);

    public List<HistoryOrder> showAll(String owner);
    }
