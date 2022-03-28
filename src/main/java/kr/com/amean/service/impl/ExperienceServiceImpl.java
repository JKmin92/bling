package kr.com.amean.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.com.amean.entity.Consent;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.provider.ExperienceProvider;
import kr.com.amean.service.ExperienceSerivce;

@Service
public class ExperienceServiceImpl implements ExperienceSerivce {

    @Autowired
    private ExperienceProvider experienceProvider;

    @Override
    public String checkThisTime() {
        return experienceProvider.checkThisTime();
    }

    @Override
    public List<Experience> selectExperienceList() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Experience> selectUserExperienceList(String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Experience selectExperience(int e_num) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean apply(Apply apply, Consent consent) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Apply showApply(int e_num, String id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public boolean concelApply(Apply apply) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean experienceReport(Review review) {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public Guide showGuide(int e_num) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Experience addExperience(Experience experience) {
        return experienceProvider.insertExperience(experience);
    }

    @Override
    public int getExperienceNum() {
        // TODO Auto-generated method stub
        return 0;
    }
    
}
