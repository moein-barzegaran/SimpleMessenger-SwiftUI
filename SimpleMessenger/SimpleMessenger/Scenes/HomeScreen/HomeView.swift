//
//  HomeView.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/4/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showNewPost = false
    @State private var showUserList = false
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack(alignment: .center, spacing: .zero) {
                    SelectedUserView(selectedUser: $viewModel.selectedUser)
                        .padding(.leading, 24)
                        .padding([.top, .bottom], 4)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .padding([.leading])
                                .foregroundColor(.rowBackground)
                        )
                        .onTapGesture {
                            withAnimation {
                                showUserList.toggle()
                            }
                        }
                    
                    Button {
                        showNewPost.toggle()

                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .tint(.rowBackground)
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                }
                .padding(.top)
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.postList, id: \.id) { item in
                            PostView(post: item)
                        }
                    }
                }
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
                            guard let selectedUser = viewModel.userList.filter({ $0.username == username }).first else { return }
                            viewModel.selectedUser = selectedUser
                            viewModel.changeUserAction()
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
        .onAppear {
            viewModel.onAppearAction()
        }
        .sheet(isPresented: $showNewPost) {
            NewPostView(shouldShow: $showNewPost, user: viewModel.selectedUser) { post in
                viewModel.addNewPost(post)
            }
        }
    }
    
    func map(userList: [User]) -> [DropDownList.DropDownItem] {
        userList.map({ .init(image: $0.image, title: $0.name, subtitle: $0.username)})
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(userService: MockUserService(),
                                  postService: MockPostService()))
    }
}
