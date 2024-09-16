package nl.iodigital.atjes.backend.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public record Beverage(@Id String personId, String beverageName, Integer quantity) {
}
