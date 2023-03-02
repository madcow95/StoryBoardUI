//: [Previous](@previous)

import Foundation
import Combine

// 스케줄러를 사용하는 이유는 좀 더 효율적인 리소스를 사용하기 위해서
let arrPublisher = [1, 2, 3].publisher
let queue = DispatchQueue(label: "custome queue")
let subscription1 = arrPublisher
    .subscribe(on: queue)
    .map{ value -> Int in
        // main thread가 아닌 sub Thread에서 돌리고 싶다.
        print("transform : \(value), thread : \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
    print("Received Value >> [\(value)], thread >> [\(Thread.current)]")
}


//: [Next](@next)
