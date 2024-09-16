package nl.iodigital.atjes.backend.logic.db;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nl.iodigital.atjes.backend.domain.User;

@Repository
public interface UserDao extends JpaRepository<User, String>{
}
