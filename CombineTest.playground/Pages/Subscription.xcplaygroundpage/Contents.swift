//: [Previous](@previous)

import Foundation
import Combine

// String : Output Type / Never : Error Type
let subject = PassthroughSubject<String, Never>()

// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Dubbuger]")
    .sink { value in
    print("Subscriber received value : \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")
// 이거 하면 이후에 receive가 비활성화
subject.send(completion: .finished)
// 위 코드와 비슷함
// subscription.cancel()
// 아래 코드 실행 안됨
subject.send("Hello?")
//: [Next](@next)
