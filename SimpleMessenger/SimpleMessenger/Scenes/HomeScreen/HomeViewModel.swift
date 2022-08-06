//
//  HomeViewModel.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var selectedUser: User
    @Published var userList: [User] = []
    
    func findUser(username: String) -> User? {
        userList.filter({ $0.username == username }).first
    }
    
    init(userList: [User], selectedUser: User) {
        self.selectedUser = selectedUser
        self.userList = userList
    }
}
