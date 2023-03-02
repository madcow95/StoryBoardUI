//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// 같은 데이터가 들어왔을 때 중복 제거하는 그런거
// removeDuplicates
let words = "hey hey there! Mr Mr ?"
    .split(separator: " ")
    .publisher

words
    .removeDuplicates()         // 중복을 제거하고
    .sink {value in             // 값을 찍어보고
        print(value)
    }.store(in: &subscriptions) // subscriptions 변수 안에 집어 넣는다

// compactMap
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }   // map처럼 Optional Check 안해도 들어간다
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// ignoreOutput
let numbers = (1...100_000).publisher

numbers
    .ignoreOutput() // 모든 output을 무시한다.
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)

// prefix : 데이터가 여러개 들어와도 앞에서 몇 개만 받겠다
let tens = (1...10).publisher

tens
    .prefix(2)  // 1 ~ 10의 숫자중에 앞에서 두 개만 받을거다.
    .sink(receiveCompletion: { print("Completed with: \($0)")}, receiveValue: { print($0) })
    .store(in: &subscriptions)


//: [Next](@next)
