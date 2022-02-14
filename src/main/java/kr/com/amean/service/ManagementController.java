package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.Apply;

public interface ManagementController {
	
	/**
	 * 특정 체험 모집 현황
	 * @param e_num
	 * @return 신청 리스트
	 */
	List<Apply> selectApplyList(int e_num);

}
