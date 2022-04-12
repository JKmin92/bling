package kr.com.amean.provider.logic;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
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
    public int insertExperience(Experience experience) {
        SqlSession session = factory.openSession();
        int result = 0;
        try {
            result = session.insert("addExperience", experience);
            if(result != 0) {
                session.commit();
                result = experience.getE_num();
            }
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }

    @Override
    public Experience selectExperience(int e_num) {
        SqlSession session = factory.openSession();
        Experience result = null;

        try {
            result = session.selectOne("selectExper",e_num);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public int insertExperGuide(Guide guide) {
       SqlSession session = factory.openSession();
       int result = 0;

       try {
           result = session.insert("insertGuide", guide);
           if(result != 0) session.commit();
           else session.rollback();

           return result;
       } finally {
           session.close();
       }
    }



    @Override
    public int updateExperImage(String mainImage, int eNum) {
        SqlSession session = factory.openSession();
        int result = 0;
        HashMap<String, Object> insertData = new HashMap<String,Object>();
        insertData.put("mainImage", mainImage);
        insertData.put("eNum", eNum);
        try {
            result = session.update("experImage", insertData);
            if(result != 0) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }
    
}
