package kr.com.amean.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.bank.Bank;
import kr.com.amean.entity.bank.BankTake;
import kr.com.amean.entity.bank.Cumalative;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Channel;
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
        return userProvider.updateUserInfo(user);
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
    public int insertAddress(Address address) {
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

    @Override
    public String getUserKey(String id) {
       return userProvider.getUserKey(id);
    }

    @Override
    public String findUser(String id, String phone) {
       return userProvider.findUser(id, phone);
    }

    @Override
    public boolean updatePasswordtoFind(String id, String password, String userKey) {
        return userProvider.updatePasswordtoFind(id, password, userKey);
    }

    @Override
    public Address basicAddress(String id) {
        return userProvider.basicAddress(id);
    }

    @Override
    public Address activeAddress(String id, int aNum) {
        return userProvider.activeAddress(id, aNum);
    }

    @Override
    public Address applyAddress(int aNum) {
        return userProvider.applyAddress(aNum);
    }

    @Override
    public User userData(String id) {
        return userProvider.userData(id);
    }

    @Override
    public List<Cumalative> selectCumalativeList(String id) {
        return userProvider.selectCumalativeList(id);
    }

    @Override
    public List<BankTake> selectTakeList(String id) {
        return userProvider.selectTakeList(id);
    }

    @Override
    public Bank selectBank(String id) {
        return userProvider.selectBank(id);
    }

    @Override
    public boolean insertBank(Bank bank) {
        return userProvider.insertBank(bank);
    }

    @Override
    public boolean updateBank(Bank bank) {
        return userProvider.updateBank(bank);
    }

    @Override
    public boolean insertBankTake(BankTake bankTake) {
        return userProvider.insertBankTake(bankTake);
    }

    @Override
    public int insertChannel(Channel channel) {
        return userProvider.insertChannel(channel);
    }

    @Override
    public boolean updateChanel(Channel channel) {
        return userProvider.updateChanel(channel);
    }

    @Override
    public Channel basicChannel(String id, int channelCode) {
        return userProvider.basicChannel(id, channelCode);
    }

    @Override
    public List<Channel> userChannel(String id) {
        return userProvider.userChannel(id);
    }

    @Override
    public List<Area> userArea(String id) {
        return userProvider.userArea(id);
    }

    @Override
    public List<Interest> userInterest(String id) {
        return userProvider.userInterest(id);
    }

    @Override
    public boolean updateArea(Area area) {
        return userProvider.updateArea(area);
    }

    @Override
    public boolean updateInterest(Interest interest) {
        return userProvider.updateInterest(interest);
    }

    @Override
    public Channel applyChannel(String id, int channelCode) {
        return userProvider.applyChannel(id, channelCode);
    }

    @Override
    public User loginForChannel(String channel, String channelId) {
        return userProvider.loginChannel(channel, channelId);
    }

    @Override
    public boolean deleteInterest(String id) {
        return userProvider.deleteInterest(id);
    }

    @Override
    public boolean deleteArea(String id) {
        return userProvider.deleteArea(id);
    }

    @Override
    public boolean onChannelKakaoId(String id, String channelId) {
        return userProvider.onChannelKakaoId(id, channelId);
    }

    @Override
    public boolean offChannelKakaoId(String id) {
        return userProvider.offChannelKakaoId(id);
    }

    @Override
    public boolean onChannelNaverId(String id, String channelId) {
        return userProvider.onChannelNaverId(id, channelId);
    }

    @Override
    public boolean offChannelNaverId(String id) {
        return userProvider.offChannelNaverId(id);
    }

    @Override
    public boolean onChannelFacebookId(String id, String channelId) {
        return userProvider.onChannelFacebookId(id, channelId);
    }

    @Override
    public boolean offChannelFacebookId(String id) {
        return userProvider.offChannelFacebookId(id);
    }
    
}
