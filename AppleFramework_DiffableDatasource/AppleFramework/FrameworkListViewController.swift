//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Presentation, Data, Layout
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            // let data = dataList[indexPath.item] 이런 식으로 가져왔지만
            // 이제는 item으로 사용하면 됨
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections([.main])
        snapShot.appendItems(list, toSection: .main)
        dataSource.apply(snapShot)
        
        collectionView.collectionViewLayout = layout()
        /*
            diffable datasource
            - presentation
                --snapshot
            - Data
         
            compositional layout
            - layout
         */
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // 그룹 안의 아이템 정보
        // fractionalWidth : 그룹에서 item의 넓이
        // fractionalHeight: 그룹에서 item의 높이
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        // Group : 화면의 한 줄의 사이즈를 groupSize로 조절하고, 보여줄 항목을 Item, 개수를 count로 표현함
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        // section : 화면 전체
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
    }
}
