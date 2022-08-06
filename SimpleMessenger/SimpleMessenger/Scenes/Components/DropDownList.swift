//
//  DropDownList.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/6/22.
//

import SwiftUI

struct DropDownList: View {
    struct DropDownItem: Identifiable {
        let id = UUID()
        let image: UIImage?
        let title: String
        let subtitle: String?
    }
    
    let dataSource: [DropDownItem]
    let rowTapAction: ((DropDownItem) -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(dataSource.indices, id: \.self) { index in
                Button(action: {
                    rowTapAction?(dataSource[index])
                }) {
                    AvatarRow(input: .init(title: dataSource[index].title,
                                           subtitle: dataSource[index].subtitle,
                                           image: dataSource[index].image))
                }
                .frame(width: .none, height: .none, alignment: .center)
                
                if dataSource.count - 1 != index {
                    Divider()
                }
            }
        }.padding(.all, 12)
            .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
    }
}

struct DropDownList_Previews: PreviewProvider {
    static var previews: some View {
        DropDownList(dataSource: [
            .init(image: UIImage(systemName: "person.circle.fill"), title: "User 1", subtitle: "@user_1"),
            .init(image: UIImage(systemName: "person.circle.fill"), title: "User 2", subtitle: "@user_2")
        ]) { _ in
            
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
