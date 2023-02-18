//
//  ResultCell.swift
//  InstaSearchView
//
//  Created by ChoiKwangWoo on 2023/02/18.
//

import UIKit

class ResultCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // 재사용 되기전에 준비한다.
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 최초에 로딩 될 때 초기화 시켜주는 느낌?
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
