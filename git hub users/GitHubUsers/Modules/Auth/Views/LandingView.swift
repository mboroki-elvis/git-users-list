//
//  AuthentificationView.swift
//  GitHubUsers
//
//  Created by Elvis Mwenda on 18/12/2023.
//

import SwiftUI

struct LandingView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Bindable var viewModel: AuthenticationViewModel
    var body: some View {
        ZStack {
            Color.accentColor.opacity(0.4).ignoresSafeArea()
            VStack {
                Button(action: {
                    viewModel.startFlow(router: router)
                }, label: {
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
    }
}

#Preview {
    LandingView(viewModel: AuthenticationViewModel())
        .environment(AppRouter(.auth(.authorize)))
}
