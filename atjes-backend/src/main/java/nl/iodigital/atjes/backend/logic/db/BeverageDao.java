package nl.iodigital.atjes.backend.logic.db;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nl.iodigital.atjes.backend.domain.BeverageEntity;

@Repository
public interface BeverageDao extends JpaRepository<BeverageEntity, String> {
    List<BeverageEntity> getAllByPersonId(String personId);
}
