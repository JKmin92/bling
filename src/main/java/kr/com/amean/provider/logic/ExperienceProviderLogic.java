package kr.com.amean.provider.logic;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;
import kr.com.amean.provider.ExperienceProvider;
import kr.com.amean.provider.factory.SqlsessionFactoryProvider;

@Repository
public class ExperienceProviderLogic implements ExperienceProvider {

    private SqlSessionFactory factory;

    public ExperienceProviderLogic() {
        factory = SqlsessionFactoryProvider.getSqlsessionFactory();
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
    public int updateExperImage(String mainImage, String contents, int eNum) {
        SqlSession session = factory.openSession();
        int result = 0;
        HashMap<String, Object> insertData = new HashMap<String,Object>();
        insertData.put("mainImage", mainImage);
        insertData.put("contents", contents);
        insertData.put("e_num", eNum);
        try {
            result = session.update("experImage", insertData);
            if(result != 0) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public List<Experience> selectExperienceListAll() {
       SqlSession session = factory.openSession();
       List<Experience> result = null;

       try {
           result = session.selectList("selectExperienceAll");
           if(result != null) session.commit();
           else session.rollback();

           return result;
       } finally {
           session.close();
       }
    }



    @Override
    public List<Apply> applyListManager(int eNum) {
        SqlSession session = factory.openSession();
        List<Apply> result = null;

        try {
            result = session.selectList("applyListManager", eNum);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public int insertApply(Apply apply) {
        SqlSession session = factory.openSession();
        int result;

        try {
            result = session.insert("insertExperienceApply", apply);
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
    public List<Experience> selectExperienceList(String mCategory) {
        SqlSession session = factory.openSession();
        List<Experience> result = null;

        try {
            result = session.selectList("selectExperienceList", mCategory);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean updateExperience(Experience experience) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateExperience", experience);
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
    public Guide selectExperGuide(int gNum) {
        SqlSession session = factory.openSession();
        Guide result;

        try {
            result = session.selectOne("selectGuide", gNum);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean insertConsent(Consent consent) {
        SqlSession session = factory.openSession();
        boolean result = false;
        try {
            int res = session.insert("insertConsent", consent);
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
    public List<Consent> selectConsent(int e_num) {
        SqlSession session = factory.openSession();
        List<Consent> result = null;

        try {
            result = session.selectList("selectConsent", e_num);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public Guide selectEpxerGuideForENum(int e_num) {
        SqlSession session = factory.openSession();
        Guide guide = null;

        try {
            guide = session.selectOne("selectGuideForENum", e_num);
            if(guide != null) session.commit();
            else session.rollback();

            return guide;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean addApplyCount(int e_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("addApplyCount", e_num);
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
    public Apply selectApply(int a_num) {
        SqlSession session = factory.openSession();
        Apply result = null;

        try {
            result = session.selectOne("getApply", a_num);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public List<Apply> userApplyList(String id) {
        SqlSession session = factory.openSession();
        List<Apply> result = null;

        try {
            result = session.selectList("userApply", id);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public int experienceReport(Review review) {
        SqlSession session = factory.openSession();
        int result;

        try {
            result = session.insert("insertReview", review);
            if(result != 0) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean reviewReport(int r_num, String blog, String instagram, String homepage, String store, String receipt) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Object> dataMap = new HashMap<String,Object>();
        dataMap.put("r_num", r_num);
        dataMap.put("blog", blog);
        dataMap.put("instagram", instagram);
        dataMap.put("homepage", homepage);
        dataMap.put("store", store);
        dataMap.put("receipt", receipt);

        try {
            int res = session.update("reviewReport", dataMap);
            if(res != 0) {
                session.commit();
                result = true;
            } else {
                session.rollback();
            }

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public Review selectReview(int a_num, String id) {
        SqlSession session = factory.openSession();
        Review reviewList = null;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("a_num", a_num);
        map.put("id", id);

        try {
            reviewList = session.selectOne("getReviewList", map);
            if(reviewList != null) session.commit();
            else session.rollback();

            return reviewList;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean submitReport(int a_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("submitReport", a_num);
            if(res != 0) {
                result = true;
                session.commit();
            } else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean modifyReview(Review review) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("modifyReivew", review);
            if(res != 0) {
                result = true;
                session.commit();
            } else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean deleteApply(int a_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("deleteApply", a_num);
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
    public boolean cancelApply(int a_num, Date cancelDate, String cancelReason) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Object> dataMap = new HashMap<String,Object>();
        dataMap.put("a_num", a_num);
        dataMap.put("cancelDate", cancelDate);
        dataMap.put("cancelReason", cancelReason);

        try {
            int res = session.update("cancelApply", dataMap);
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
    public boolean changeApplyState(int a_num, int state) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Integer> dataMap = new HashMap<String,Integer>();
        dataMap.put("a_num", a_num);
        dataMap.put("state", state);

        try {
            int res = session.update("modifyApplyState", dataMap);
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
    public Apply showApply(int e_num, String id) {
        SqlSession session = factory.openSession();
        Apply result = null;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("e_num", e_num);
        map.put("id", id);

        try {
            result = session.selectOne("showApply", map);
            if(result != null) session.commit();
            else session.rollback();

            return result;
        } finally {
            session.close();
        }
    }



    @Override
    public boolean updateExperienceOpen(int e_num, boolean open) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("e_num", e_num);
        map.put("open", open);

        try {
            int res = session.update("changeOpen", map);
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
    public boolean updateConsent(Consent content) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.update("updateConsent", content);
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
    public boolean removeConsent(int c_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("deleteConsent", c_num);
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
    public boolean insertInterestCampaign(InterestCampaign interestCampaign) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertInterestCampaign", interestCampaign);
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
    public List<InterestCampaign> selectInterestCampaignList(String id) {
        SqlSession session = factory.openSession();
        List<InterestCampaign> result = null;

        try {
            result = session.selectList("selectInterestCampaignList", id);
            if(result != null) {
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
    public boolean removeInterestCampaign(int ic_num) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.delete("removeInterestCampaign", ic_num);
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
    public boolean insertUserConsent(UserConsent userConsent) {
        SqlSession session = factory.openSession();
        boolean result = false;

        try {
            int res = session.insert("insertUserConsent", userConsent);
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
    public UserConsent selectUserConsent(String id, int a_num) {
        SqlSession session = factory.openSession();
        UserConsent result = null;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("id", id);
        map.put("a_num", a_num);

        try {
            result = session.selectOne("selectUserConsent", map);
            if(result != null) {
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
    public boolean cancelApply(int a_num, String id) {
        SqlSession session = factory.openSession();
        boolean result = false;
        HashMap<String, Object> map = new HashMap<String,Object>();
        map.put("a_num", a_num);
        map.put("id", id);

        try {
            int res = session.delete("cancelApplyFirst", map);
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
