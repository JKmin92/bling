package kr.com.amean.service;

import java.util.List;

import kr.com.amean.entity.bank.Bank;
import kr.com.amean.entity.bank.BankTake;
import kr.com.amean.entity.bank.Cumalative;
import kr.com.amean.entity.user.Address;
import kr.com.amean.entity.user.Area;
import kr.com.amean.entity.user.Channel;
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

	User loginForChannel(String channel, String channelId);

	User userData(String id);

	String getUserKey(String id);

	String findUser(String id, String phone);

	boolean updatePasswordtoFind(String id, String password, String userKey);
	
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

	boolean addNaverId(String nId, String userId);

	boolean addArea(Area area);

	List<Address> userAddressList(String id);

	Address userAddress(String id, int aNum);

	int insertAddress(Address address);

	boolean updateAddress(Address address);

	boolean removeAddress(String id, int aNum);

	Address basicAddress(String id);

	Address activeAddress(String id, int aNum);

	Address applyAddress(int aNum);

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

	List<Interest> userInterest(String id);

	boolean updateArea(Area area);

	boolean updateInterest(Interest interest);

	boolean deleteInterest(String id);

	boolean deleteArea(String id);

	boolean onChannelKakaoId(String id, String channelId);

	boolean offChannelKakaoId(String id);

	boolean onChannelNaverId(String id, String chnanelId);

	boolean offChannelNaverId(String id);

	boolean onChannelFacebookId(String id, String channelId);

	boolean offChannelFacebookId(String id);

}
