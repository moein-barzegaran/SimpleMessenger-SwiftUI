//
//  NewPostViewModel.swift
//  SimpleMessenger
//
//  Created by Moein Barzegaran on 8/7/22.
//

import Foundation
import UIKit

class NewPostViewModel: ObservableObject {
    
    @Published var imagesLibrary: [String] = []
    @Published var selectedImage: String = ""
    @Published var caption: String = ""
    
    func onAppearAction() {
        imagesLibrary = fetchImages()
        selectedImage = imagesLibrary.first ?? ""
    }
    
    func fetchImages() -> [String] {
        return Array(1...8).map({ "image-\($0)" })
    }
}
