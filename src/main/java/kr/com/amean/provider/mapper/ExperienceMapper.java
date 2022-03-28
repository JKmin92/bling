package kr.com.amean.provider.mapper;

import kr.com.amean.entity.experience.Experience;

public interface ExperienceMapper {

    String checkThisTime();

    Boolean insertExperience(Experience experience);
    
}
