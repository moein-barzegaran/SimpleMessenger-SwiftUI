//
//  User.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import UIKit

class User: Identifiable {
    let id = UUID()
    let name: String
    let username: String
    let image: UIImage?
    var posts: [Post]
    
    init(name: String, username: String, image: UIImage?, posts: [Post] = []) {
        self.name = name
        self.username = username
        self.posts = posts
        self.image = image
    }
}
