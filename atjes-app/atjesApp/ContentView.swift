//
//  ContentView.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import SwiftUI
import AtjesApiClient

struct ContentView: View {
    @StateObject private var state = StateModel()
    @State private var isLoading: Bool = false
    @State private var isErrorVisible: Bool = false
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                if let user = state.user {
                    MainView(user: user)
                } else {
                    SetupUserView()
                }
            }
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
        .task {
            isLoading = true
            do {
                state.user = try await User.getUser()
            } catch {
                isErrorVisible = true
            }
            isLoading = false
        }
        .environmentObject(state)
    }
}

#Preview {
    ContentView()
}
