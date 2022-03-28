package kr.com.amean.provider.mapper;

import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;

public interface UserMapper {

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
