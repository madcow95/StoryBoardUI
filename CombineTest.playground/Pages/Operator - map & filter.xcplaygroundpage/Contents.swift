//: [Previous](@previous)

import Foundation
import Combine

// Operator
// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()
let subscription = numPublisher
    .map{ $0 * 2 }
    .sink { value in
        print("Transformed value >> \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter{ $0.contains("a") }
    .sink { value in
        print("Filtered String >> \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("def")
stringPublisher.send("choi")
stringPublisher.send("kwang")
stringPublisher.send("woo")
subscription2.cancel()
//: [Next](@next)
