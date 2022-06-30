package kr.com.amean.provider;

import java.util.Date;
import java.util.List;

import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;

public interface ExperienceProvider {

    int insertExperience(Experience experience);

    boolean insertConsent(Consent consent);

    List<Consent> selectConsent(int e_num);

    boolean updateConsent(Consent content);

    boolean removeConsent(int c_num);

    boolean updateExperience(Experience experience);

    int insertExperGuide(Guide guide);

    Guide selectExperGuide(int gNum);

    Guide selectEpxerGuideForENum(int e_num);

    int updateExperImage(String mainImage, String contents, int eNum);

    Experience selectExperience(int e_num);

    List<Experience> selectExperienceListAll();

    List<Experience> selectExperienceList(String mCategory);

    boolean changeApplyState(int a_num, int state);

    boolean deleteApply(int a_num);

    boolean cancelApply(int a_num, Date cancelDate, String cancelReason);

    boolean cancelApply(int a_num, String id);

    List<Apply> applyListManager(int eNum);

    List<Apply> userApplyList(String id);

    Apply selectApply(int a_num);

    int insertApply(Apply apply);

    boolean addApplyCount(int e_num);

    Apply showApply(int e_num, String id);
    
    int experienceReport(Review review);

    boolean reviewReport(int r_num, String blog, String instagram, String homepage, String store, String receipt);

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
