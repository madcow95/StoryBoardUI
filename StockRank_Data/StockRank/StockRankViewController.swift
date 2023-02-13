//
//  StockRankViewController.swift
//  StockRank
//
//  Created by ChoiKwangWoo on 2023/02/13.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        // Data, Presentation, Layout
        // Data : stockList
        
        // protocol -
        super.viewDidLoad()
        
        // 어떤 데이터를 사용할지
        collectionView.dataSource = self
        // 어떻게 나열할지
        collectionView.delegate = self
    }
}

// Data 담당
extension StockRankViewController: UICollectionViewDataSource {
    // Section에서 데이터의 개수?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // CollectionView에서 Cell을 어떻게 구성할지 알려주는 함수?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용 가능한 Cell을 가지고 오겠다.
        // 여기서는 StockRankViewControllerViewCell(구분자)
        // For : 몇번째 셀거를 가져올거다?
        // 셀을 가져오면 Type은 UICollectionViewCell
        // 을 가져와서 바로 return
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath)
        
        return cell
    }
}

// Layout 담당
extension StockRankViewController: UICollectionViewDelegate {
    
}
