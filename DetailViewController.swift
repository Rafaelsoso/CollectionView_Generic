//
//  DetailViewController.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    var viewModel: PhotoViewModel?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let viewModel = viewModel else {
            return
        }
        title = viewModel.caption
        imageView.image = UIImage(named: viewModel.imageName)
    }
}
