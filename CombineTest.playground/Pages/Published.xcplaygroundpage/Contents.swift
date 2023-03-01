//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Choi"
    var age: Int = 29
}

final class Label {
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()

print("text : \(label.text)") // -> ""
vm.$name.assign(to: \.text, on: label)
print("text : \(label.text)") // -> "Choi"

vm.name = "KwangWoo"
print("text : \(label.text)") // -> "KwangWoo"
//: [Next](@next)
