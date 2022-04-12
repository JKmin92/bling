package kr.com.amean.provider;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;

public interface ExperienceProvider {

    String checkThisTime();

    int insertExperience(Experience experience);

    int insertExperGuide(Guide guide);

    int updateExperImage(String mainImage, int eNum);

    Experience selectExperience(int e_num);
    
}
