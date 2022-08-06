//
//  PostService.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import UIKit

protocol PostService {
    func fetchPosts(user: User) -> [Post]
}

class MockPostService: PostService {
    let users = MockUserService().fetchUsers()
    
    func fetchPosts(user: User) -> [Post] {
        switch user.username {
        case "@User_1":
            return [
                .init(user: user,
                      caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-1"),
                .init(user: users[1],
                      caption: "Lorem ipsum. Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-2"),
                .init(user: users[2],
                      caption: "Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-1"),
                .init(user: users[1],
                      caption: "egestas quis.",
                      postImage: "image-3")
            ]
            
        case "@User_2":
            return [
                .init(user: users[2],
                      caption: "Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-3"),
                .init(user: users[0],
                      caption: "Lorem ipsum.",
                      postImage: "image-5"),
                .init(user: users[1],
                      caption: "Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-4"),
                .init(user: users[0],
                      caption: "egestas quis.",
                      postImage: "image-2")
            ]
            
        case "@User_3":
            return [
                .init(user: users[1],
                      caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Felis bibendum ut tristique et egestas quis.",
                      postImage: "image-6")
            ]
            
        default:
            return []
        }
    }
    
    func mockUsers() -> [User] {
        [
            .init(name: "User 1",
                  username: "@User_1",
                  image: UIImage(named: "user-1")!),
            .init(name: "User 2",
                  username: "@User_2",
                  image: UIImage(named: "user-2")!),
            .init(name: "User 3",
                  username: "@User_3",
                  image: UIImage(named: "user-3")!)
        
        ]
    }
}
