//
//  Post.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/5/22.
//

import Foundation

struct Post: Identifiable {
    let id: String
    let user: User
    let caption: String
    let postImage: String
    
    init(
        user: User,
        caption: String,
        postImage: String
    ) {
        self.id = UUID().uuidString
        self.user = user
        self.caption = caption
        self.postImage = postImage
        
    }
}
