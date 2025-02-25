package nl.iodigital.atjes.backend.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public record UserEntity(@Id String id, String name) {
}
