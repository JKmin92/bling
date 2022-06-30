package kr.com.amean.service;

import java.util.Date;
import java.util.List;

import kr.com.amean.entity.experience.Guide;
import kr.com.amean.entity.experience.InterestCampaign;
import kr.com.amean.entity.experience.Apply;
import kr.com.amean.entity.experience.Consent;
import kr.com.amean.entity.experience.Experience;
import kr.com.amean.entity.experience.Review;
import kr.com.amean.entity.experience.UserConsent;

public interface ExperienceSerivce {

	int addExperience(Experience experience);

	boolean updateExperience(Experience experience);

	boolean insertConsent(Consent consent);

	List<Consent> selectConsent(int e_num);

	boolean updateConsent(Consent content);

    boolean removeConsent(int c_num);

	int addGuide(Guide guide);

	Guide selectExperGuide(int gNum);

	Guide selectEpxerGuideForENum(int e_num);

	int updateExperImage(String mainImage, String contents, int eNum);
	
	/**
	 * ��ü ü�� ����Ʈ
	 * @return ü�踮��Ʈ
	 */
	List<Experience> selectExperienceList();

	List<Experience> selectExperienceList(String mCategory);
	
	boolean dropApply(int a_num);

	boolean cancelApply(int a_num, Date cancelDate, String cancelReason);

	boolean cancelApply(int a_num, String id);
	
	/**
	 * Ư�� ü�� ����
	 * @param e_num
	 * @return ü��
	 */
	Experience selectExperience(int e_num);

	List<Apply> applyListManager(int eNum);

	List<Apply> userApplyList(String id);
	
	Apply selectApply(int a_num);

	int insertApply(Apply apply);

	boolean addApplyCount(int e_num);
	
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

	boolean changeApplyState(int a_num, int state);
	
	/**
	 * ü�� �ۼ�����
	 * @param review
	 * @return ��������
	 */
	int experienceReport(Review review);

	boolean reviewReport(int r_num, String blog, String instagram, String homepage, String store, String receipt);
	
	/**
	 * ü�� ���̵���� Ȯ��
	 * @param e_num
	 * @return ���̵����
	 */
	Guide showGuide(int e_num);

	Review getReview(int a_num, String id);

	boolean submitReport(int a_num);

	boolean modifyReview(Review review);

	boolean updateExperienceOpen(int e_num, boolean open);

	boolean registInterestCampaign(InterestCampaign interestCampaign);

	List<InterestCampaign> selectInterestCampaignList(String id);

	boolean deleteInterestCampaign(int ic_num);

	boolean registUserConsent(UserConsent userConsent);

	UserConsent selectUserConsent(String id, int a_num);
	
}
