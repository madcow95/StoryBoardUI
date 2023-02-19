//
//  HomeViewController.swift
//  InstaSearchView
//
//  Created by ChoiKwangWoo on 2023/02/19.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var UICollectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UICollectionVIew.dataSource = self
        UICollectionVIew.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = UICollectionVIew.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        let image = "animal\(indexPath.item + 1)"
        cell.configure(image)
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 높이 : 너비 = 4 : 3
        let width = collectionView.bounds.width
        let height = width * 3/4 + 60
        return CGSize(width: width, height: height)
    }
}
