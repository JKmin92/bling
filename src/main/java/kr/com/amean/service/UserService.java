package kr.com.amean.service;

import kr.com.amean.entity.User;

public interface UserService {
	
	/**
	 * 로그인
	 * @param id
	 * @param pw
	 * @return User
	 */
	User login(String id, String pw);
	
	/**
	 * id 확인
	 * @param id
	 * @return 여부 확인
	 */
	boolean idCheck(String id);
	
	/**
	 * 회원가입
	 * @param user
	 * @return 가입여부
	 */
	boolean join(User user);
	
	/**
	 * 회원정보수정
	 * @param user
	 * @return 수정여부
	 */
	boolean updateUserInfo(User user);
	
	/**
	 * 비밀번호 변경
	 * @param id
	 * @param PW
	 * @return 수정여부
	 */
	boolean updatePW(String id, String PW);
	
	/**
	 * 아이디 찾기
	 * @param name
	 * @param phone_number
	 * @return 아이디
	 */
	String selectID(String name, String phone_number);
	
	/**
	 * 회원탈퇴
	 * @param user
	 * @return 탈퇴여부
	 */
	boolean removeUser(User user);

}
