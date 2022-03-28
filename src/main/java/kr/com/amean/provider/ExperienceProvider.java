package kr.com.amean.provider;

import kr.com.amean.entity.experience.Experience;

public interface ExperienceProvider {

    String checkThisTime();

    Experience insertExperience(Experience experience);

    int getExperienceNum();
    
}
