//
//  HomeViewComposer.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import Foundation

struct HomeViewComposer {
    static func compose(viewModel: HomeViewModel) -> HomeView {
        .init(viewModel: viewModel)
    }
    
    static func makeHomeViewModel() -> HomeView {
        let viewModel = HomeViewModel(userService: MockUserService(),
                                      postService: MockPostService())
        return compose(viewModel: viewModel)
    }
}
