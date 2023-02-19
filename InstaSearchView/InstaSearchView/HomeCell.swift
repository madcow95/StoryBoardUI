//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by ChoiKwangWoo on 2023/02/19.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImage.image = nil
    }
    
    func configure(_ imgName: String) {
        return thumbnailImage.image = UIImage(named: imgName)
    }
}
