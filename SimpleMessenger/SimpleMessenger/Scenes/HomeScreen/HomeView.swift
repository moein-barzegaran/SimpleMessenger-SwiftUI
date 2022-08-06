//
//  HomeView.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/4/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showUserList = false
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                SelectedUserView(selectedUser: $viewModel.selectedUser)
                .padding()
                .padding(.leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                )
                .padding(.top)
                .onTapGesture {
                    withAnimation {
                        showUserList.toggle()
                    }
                }
                
                Spacer()
            }
            
            if showUserList {
                ZStack {
                    Color.black.opacity(0.7)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showUserList = false
                        }
                    
                    VStack {
                        DropDownList(
                            dataSource: map(userList: viewModel.userList)
                        ) { item in
                            showUserList = false
                            guard let username = item.subtitle else { return }
                            guard let selectedUser = viewModel.findUser(username: username) else { return }
                            viewModel.selectedUser = selectedUser
                            print(selectedUser.username)
                        }
                        .padding()
                        .transition(
                            AnyTransition.opacity.animation(.linear(duration: 0.1))
                        )
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    func map(userList: [User]) -> [DropDownList.DropDownItem] {
        userList.map({ .init(image: $0.image, title: $0.name, subtitle: $0.username)})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel:
                .init(userList: [.init(name: "User 1",
                                       username: "@User_1",
                                       image: UIImage(systemName: "person.circle.fill"))],
                      selectedUser: .init(name: "User 1",
                                          username: "@User_1",
                                          image: UIImage(systemName: "person.circle.fill"))))
    }
}
