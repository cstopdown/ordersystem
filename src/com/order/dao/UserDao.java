package com.order.dao;

import com.order.domain.User;

public interface UserDao {
    public User login(User loginuser);
    public boolean registe(User registeuser);
    public boolean existsUser(String id);
    public int pay(String nickname);
    public boolean updateAccount(int balance, String nickname);

    boolean checkPayPassword(String uid,String paypwd);

    User getUserById(String uid);
}
