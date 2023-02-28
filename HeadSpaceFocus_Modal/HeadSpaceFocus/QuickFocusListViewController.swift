//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by ChoiKwangWoo on 2023/02/26.
//

import UIKit

class QuickFocusListViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    let breathingList = QuickFocus.breathing
    let walkingList = QuickFocus.walking
    
    enum Section: CaseIterable {
        case breath
        case walking
        
        var title: String {
            switch self {
                case .breath: return "Breathing exercise"
                case .walking: return "Mindful walks"
            }
        }
    }
    typealias Item = QuickFocus
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionVIew, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // Data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        // 위와 같은 표현임
        // snapshot.appendSections(Section.allCases)
        snapshot.appendItems(breathingList, toSection: .breath)
        snapshot.appendItems(walkingList, toSection: .walking)
        dataSource.apply(snapshot)
        
        // Layout
        collectionVIew.collectionViewLayout = layout()
        
        // breath, walking을 전부 가져올 수 있음
        // Section.allCases
        // allItems: [Section] = [.breath, .walking] 과 같은 표현임
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
