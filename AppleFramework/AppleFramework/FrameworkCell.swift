//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by ChoiKwangWoo on 2023/02/16.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
