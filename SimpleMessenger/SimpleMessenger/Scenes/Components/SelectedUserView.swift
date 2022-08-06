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
            
            HStack(alignment: .center) {
                Text(selectedUser.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.textSecondary)
                
                if let subtitle = selectedUser.username {
                    Text(subtitle)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(Color.textSecondary.opacity(0.7))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct SelectedUserView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedUserView(selectedUser: .constant(.init(name: "User 1",
                                                       username: "@User1",
                                                       image: UIImage(named: "user-1"))))
    }
}

