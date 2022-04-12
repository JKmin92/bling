package kr.com.amean.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.user.Address;
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
        return userProvider.idCheck(id);
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

    @Override
    public boolean addNaverId(String nId, String userId) {
        return userProvider.addNaverId(nId, userId);
    }

    @Override
    public List<Address> userAddressList(String id) {
        return userProvider.userAddressList(id);
    }

    @Override
    public Address userAddress(String id, int aNum) {
        return userProvider.userAddress(id, aNum);
    }

    @Override
    public boolean insertAddress(Address address) {
        return userProvider.insertAddress(address);
    }

    @Override
    public boolean updateAddress(Address address) {
        return userProvider.updateAddress(address);
    }

    @Override
    public boolean removeAddress(String id, int aNum) {
        return userProvider.removeAddress(id, aNum);
    }
    
}
