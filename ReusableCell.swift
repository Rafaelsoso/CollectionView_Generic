//
//  Untitled.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

public protocol ReusableCell {
   static var reuseIdentifier: String { get }
}

public extension ReusableCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
