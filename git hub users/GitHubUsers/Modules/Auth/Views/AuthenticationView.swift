//
//  AuthenticationView.swift
//  GitHubUsers
//
//  Created by Elvis Mwenda on 18/12/2023.
//

import SwiftUI

struct AuthenticationView: View {
    @Environment(AppRouter.self) private var router: AppRouter
    @Bindable var viewModel: AuthenticationViewModel
    let url: URL
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(.circular)
                .foregroundStyle(.accent)

            Text("Login you in")
        }.onAppear {
            viewModel.obtainAccessToken(url: url, router: router)
        }
    }
}

#Preview {
    AuthenticationView(
        viewModel: AuthenticationViewModel(),
        url: URL(string: "www.google.com")!
    )
    .environment(AppRouter(.auth(.authorize)))
}
