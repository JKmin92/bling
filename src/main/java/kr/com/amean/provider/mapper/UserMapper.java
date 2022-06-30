package kr.com.amean.provider.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.com.amean.entity.bank.Bank;
import kr.com.amean.entity.bank.Cumalative;
import kr.com.amean.entity.bank.BankTake;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Interest;
import kr.com.amean.entity.user.User;
import kr.com.amean.entity.user.Channel;

@Mapper
public interface UserMapper {

    User login(String id, String pw);

	User loginChannel(String channel, String channelId);

	User userData(String id);
	
	String getUserKey(String id);

	boolean idCheck(String id);

	String findUser(String id, String phone);

	boolean updatePasswordtoFind(String id, String password, String userKey);
	
	boolean join(User user);

	boolean addNaverId(String nId, String userId);

	boolean insertArea(Area area);

	List<Address> userAddressList(String id);

	Address userAddress(String id, int aNum);

	int insertAddress(Address address);

	boolean updateAddress(Address address);

	Address basicAddress(String id);

	Address activeAddress(String id, int aNum);

	Address applyAddress(int aNum);

	boolean removeAddress(String id, int aNum);

	boolean insertInterest(Interest interest);
	
	boolean updateUserInfo(User user);
	
	boolean updatePW(String id, String PW);
	
	String selectID(String name, String phone_number);
	
	boolean removeUser(User user);

	List<Cumalative> selectCumalativeList(String id);

	List<BankTake> selectTakeList(String id);

	Bank selectBank(String id);

	boolean insertBank(Bank bank);

	boolean updateBank(Bank bank);

	boolean insertBankTake(BankTake bankTake);

	int insertChannel(Channel channel);

	boolean updateChanel(Channel channel);
    
	Channel basicChannel(String id, int channelCode);

	Channel applyChannel(String id, int channelCode);

	List<Channel> userChannel(String id);

	List<Area> userArea(String id);

	Interest userInterest(String id);

	boolean updateArea(Area area);

	boolean updateInterest(Interest interest);

	boolean deleteInterest(String id);

	boolean deleteArea(String id);

	boolean onChannelKakaoId(String id, String channelId);

	boolean offChannelKakaoId(String id);

	boolean onChannelNaverId(String id, String channelId);

	boolean offChannelNaverId(String id);

	boolean onChannelFacebookId(String id, String channelId);

	boolean offChannelFacebookId(String id);
}
