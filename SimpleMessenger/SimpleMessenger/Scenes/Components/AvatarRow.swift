//
//  AvatarRow.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import SwiftUI

struct AvatarRow: View {
    struct Input {
        let title: String
        let subtitle: String?
        let image: UIImage?
    }
    
    @State var input: Input
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if let image = input.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(Circle())
                    .padding(8)
            }
            
            VStack (alignment: .leading) {
                Text(input.title)
                    .foregroundColor(.black)
                    .padding([.leading, .top], 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let subtitle = input.subtitle {
                    Text(subtitle)
                        .foregroundColor(.gray)
                        .padding([.leading, .bottom], 2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        AvatarRow(input:
                .init(title: "User 1",
                      subtitle: "User_1",
                      image: UIImage(systemName: "person.circle.fill"))
        )
        .previewLayout(.sizeThatFits)
    }
}
