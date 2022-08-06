//
//  SimpleMessengerApp.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/4/22.
//

import SwiftUI

@main
struct SimpleMessengerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeViewComposer.makeHomeViewModel()
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
