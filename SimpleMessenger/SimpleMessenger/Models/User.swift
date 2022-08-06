//
//  User.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import UIKit

class User: Identifiable {
    let id: String
    let name: String
    let username: String
    let image: UIImage?
    
    init(name: String, username: String, image: UIImage?) {
        self.id = UUID().uuidString
        self.name = name
        self.username = username
        self.image = image
    }
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.username = ""
        self.image = nil
    }
}
