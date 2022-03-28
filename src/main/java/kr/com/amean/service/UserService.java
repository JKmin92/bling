package kr.com.amean.service;

import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;

public interface UserService {
	
	/**
	 * �α���
	 * @param id
	 * @param pw
	 * @return User
	 */
	User login(String id, String pw);
	
	/**
	 * id Ȯ��
	 * @param id
	 * @return ���� Ȯ��
	 */
	boolean idCheck(String id);
	
	/**
	 * ȸ������
	 * @param user
	 * @return ���Կ���
	 */
	boolean join(User user);

	boolean addArea(Area area);

	boolean addInterest(Interest interest);
	
	/**
	 * ȸ����������
	 * @param user
	 * @return ��������
	 */
	boolean updateUserInfo(User user);
	
	/**
	 * ��й�ȣ ����
	 * @param id
	 * @param PW
	 * @return ��������
	 */
	boolean updatePW(String id, String PW);
	
	/**
	 * ���̵� ã��
	 * @param name
	 * @param phone_number
	 * @return ���̵�
	 */
	String selectID(String name, String phone_number);
	
	/**
	 * ȸ��Ż��
	 * @param user
	 * @return Ż�𿩺�
	 */
	boolean removeUser(User user);

}
