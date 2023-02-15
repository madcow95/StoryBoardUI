//
//  ChatListViewController.swift
//  ChatList
//
//  Created by ChoiKwangWoo on 2023/02/15.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list.sorted(by: {$0.date > $1.date})
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data, Presentation, Layout
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// protocol 같은 경우에는 해야할 일의 약속들 아 기억난다
// 실제로 구현해야 하는 것들을 정의 해야됨
// 쓰다보니 약간 공식처럼 쓰게되는것 같다.
extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
        
    }
}

// Collection View의 여러가지 역할중에 Layout에 대한 역할을 위임
extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
