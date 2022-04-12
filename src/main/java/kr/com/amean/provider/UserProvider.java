package kr.com.amean.provider;

import java.util.List;

import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;

public interface UserProvider {

	User login(String id, String pw);
	
	boolean idCheck(String id);
	
	boolean join(User user);

	boolean addNaverId(String nId, String userId);

	boolean insertArea(Area area);

	List<Address> userAddressList(String id);

	Address userAddress(String id, int aNum);

	boolean insertAddress(Address address);

	boolean updateAddress(Address address);

	boolean removeAddress(String id, int aNum);

	boolean insertInterest(Interest interest);
	
	boolean updateUserInfo(User user);
	
	boolean updatePW(String id, String PW);
	
	String selectID(String name, String phone_number);
	
	boolean removeUser(User user);
    
}
