//
//  FrameworkViewController.swift
//  AppleFramework
//
//  Created by ChoiKwangWoo on 2023/02/16.
//

import UIKit

class FrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    // data, presentation, layout에 대해서 정의를 해줘야한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // AutoLayout에서 Estimate Size를 none으로 바꾸는 걸 코드로 한다면?
        // 아래 코드를 작성해도 되고, Main의 AutoLayout에서 LOV를 수정해도 된다.
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            // .zero == none
            flowlayout.estimatedItemSize = .zero
        }
        
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FrameworkViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        let frameworkData = list[indexPath.item]
        cell.configure(frameworkData)
        return cell
    }
}

extension FrameworkViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
