package rabin.almightyjava.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import rabin.almightyjava.domain.Contact;

public interface ContactRepository extends JpaRepository<Contact, Long> {

}
