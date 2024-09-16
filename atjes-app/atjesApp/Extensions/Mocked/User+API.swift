//
//  User+NewUser.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import Foundation
import AtjesApiClient

extension User {
    static func createNewUser(name: String) async throws -> User {
        let user = User(
            id: UUID().uuidString,
            name: name
        )
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return user
    }
    
    static func getUser() async throws -> User {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return User(
            id: UUID().uuidString,
            name: "John Doe"
        )
    }
}
