//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by kwangWoo choi on 2023/03/07.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    // 2. User Profile
    @Published private(set) var user: UserProfile?
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    // 1. setupUI
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    // Search Control
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchControl = UISearchController(searchResultsController: nil)
        searchControl.hidesNavigationBarDuringPresentation = false
        searchControl.searchBar.placeholder = "검색할 아이디"
        searchControl.searchResultsUpdater = self
        // 검색하거나 엔터를 눌렀을 때 event 잡기 위해서
        searchControl.searchBar.delegate = self
        self.navigationItem.searchController = searchControl
    }
    
    // 3. bind
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(result)
            }.store(in: &subscriptions)
    }
    
    private func update(_ user: UserProfile?) {
        guard let user = user else {
            self.nameLabel.text = "N/A"
            self.loginLabel.text = "N/A"
            self.followerLabel.text = "0"
            self.followingLabel.text = "0"
            self.thumbnail.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "followers: \(user.followers)"
        self.followingLabel.text = "followings: \(user.following)"
        // image url -> image로 변환
        self.thumbnail.kf.setImage(with: user.avatarUrl)
    }
    
    // Network
    
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        let base = "https://api.github.com/"
        let path = "users/\(keyword)"
        let params: [String: String] = [:]
        let header: [String: String] = ["Content-Type": "application/json"]
        
        var urlComponent = URLComponents(string: base + path)!
        let queryItems = params.map { (key: String, value: String) in
            return URLQueryItem(name: key, value: value)
        }
        urlComponent.queryItems = queryItems
        
        var request = URLRequest(url: urlComponent.url!)
        header.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        URLSession
            .shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                guard let response = result.response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                    let response = result.response as? HTTPURLResponse
                    let statusCode = response?.statusCode ?? -1
                    throw NetworkError.responseError(statusCode: statusCode)
                }
                return result.data
            }
            .decode(type: UserProfile.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                print("completion text test >> \(completion)")
                switch completion {
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { profile in
                self.user = profile
            }
            .store(in: &subscriptions)
    }
}
