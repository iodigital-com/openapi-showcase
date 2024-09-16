//
//  Beverage+Api.swift
//  atjesApp Mocked API
//
//  Created by Giel Berkers on 17/06/2024.
//

import Foundation
import AtjesApiClient

extension Beverage {
    static func registerAtje() async throws {
        try await Task.sleep(nanoseconds: 1_000_000_000)
    }
    
    static func getBeveragesOfUser(userId: String) async throws -> [Beverage] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return [
            Beverage(personId: "x", beverageName: "Beer", quantity: 2),
            Beverage(personId: "x", beverageName: "Coca Cola", quantity: 1),
            Beverage(personId: "x", beverageName: "Water", quantity: 3)
        ]
    }
}
