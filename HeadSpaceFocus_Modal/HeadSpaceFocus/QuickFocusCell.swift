//
//  QuickFocusCell.swift
//  HeadSpaceFocus
//
//  Created by ChoiKwangWoo on 2023/02/26.
//

import UIKit

class QuickFocusCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(_ focus: QuickFocus) {
        thumbnailImageView.image = UIImage(named: focus.imageName)
        titleLabel.text = focus.title
        descriptionLabel.text = focus.description
    }
}
