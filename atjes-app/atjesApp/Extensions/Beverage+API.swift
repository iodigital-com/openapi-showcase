//
//  Beverage+API.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import Foundation
import AtjesApiClient

extension Beverage {
    enum BeverageError: Error {
        case noUserId
        case unexpectedError
    }
    
    static func registerAtje() async throws {
        guard let userId = User.storedKey else {
            throw BeverageError.noUserId
        }
        
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            BeverageAPI.registerBeverage(
                beverage: Beverage(
                    personId: userId,
                    beverageName: "Beer",
                    quantity: 1
                )
            ) { result, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
    
    static func getBeveragesOfUser(userId: String) async throws -> [Beverage] {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<[Beverage], Error>) in
            BeverageAPI.getBeveragesOfUser(id: userId) { result, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                if let result {
                    continuation.resume(returning: result)
                    return
                }
                
                continuation.resume(throwing: BeverageError.unexpectedError)
            }
        }
    }
}
