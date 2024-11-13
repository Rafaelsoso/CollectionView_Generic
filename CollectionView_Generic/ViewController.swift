//
//  ViewController.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    fileprivate var photosDataSource: CollectionArrayDataSource<PhotoViewModel, PhotoCell>? = nil
    fileprivate var selectedIndexPath: IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init data
        let viewModels = (0..<32).map {
            return PhotoViewModel(caption: "Image \($0)", imageName: String($0))
        }

        // config datasource
        photosDataSource = CollectionArrayDataSource<PhotoViewModel, PhotoCell>(collectionView: collectionView, array: [viewModels])
        photosDataSource?.collectionItemSelectionHandler = { [weak self] indexPath in
            guard let strongSelf = self else {
                return
            }
            self?.selectedIndexPath = indexPath
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                viewController.viewModel = viewModels[indexPath.section]
                self?.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }

}
