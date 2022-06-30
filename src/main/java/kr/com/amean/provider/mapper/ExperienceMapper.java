package kr.com.amean.provider.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;

@Mapper
public interface ExperienceMapper {

    Experience insertExperience(Experience experience);

    boolean updateExperience(Experience experience);

    boolean insertConsent(Consent consent);

    List<Consent> selectConsent(int e_num);

    boolean updateConsent(Consent content);

    boolean removeConsent(int c_num);

    int updateExperImage(String mainImage, String contents, int eNum);

    int insertExperGuide(Guide guide);

    Guide selectExperGuide(int gNum);

    Guide selectEpxerGuideForENum(int e_num);

    Experience selectExperience(int e_num);

    boolean deleteApply(int a_num);

    boolean cancelApply(int a_num, Date cancelDate, String cancelReason);

    boolean cancelApply(int a_num, String id);

    List<Experience> selectExperienceListAll();

    List<Experience> selectExperienceList(String mCategory);

    List<Apply> applyListManager(int eNum);

    List<Apply> userApplyList(String id);

    Apply selectApply(int a_num);

    Apply showApply(int e_num, String id);

    int insertApply(Apply apply);

    boolean addApplyCount(int e_num);

    boolean changeApplyState(int a_num, int state);

    int experienceReport(Review review);

    boolean reviewReport(int r_num, String homepage, String store, String receipt);

    Review selectReview(int a_num, String id);

    boolean submitReport(int a_num);

    boolean modifyReview(Review review);

    boolean updateExperienceOpen(int e_num, boolean open);

    boolean insertInterestCampaign(InterestCampaign interestCampaign);

    List<InterestCampaign> selectInterestCampaignList(String id);

    boolean removeInterestCampaign(int ic_num);

    boolean insertUserConsent(UserConsent userConsent);

    UserConsent selectUserConsent(String id, int a_num);
    
}
