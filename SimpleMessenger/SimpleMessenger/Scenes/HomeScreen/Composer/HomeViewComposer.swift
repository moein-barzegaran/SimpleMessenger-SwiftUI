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
    
    static func makeHomeViewModel(userList: [User]) -> HomeView {
        let viewModel = HomeViewModel(userList: userList, selectedUser: userList[0])
        return compose(viewModel: viewModel)
    }
}
