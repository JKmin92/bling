package kr.com.amean.provider.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.Experience;
import kr.com.amean.provider.ExperienceProvider;
import kr.com.amean.provider.factory.SqlsessionFactoryProvider;

@Repository
public class ExperienceProviderLogic implements ExperienceProvider {

    private SqlSessionFactory factory;

    public ExperienceProviderLogic() {
        factory = SqlsessionFactoryProvider.getSqlsessionFactory();
    }

    /**
     * code - 1=select, 2=insert, 3=update, 4=delete, 5=selectList
     * @param code
     * @param name
     * @return
     */
    public Object sessionDateResult(int code, String name, Object data) {

        SqlSession session = factory.openSession();
        Object result = null;
        try {
            if(code == 1) {
                if(data == null) {
                    result = session.selectOne(name);
                } else {
                    result = session.selectOne(name, data);
                }
            } else if (code == 2) {

                int res = session.insert(name, data);
                if(res != 0) result = true;
                else result=false;

            } else if (code == 3) {
                
                int res = session.update(name, data);
                if(res != 0) result = true;
                else result=false;

            } else if (code == 4) {

                int res = session.delete(name, data);
                if(res != 0) result = true;
                else result=false;

            } else if (code == 5) {
                if(data == null) {
                    result = session.selectList(name);
                } else {
                    result = session.selectList(name, data);
                }
            }

            if (result != null){
                session.commit();
            }
            else {session.rollback();}
            return result;

        } finally {
            session.close();
        }
    }

    @Override
    public String checkThisTime() {
        String thisTime = (String)sessionDateResult(1,"checkthisTime",null);
        return thisTime;
    }

    @Override
    public Boolean insertExperience(Experience experience) {
        return (Boolean)sessionDateResult(2, "insertExperience", experience);
    }
    
}
