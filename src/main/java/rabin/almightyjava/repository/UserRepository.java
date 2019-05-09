package rabin.almightyjava.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import rabin.almightyjava.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByLoginNameAndPassword(String userName, String password);
}
