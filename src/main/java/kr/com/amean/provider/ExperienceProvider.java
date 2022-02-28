package kr.com.amean.provider;

import kr.com.amean.entity.Experience;

public interface ExperienceProvider {

    String checkThisTime();

    Boolean insertExperience(Experience experience);
    
}
