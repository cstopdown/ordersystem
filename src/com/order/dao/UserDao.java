package com.order.dao;

import com.order.domain.User;

public interface UserDao {
    public User login(User loginuser);
    public boolean registe(User registeuser);
    public boolean existsUser(String username);
}
