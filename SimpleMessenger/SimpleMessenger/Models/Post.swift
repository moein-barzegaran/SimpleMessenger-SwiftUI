//
//  Post.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/5/22.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let name: String
    let username: String
    let caption: String
    let image: String
}
