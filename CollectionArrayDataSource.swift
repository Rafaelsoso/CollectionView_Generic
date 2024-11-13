//
//  CollectionArrayDataSource.swift
//  CollectionView_Generic
//
//  Created by anh.nguyen3 on 13/11/24.
//

import Foundation
import UIKit

public typealias CollectionItemSelectionHandlerType = (IndexPath) -> Void

open class CollectionArrayDataSource<T, Cell: UICollectionViewCell>: NSObject,
        UICollectionViewDataSource, UICollectionViewDelegate where Cell: ConfigurableCell, Cell.T == T {

    // MARK: - Delegates
    public var collectionItemSelectionHandler: CollectionItemSelectionHandlerType?

    // MARK: - Private Properties
    let collectionView: UICollectionView
    var items: [[T]]

    public init(collectionView: UICollectionView, array: [[T]]) {
        self.collectionView = collectionView
        self.items = array
        super.init()
        setup()
    }

    func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - UICollectionViewDataSource
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section >= 0 && section < items.count else {
            return 0
        }
        return items[section].count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier,
            for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.section][indexPath.row]
        cell.configure(item, at: indexPath)
        return cell
    }

    // MARK: - UICollectionViewDelegate
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionItemSelectionHandler?(indexPath)
    }
}
