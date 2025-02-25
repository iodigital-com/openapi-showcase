//
//  MainView.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import SwiftUI
import AtjesApiClient

struct MainView: View {
    let user: User
    
    @State private var isLoading: Bool = false
    @State private var isErrorVisible: Bool = false
    @State private var beverages: [Beverage] = []
    
    var body: some View {
        VStack {
            Text("Atjes App")
                .font(.largeTitle)
            
            ZStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 200))
                    .foregroundStyle(Color.yellow)
                Text("🍻")
                    .font(.system(size: 150))
            }

            Text("Hello \(user.name)!")
            
            Button(
                "Atje trekken",
                action: {
                    registerAtje()
                }
            )
            .buttonStyle(BorderedButtonStyle())
            
            // Atjes history:
            Divider()
            Text("Your beverages so far:")
            ForEach(beverages, id: \.self) { beverage in
                HStack {
                    Text(beverage.beverageName)
                    Text("\(beverage.quantity)")
                }
            }
        }
        .onAppear {
            loadBeverages()
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
        .padding()
    }
    
    // MARK: - Functions
    
    private func registerAtje() {
        Task {
            do {
                isLoading = true
                try await Beverage.registerAtje()
            } catch {
                isErrorVisible = false
            }
            isLoading = false
        }
    }
    
    private func loadBeverages() {
        Task {
            do {
                beverages = try await Beverage.getBeveragesOfUser(userId: user.id)
            } catch {
                isErrorVisible = false
            }
        }
    }
}

#Preview {
    MainView(
        user: User(id: "id", name: "name")
    )
}
