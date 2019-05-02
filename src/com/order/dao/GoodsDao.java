package com.order.dao;

import com.order.domain.Goods;

import java.util.List;

public interface GoodsDao {
    public List<Goods> showAllByKind(String kind, int state);

    Goods queryById(String id);


}
