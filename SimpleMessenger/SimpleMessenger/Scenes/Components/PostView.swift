//
//  PostView.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import SwiftUI

struct PostView: View {
    
    @State var post: Post
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack {
                        Image(uiImage: post.user.image ?? UIImage())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(post.user.name)
                                .font(.system(size: 18, weight: .bold))
                            
                            Text(post.user.username)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(post.caption)
                            .font(.system(size: 15, weight: .regular))
                            .padding(.top, 3)
                        
                        HStack {
                            VStack {
                                Image(post.postImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                HStack {
                                    Image(systemName: "message.fill")
                                    Spacer()
                                    Image(systemName: "eye.fill")
                                    Spacer()
                                    Image(systemName: "hand.thumbsup.fill")
                                    Spacer()
                                    Image(systemName: "arrowshape.turn.up.forward.fill")
                                }
                                .foregroundColor(.rowBackground)
                                .padding(.top, 3)
                            }
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.55)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 5)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                
                Divider()
                    .padding([.top, .horizontal])
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: .init(user: .init(name: "User 1",
                                         username: "@User_1",
                                         image: UIImage(named: "user-1")),
                             caption: "egestas quis.",
                             postImage: "image-1"))
        .previewLayout(.sizeThatFits)
    }
}
