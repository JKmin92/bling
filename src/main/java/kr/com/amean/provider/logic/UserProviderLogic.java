package kr.com.amean.provider.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
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
    public boolean insertAddress(Address address) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertAddress", address);
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
    
}
