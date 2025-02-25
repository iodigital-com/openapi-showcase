//
//  User+NewUser.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import Foundation
import AtjesApiClient

extension User {
    enum ApiError: Error {
        case unexpectedError
    }

    static var storedKey: String? {
        UserDefaults.standard.string(forKey: "userId")
    }
    
    static func createNewUser(name: String) async throws -> User {
        let user = User(
            id: UUID().uuidString,
            name: name
        )
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<User, Error>) in
            UserAPI.registerUser(user: user) { result, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    UserDefaults.standard.set(user.id, forKey: "userId")
                    continuation.resume(returning: user)
                }
            }
        }
    }
    
    static func getUser() async throws -> User? {
        guard let userId = Self.storedKey else {
            return nil
        }
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<User, Error>) in
            UserAPI.getUser(id: userId) { user, error in
                if let error {
                    continuation.resume(throwing: error)
                } else if let user {
                    continuation.resume(returning: user)
                } else {
                    continuation.resume(throwing: ApiError.unexpectedError)
                }
            }
        }
    }
}
