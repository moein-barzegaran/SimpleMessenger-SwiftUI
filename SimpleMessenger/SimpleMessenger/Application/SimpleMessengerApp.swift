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
            HomeViewComposer.makeHomeViewModel(userList: [
                .init(name: "User 1",
                      username: "@User_1",
                      image: UIImage(systemName: "person.circle.fill")),
                .init(name: "User 2",
                      username: "@User_2",
                      image: UIImage(systemName: "person.circle.fill")),
                .init(name: "User 3",
                      username: "@User_3",
                      image: UIImage(systemName: "person.circle.fill"))
            ])
        }
    }
}
