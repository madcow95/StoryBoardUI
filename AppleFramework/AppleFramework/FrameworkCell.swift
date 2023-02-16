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
    
    // 페이지 로드될때?
    override func awakeFromNib() {
        super.awakeFromNib()
        // 줄 하나로 표시
        nameLabel.numberOfLines = 1
        // font size를 알맞게 조정해라
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
