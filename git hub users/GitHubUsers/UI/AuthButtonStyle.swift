//
//  AuthButtonStyle.swift
//  GitHubUsers
//
//  Created by Elvis Mwenda on 18/12/2023.
//

import SwiftUI

struct AuthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.background(
            configuration.isPressed ? .accent.opacity(0.7) : .accent
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    VStack {
        Button(action: {}, label: {
            HStack(spacing: 8) {
                Text("login with")
                Image("github-mark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            .padding()
        })
        .buttonStyle(AuthButtonStyle())
    }
}
