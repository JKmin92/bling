package kr.com.amean.provider.mapper;

import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Guide;

public interface ExperienceMapper {

    String checkThisTime();

    Experience insertExperience(Experience experience);

    int updateExperImage(String mainImage, int eNum);

    int insertExperGuide(Guide guide);
    
}
