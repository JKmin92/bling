package kr.com.amean.provider.logic;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

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
        User user = null;

        try {
            user = session.selectOne("login", id);
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
        // TODO Auto-generated method stub
        return false;
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
    
}
