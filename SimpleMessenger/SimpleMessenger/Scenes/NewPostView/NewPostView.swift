//
//  NewPostView.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/7/22.
//

import SwiftUI
import Combine

struct NewPostView: View {
    
    @Binding var shouldShow: Bool
    private let onShareButtonTapAction: ((Post) -> Void)?
    private let user: User
    
    @ObservedObject var viewModel = NewPostViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var cellWidth: CGFloat {
        (UIScreen.main.bounds.width - 50)/3
    }
    
    init(
        shouldShow: Binding<Bool>,
        user: User,
        onShareAction: ((Post) -> Void)?
    ) {
        self._shouldShow = shouldShow
        self.user = user
        self.onShareButtonTapAction = onShareAction
    }
    
    var body: some View {
        ZStack {
            Color.background
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        shouldShow.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Text("New Post")
                    
                    Spacer()
                    
                    Button {
                        shouldShow.toggle()
                        onShareButtonTapAction?(.init(user: user,
                                                      caption: viewModel.caption,
                                                      postImage: viewModel.selectedImage))
                    } label: {
                        Text("Share")
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                ScrollView {
                    Image(uiImage: UIImage(named: viewModel.selectedImage) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing])
                        .frame(height: UIScreen.main.bounds.height * 0.45)
                    
                    TextField("Enter your caption", text: $viewModel.caption)
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.imagesLibrary, id: \.self) { item in
                            Image(uiImage: UIImage(named: item) ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: cellWidth, height: cellWidth)
                                .clipped()
                                .onTapGesture {
                                    viewModel.selectedImage = item
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.onAppearAction()
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(shouldShow: .constant(true), user: .init()) { _ in }
    }
}
