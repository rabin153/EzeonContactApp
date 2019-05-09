package rabin.almightyjava.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rabin.almightyjava.domain.User;
import rabin.almightyjava.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;

	public static final Integer LOGIN_STATUS_ACTIVE = 1;
	public static final Integer LOGIN_STATUS_BLOCKED = 2;

	public static final Integer ROLE_ADMIN = 1;

	public static final Integer ROLE_USER = 2;

	public User saveUser(User user) {
		return userRepository.save(user);
	}

	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}

	public User findById(Long userId) {
		return userRepository.getOne(userId);
	}

	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User authenticate(String loginName, String loginPassword) {
		return userRepository.findByLoginNameAndPassword(loginName, loginPassword);
	}

}
