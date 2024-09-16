//
//  LoadingView.swift
//  atjesApp
//
//  Created by Giel Berkers on 17/06/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image(systemName: "star.fill")
                .font(.system(size: 200))
                .foregroundStyle(Color.yellow)
            Text("🍻")
                .font(.system(size: 150))
        }
    }
}

#Preview {
    LoadingView()
}
