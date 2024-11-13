//
//  ConfigurableCell.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

import Foundation

public protocol ConfigurableCell: ReusableCell {
   associatedtype T // make ConfigurableCell as a generic protocol

   func configure(_ item: T, at indexPath: IndexPath)
}
