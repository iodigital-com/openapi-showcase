//
//  SetupUserView.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import SwiftUI
import AtjesApiClient

struct SetupUserView: View {
    @EnvironmentObject private var state: StateModel
    @State private var name: String = ""
    @State private var isErrorVisible: Bool = false
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello new user")
            Text("What is your name?")
            
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            
            Button(
                "Submit",
                action: {
                    createNewUser()
                }
            )
            .disabled(isLoading)
        }
        .overlay {
            if isLoading {
                ZStack {
                    Color.white.opacity(0.7)
                    ProgressView()
                }
            }
        }
        .alert(
            "Something went wrong",
            isPresented: $isErrorVisible,
            actions: {}
        )
    }
    
    // MARK: - Functions
    
    private func createNewUser() {
        Task {
            do {
                isLoading = true
                state.user = try await User.createNewUser(name: name)
            } catch {
                state.user = nil
                isErrorVisible = true
            }
            isLoading = false
        }
    }
}

#Preview {
    SetupUserView()
        .environmentObject(StateModel())
}
