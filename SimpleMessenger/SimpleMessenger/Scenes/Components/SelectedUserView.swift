//
//  SelectedUserView.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import SwiftUI

struct SelectedUserView: View {
    
    @Binding var selectedUser: User
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if let image = selectedUser.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(Circle())
                    .padding(8)
            }
            
            VStack (alignment: .leading) {
                Text(selectedUser.name)
                    .foregroundColor(.black)
                    .padding([.leading, .top], 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let subtitle = selectedUser.username {
                    Text(subtitle)
                        .foregroundColor(.gray)
                        .padding([.leading, .bottom], 2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}
