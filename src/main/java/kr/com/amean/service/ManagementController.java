package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.Apply;

public interface ManagementController {
	
	/**
	 * Ư�� ü�� ���� ��Ȳ
	 * @param e_num
	 * @return ��û ����Ʈ
	 */
	List<Apply> selectApplyList(int e_num);

}
