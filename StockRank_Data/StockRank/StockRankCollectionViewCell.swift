//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by ChoiKwangWoo on 2023/02/13.
//

import UIKit

// Stock Model의 데이터를 UI로 만들어주는 Cell
class StockRankCollectionViewCell: UICollectionViewCell {
    /**
        1. UIComponent 연결
        2. UIComponent에 데이터를 업데이트 하는 코드 작성
     */
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(stock.price) 원"
        diffLabel.text = "\(stock.diff) %"
    }
    
    
}
