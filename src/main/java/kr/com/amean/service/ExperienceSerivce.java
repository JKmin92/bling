package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.Apply;
import kr.com.amean.entity.Consent;
import kr.com.amean.entity.Experience;
import kr.com.amean.entity.Guide;
import kr.com.amean.entity.Review;

public interface ExperienceSerivce {
	
	/**
	 * 전체 체험 리스트
	 * @return 체험리스트
	 */
	List<Experience> selectExperienceList();
	
	/**
	 * 유저 체험 신청 리스트
	 * @param id
	 * @return 체험리스트
	 */
	List<Experience> selectUserExperienceList(String id);
	
	/**
	 * 특정 체험 정보
	 * @param e_num
	 * @return 체험
	 */
	Experience selectExperience(int e_num);

	/**
	 * 체험 신청
	 * @param apply
	 * @param consent
	 * @return 신청여부
	 */
	boolean apply(Apply apply, Consent consent);
	
	/**
	 * USER 체험 신청 확인
	 * @param id
	 * @return Apply
	 */
	Apply showApply(int e_num, String id);
	
	/**
	 * 체험 취소
	 * @param apply
	 * @return 취소여부
	 */
	boolean concelApply(Apply apply);
	
	/**
	 * 체험 작성보고
	 * @param review
	 * @return 보고여부
	 */
	boolean experienceReport(Review review);
	
	/**
	 * 체험 가이드라인 확인
	 * @param e_num
	 * @return 가이드라인
	 */
	Guide showGuide(int e_num);
	
}
