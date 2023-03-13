//
//  SearchViewModel.swift
//  GithubUserProfile
//
//  Created by ChoiKwangWoo on 2023/03/13.
//

import Foundation
import Combine

final class SearchViewModel {
    
    let network: NetworkService
    let selectedUser: CurrentValueSubject<UserProfile?, Never>
    
    var name: String {
        return selectedUser.value?.name ?? "N/A"
    }
    var login: String {
        return selectedUser.value?.login ?? "N/A"
    }
    var followers: String {
        guard let value = selectedUser.value?.followers else { return "" }
        return "followers : \(value)"
    }
    var following: String {
        guard let value = selectedUser.value?.following else { return "" }
        return "followings : \(value)"
    }
    var imageURL: URL? {
        return selectedUser.value?.avatarUrl
    }
    
    init(network: NetworkService, selectedUser: UserProfile?) {
        self.network = network
        self.selectedUser = CurrentValueSubject(selectedUser)
    }
    var subscriptions = Set<AnyCancellable>()
    
    // Data -> Output
    @Published private(set) var user: UserProfile?
    
    // User Action -> Input
    func search(keyword: String) {
        let resource = Resource<UserProfile>(base: "https://api.github.com/", path: "users/\(keyword)", params: [:], header: ["Content-Type": "application/json"])
        
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser.send(nil)
                    print("error: \(error)")
                case .finished: break
                }
            } receiveValue: { user in
                self.selectedUser.send(user)
            }.store(in: &subscriptions)
    }
}
