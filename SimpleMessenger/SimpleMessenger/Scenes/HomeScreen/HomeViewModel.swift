//
//  HomeViewModel.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var selectedUser: User = .init()
    @Published var userList: [User] = []
    @Published var postList: [Post] = []
    private var newPosts: [Post] = []
    
    private let postService: PostService
    private let userService: UserService
    
    init(userService: UserService, postService: PostService) {
        self.userService = userService
        self.postService = postService
    }
    
    func findUser(userId: String) -> User? {
        userList.filter({ $0.id == userId }).first
    }
    
    func addNewPost(_ post: Post) {
        newPosts.append(post)
        postList.append(contentsOf: newPosts)
    }
    
    func changeUserAction() {
        getUserPosts()
    }
    
    func onAppearAction() {
        getUsers()
        getUserPosts()
    }
}

// MARK: Private methods
private extension HomeViewModel {
    func getUsers() {
        userList = userService.fetchUsers()
        selectedUser = userList[0]
    }
    
    func getUserPosts() {
        postList = postService.fetchPosts(user: selectedUser)
        postList.append(contentsOf: newPosts)
    }
}
