package kr.com.amean.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;
import kr.com.amean.provider.UserProvider;
import kr.com.amean.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserProvider userProvider;

    @Override
    public User login(String id, String pw) {
        return userProvider.login(id, pw);
    }

    @Override
    public boolean idCheck(String id) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean join(User user) {
        return userProvider.join(user);
    }

    @Override
    public boolean updateUserInfo(User user) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean updatePW(String id, String PW) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String selectID(String name, String phone_number) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean removeUser(User user) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean addArea(Area area) {
        return userProvider.insertArea(area);
    }

    @Override
    public boolean addInterest(Interest interest) {
        return userProvider.insertInterest(interest);
    }
    
}
