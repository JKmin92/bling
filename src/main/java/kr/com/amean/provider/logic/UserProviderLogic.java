package kr.com.amean.provider.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

import kr.com.amean.entity.bank.Bank;
import kr.com.amean.entity.bank.BankTake;
import kr.com.amean.entity.bank.Cumalative;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Channel;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;
import kr.com.amean.provider.UserProvider;
import kr.com.amean.provider.factory.SqlsessionFactoryProvider;

@Repository
public class UserProviderLogic implements UserProvider {

    private SqlSessionFactory factory;

    public UserProviderLogic() {
        factory = SqlsessionFactoryProvider.getSqlsessionFactory();
    }

    @Override
    public User login(String id, String pw) {
        SqlSession session = factory.openSession();
        HashMap<String, String> dataMap = new HashMap<String,String>();
        dataMap.put("id", id);
        dataMap.put("password", pw);
        User user = null;

        try {
            user = session.selectOne("login", dataMap);
            if (user != null) {
                session.commit();
            } else {
                session.rollback();
            }
            return user;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean idCheck(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;
        String checkId = null;
        try {
            checkId = session.selectOne("userCheck", id);
            if(checkId != null) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }
            
            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean join(User user) {
        
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("userJoin", user);
            if(res != 0) result = true;
            else result = false;

            if(result != false) session.commit();
            else session.rollback();
            
            return result;
        } finally {
            session.close();
        }
        
    }

    @Override
    public boolean updateUserInfo(User user) {
        
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateUser", user);
            if(res != 0 ) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
        
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
    public boolean insertArea(Area area) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("addArea", area);
            if(res != 0) result = true;
            else result = false;

            if(result != false) session.commit();
            else session.rollback();
            
            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean insertInterest(Interest interest) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("addInterest", interest);
            if(res != 0) result = true;
            else result = false;

            if(result != false) session.commit();
            else session.rollback();
            
            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean addNaverId(String nId, String userId) {
        SqlSession session = factory.openSession();
        boolean result = false;
        int res = 0;
        HashMap<String, String> map = new HashMap<String,String>();
        map.put("nId", nId);
        map.put("userId", userId);
        try {
            res = session.update("addNavID", map);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Address> userAddressList(String id) {
        SqlSession session = factory.openSession();
        List<Address> result = null;

        try {
            result = session.selectList("addressList", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Address userAddress(String id, int aNum) {
        SqlSession session = factory.openSession();
        Address result = null;
        HashMap<String, Object> data = new HashMap<String,Object>();
        data.put("id", id);
        data.put("aNum", aNum);

        try {
            result = session.selectOne("userAddress",data);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public int insertAddress(Address address) {
        SqlSession session = factory.openSession();
        int result = 0;

        try {
            result = session.insert("insertAddress", address);
            System.out.println("result : " + result);
            if(result != 0) {
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateAddress(Address address) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateAddress", address);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean removeAddress(String id, int aNum) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Object> dataMap = new HashMap<String,Object>();
        dataMap.put("id", id);
        dataMap.put("aNum", aNum);

        try {
            int res = session.delete("removeAddress", dataMap);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public String getUserKey(String id) {
        SqlSession session = factory.openSession();
        String result = null;

        try {
            result = session.selectOne("getUserKey", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public String findUser(String id, String phone) {
        SqlSession session = factory.openSession();
        String result = null;
        HashMap<String, String> dataMap = new HashMap<String,String>();
        dataMap.put("id", id);
        dataMap.put("phone", phone);

        try {
            result = session.selectOne("findUser", dataMap);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updatePasswordtoFind(String id, String password, String userKey) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, String> dataMap = new HashMap<String,String>();
        dataMap.put("id", id);
        dataMap.put("password", password);
        dataMap.put("userKey", userKey);

        try {
            int res = session.update("updatePasswordFind", dataMap);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                result = false;
                session.rollback();
            } 
            
            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Address basicAddress(String id) {
        SqlSession session = factory.openSession();
        Address result = null;

        try {
            result = session.selectOne("basicAddress", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Address activeAddress(String id, int aNum) {
        SqlSession session = factory.openSession();
        Address result = null;
        HashMap<String, Object> dataMap = new HashMap<String,Object>();
        dataMap.put("id", id);
        dataMap.put("aNum", aNum);

        try {
            result = session.selectOne("activeAddress", dataMap);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Address applyAddress(int aNum) {
        SqlSession session = factory.openSession();
        Address result = null;

        try {
            result = session.selectOne("getApplyAddress", aNum);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public User userData(String id) {
        SqlSession session = factory.openSession();
        User user = null;

        try {
            user = session.selectOne("getUserData", id);
            if(user != null) session.commit();
            else session.rollback();

            return user;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Cumalative> selectCumalativeList(String id) {
        SqlSession session = factory.openSession();
        List<Cumalative> result = null;

        try {
            result = session.selectList("cumalativeList", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<BankTake> selectTakeList(String id) {
        SqlSession session = factory.openSession();
        List<BankTake> result = null;

        try {
            result = session.selectList("bankTakeList", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Bank selectBank(String id) {
        SqlSession session = factory.openSession();
        Bank result = null;

        try {
            result = session.selectOne("selectBank", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean insertBank(Bank bank) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertBank", bank);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateBank(Bank bank) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateBank", bank);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean insertBankTake(BankTake bankTake) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertBankTake", bankTake);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public int insertChannel(Channel channel) {
        SqlSession session = factory.openSession();
        int result = 0;

        try {
            result = session.insert("insertChannel", channel);
            if(result != 0) {
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateChanel(Channel channel) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateChannel", channel);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Channel basicChannel(String id, int channelCode) {
        SqlSession session = factory.openSession();
        Channel result = null;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("id", id);
        map.put("channelCode", channelCode);

        try {
            result = session.selectOne("basicChannel", map);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Channel> userChannel(String id) {
        SqlSession session = factory.openSession();
        List<Channel> result = null;

        try {
            result = session.selectList("userChannel", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Area> userArea(String id) {
        SqlSession session = factory.openSession();
        List<Area> result = null;

        try {
            result = session.selectList("userArea", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public List<Interest> userInterest(String id) {
        SqlSession session = factory.openSession();
        List<Interest> result = null;

        try {
            result = session.selectList("userInterest", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateArea(Area area) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateArea", area);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean updateInterest(Interest interest) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateInterest", interest);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Channel applyChannel(String id, int c_num) {
        SqlSession session = factory.openSession();
        Channel result = null;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("id", id);
        map.put("c_num", c_num);

        try {
            result = session.selectOne("applyChannel", map);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public User loginChannel(String channel, String channelId) {
        SqlSession session = factory.openSession();
        User result = null;

        try {
            if(channel == "kakao") {
                result = session.selectOne("loginForKakao", channelId);
            } else if(channel == "naver") {
                result = session.selectOne("loginForNaver", channelId);
            } else if(channel == "facebook") {
                result = session.selectOne("loginForFacebook", channelId);
            }

            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean deleteInterest(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("deleteInterest", id);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean deleteArea(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("deleteArea", id);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean onChannelKakaoId(String id, String channelId) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, String> map = new HashMap<String,String>();
        map.put("id", id);
        map.put("channelId", channelId);

        try {
            int res = session.update("onChannelKakaoId", map);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean offChannelKakaoId(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("offChannelKakaoId", id);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean onChannelNaverId(String id, String channelId) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, String> map = new HashMap<String,String>();
        map.put("id", id);
        map.put("channelId", channelId);

        try {
            int res = session.update("onChannelNaverId", map);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean offChannelNaverId(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("offChannelNaverId", id);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean onChannelFacebookId(String id, String channelId) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, String> map = new HashMap<String,String>();
        map.put("id", id);
        map.put("channelId", channelId);

        try {
            int res = session.update("onChannelFacebookId", map);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean offChannelFacebookId(String id) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("onChannelNaverId", id);
            if(res != 0) {
                result = true;
                session.commit();
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }
    
}
