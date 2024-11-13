//
//  PhotoCell.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

import UIKit

class PhotoCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - ReusableCell
    public static var height: CGFloat = 128.0

    // MARK: - ConfigurableCell
    func configure(_ item: PhotoViewModel, at indexPath: IndexPath) {
        label.text = item.caption
        imageView.image = UIImage(named: item.imageName)
    }
}
