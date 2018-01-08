//
//  FunListView.swift
//  PracticeApp
//
//  Created by Atsushi Miyake on 2018/01/07.
//  Copyright © 2018年 Atsushi Miyake. All rights reserved.
//

import UIKit

final class FunListView: UIView {
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            self.layout = UICollectionViewFlowLayout()
            self.collectionView.collectionViewLayout = self.layout
            self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
            self.collectionView.ex.register(cellType: FunCell.self)
            self.collectionView.ex.register(cellType: FunLabelCell.self)
        }
    }
    
    private var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout() {
        didSet {
            // self sizing by autolayout
            self.layout.estimatedItemSize = CGSize(width: 1.0, height: 1.0)
            self.layout.sectionInset      = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            self.layout.minimumLineSpacing      = 10
            self.layout.minimumInteritemSpacing = 10
        }
    }
    
    private let brands = ["NOMOS", "mercibeaucoup,"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension FunListView: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDataSource
extension FunListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.ex.dequeueReusableCell(with: FunCell.self, for: indexPath)
        cell.text = self.brands[indexPath.row]
        return cell
    }
}