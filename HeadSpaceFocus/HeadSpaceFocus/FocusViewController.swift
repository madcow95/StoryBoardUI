//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by ChoiKwangWoo on 2023/02/22.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    
    var items: [Focus] = Focus.list
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = Focus
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Presentation, Data, Layout
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
        refreshButton.layer.cornerRadius = 10
        // SnapShot
        updateButton()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        // estimate: 기본적으로 입력한 값으로 설정을 하는데 변경이 될 수 있다
        // 유동적으로 변경이 가능한가봄 최소값 느낌? 
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // 상하좌우 Padding
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        // Gruop간 Padding
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    @IBAction func refreshBtnTapped(_ sender: Any) {
        curated.toggle()
        
        updateButton()
    }
    
    func updateButton() {
        self.items = curated ? Focus.recommendations : Focus.list
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
        
        let title = curated ? "See All" : "Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
}
