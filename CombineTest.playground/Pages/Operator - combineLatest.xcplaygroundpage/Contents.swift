//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest : 두개의 퍼블리셔를 동시에 받는것
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

strPublisher.combineLatest(numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}
// 위와 같은 코드지만 작성만 다르게
//Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, int) in
//    print("CombineLatest str, int >> \(str), \(int)")
//}

strPublisher.send("a") // ""
strPublisher.send("b") // ""
strPublisher.send("c") // ""
numPublisher.send(2) // "c 2"
numPublisher.send(3) // "c 3"
strPublisher.send("d") // "d 3"
numPublisher.send(2) // "d 2"

// Advanced CombineLatest
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendetialSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map{ (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { value in
        print("Credential valid? : \(value)")
    }

usernamePublisher.send("ChoiKW")
passwordPublisher.send("choi123")
passwordPublisher.send("veryStrongPassword")

// Merge
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

let meredPublisherSubscription = publisher1.merge(with: publisher2) // 두 Publisher의 타입이 같아야함
    .sink { value in
        print("Merged Value : \(value)")
    }

//: [Next](@next)
