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
    // Section에서 데이터가 몇 개 필요하냐
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
        
        // cell이 StockRankCollectionView 이라면 넘어가고, cell에 casting 된 값이 StockRankCollectionView가 아니라면 else 문을 탄다 여기서는 UICollectionViewCell()을 return 해준다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        /*
            각 셀을 표현할 때 어떤 데이터를 사용할거냐
            indexPath.. 알아서 반복문을 돌면서 indexPath가 바뀐다??
            무슨 뜻인지 잘 모르겠다.
            하다보면 또 알게되겠지
         */
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        return cell
    }
}

// Layout 담당
extension StockRankViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView
        // height = 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
