package kr.com.amean.provider.logic;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.provider.ExperienceProvider;
import kr.com.amean.provider.factory.SqlsessionFactoryProvider;

@Repository
public class ExperienceProviderLogic implements ExperienceProvider {

    private SqlSessionFactory factory;

    public ExperienceProviderLogic() {
        factory = SqlsessionFactoryProvider.getSqlsessionFactory();
    }

    

    @Override
    public String checkThisTime() {
        return null;
    }

    @Override
    public Experience insertExperience(Experience experience) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.insert("addExperience", experience);
            

            if(result != 0) session.commit();
            else session.rollback();

            return experience;
        } finally {
            session.close();
        }
    }



    @Override
    public int getExperienceNum() {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.selectOne("getExpericenNum");
        
            if(result != 0) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }
    
}
