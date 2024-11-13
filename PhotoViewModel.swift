//
//  PhotoViewModel.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

import Foundation

struct PhotoViewModel {
    public let caption: String
    public let imageName: String

    public init(caption: String, imageName: String) {
        self.caption = caption
        self.imageName = imageName
    }
}
