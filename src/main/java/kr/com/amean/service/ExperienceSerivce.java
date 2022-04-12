package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.Consent;
import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Review;

public interface ExperienceSerivce {

	/**
	 * 현재 시간
	 * @return
	 */
	String checkThisTime();

	int addExperience(Experience experience);

	int addGuide(Guide guide);

	int updateExperImage(String mainImage, int eNum);
	
	/**
	 * ��ü ü�� ����Ʈ
	 * @return ü�踮��Ʈ
	 */
	List<Experience> selectExperienceList();
	
	/**
	 * ���� ü�� ��û ����Ʈ
	 * @param id
	 * @return ü�踮��Ʈ
	 */
	List<Experience> selectUserExperienceList(String id);
	
	/**
	 * Ư�� ü�� ����
	 * @param e_num
	 * @return ü��
	 */
	Experience selectExperience(int e_num);

	/**
	 * ü�� ��û
	 * @param apply
	 * @param consent
	 * @return ��û����
	 */
	boolean apply(Apply apply, Consent consent);
	
	/**
	 * USER ü�� ��û Ȯ��
	 * @param id
	 * @return Apply
	 */
	Apply showApply(int e_num, String id);
	
	/**
	 * ü�� ���
	 * @param apply
	 * @return ��ҿ���
	 */
	boolean concelApply(Apply apply);
	
	/**
	 * ü�� �ۼ�����
	 * @param review
	 * @return ��������
	 */
	boolean experienceReport(Review review);
	
	/**
	 * ü�� ���̵���� Ȯ��
	 * @param e_num
	 * @return ���̵����
	 */
	Guide showGuide(int e_num);
	
}
