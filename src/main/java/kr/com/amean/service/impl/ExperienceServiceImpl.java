package kr.com.amean.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;
import kr.com.amean.provider.ExperienceProvider;
import kr.com.amean.service.ExperienceSerivce;

@Service
public class ExperienceServiceImpl implements ExperienceSerivce {

    @Autowired
    private ExperienceProvider experienceProvider;

    @Override
    public List<Experience> selectExperienceList() {
        return experienceProvider.selectExperienceListAll();
    }

    @Override
    public Experience selectExperience(int e_num) {
       return experienceProvider.selectExperience(e_num);
    }

    @Override
    public int insertApply(Apply apply) {
        return experienceProvider.insertApply(apply);
    }

    @Override
    public Apply showApply(int e_num, String id) {
        return experienceProvider.showApply(e_num, id);
    }

    @Override
    public boolean concelApply(Apply apply) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public int experienceReport(Review review) {
        return experienceProvider.experienceReport(review);
    }

    @Override
    public Guide showGuide(int e_num) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int addExperience(Experience experience) {
        return experienceProvider.insertExperience(experience);
    }

    @Override
    public int addGuide(Guide guide) {
       return experienceProvider.insertExperGuide(guide);
    }

    @Override
    public int updateExperImage(String mainImage, String contents, int eNum) {
        return experienceProvider.updateExperImage(mainImage, contents, eNum);
    }

    @Override
    public List<Apply> applyListManager(int eNum) {
        return experienceProvider.applyListManager(eNum);
    }

    @Override
    public List<Experience> selectExperienceList(String mCategory) {
        return experienceProvider.selectExperienceList(mCategory);
    }

    @Override
    public boolean updateExperience(Experience experience) {
        return experienceProvider.updateExperience(experience);
    }

    @Override
    public Guide selectExperGuide(int gNum) {
        return experienceProvider.selectExperGuide(gNum);
    }

    @Override
    public boolean insertConsent(Consent consent) {
        return experienceProvider.insertConsent(consent);
    }

    @Override
    public List<Consent> selectConsent(int e_num) {
        return experienceProvider.selectConsent(e_num);
    }

    @Override
    public Guide selectEpxerGuideForENum(int e_num) {
        return experienceProvider.selectEpxerGuideForENum(e_num);
    }

    @Override
    public boolean addApplyCount(int e_num) {
        return experienceProvider.addApplyCount(e_num);
    }

    @Override
    public Apply selectApply(int a_num) {
        return experienceProvider.selectApply(a_num);
    }

    @Override
    public List<Apply> userApplyList(String id) {
        return experienceProvider.userApplyList(id);
    }

    @Override
    public boolean reviewReport(int r_num, String blog, String instagram, String homepage, String store, String receipt) {
        return experienceProvider.reviewReport(r_num, blog, instagram, homepage, store, receipt);
    }

    @Override
    public Review getReview(int a_num, String id) {
        return experienceProvider.selectReview(a_num, id);
    }

    @Override
    public boolean submitReport(int a_num) {
        return experienceProvider.submitReport(a_num);
    }

    @Override
    public boolean modifyReview(Review review) {
        return experienceProvider.modifyReview(review);
    }

    @Override
    public boolean dropApply(int a_num) {
        return experienceProvider.deleteApply(a_num);
    }

    @Override
    public boolean cancelApply(int a_num, Date cancelDate, String cancelReason) {
        return experienceProvider.cancelApply(a_num, cancelDate, cancelReason);
    }

    @Override
    public boolean changeApplyState(int a_num, int state) {
        return experienceProvider.changeApplyState(a_num, state);
    }

    @Override
    public boolean updateExperienceOpen(int e_num, boolean open) {
        return experienceProvider.updateExperienceOpen(e_num, open);
    }

    @Override
    public boolean updateConsent(Consent content) {
        return experienceProvider.updateConsent(content);
    }

    @Override
    public boolean removeConsent(int c_num) {
        return experienceProvider.removeConsent(c_num);
    }

    @Override
    public boolean registInterestCampaign(InterestCampaign interestCampaign) {
        return experienceProvider.insertInterestCampaign(interestCampaign);
    }

    @Override
    public List<InterestCampaign> selectInterestCampaignList(String id) {
        return experienceProvider.selectInterestCampaignList(id);
    }

    @Override
    public boolean deleteInterestCampaign(int ic_num) {
        return experienceProvider.removeInterestCampaign(ic_num);
    }

    @Override
    public boolean registUserConsent(UserConsent userConsent) {
        return experienceProvider.insertUserConsent(userConsent);
    }

    @Override
    public UserConsent selectUserConsent(String id, int a_num) {
        return experienceProvider.selectUserConsent(id, a_num);
    }

    @Override
    public boolean cancelApply(int a_num, String id) {
        return experienceProvider.cancelApply(a_num, id);
    }
    
}
