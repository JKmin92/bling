package kr.com.amean.provider;

import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;

public interface UserProvider {

	User login(String id, String pw);
	
	boolean idCheck(String id);
	
	boolean join(User user);

	boolean insertArea(Area area);

	boolean insertInterest(Interest interest);
	
	boolean updateUserInfo(User user);
	
	boolean updatePW(String id, String PW);
	
	String selectID(String name, String phone_number);
	
	boolean removeUser(User user);
    
}
