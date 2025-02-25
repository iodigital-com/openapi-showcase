//
//  User.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import Foundation
import AtjesApiClient

class StateModel: ObservableObject {
    @Published var user: User?
}
