import Foundation
import Combine

// PassthroughSubject
// output type과 error type을 지정해주어야함
// String : output Type / error type : 일어날일이 없다 : Never
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}

relay.send("Hello")
relay.send("World!")

// CurrentValueSubject
// 초기값을 넣어주어야함
let variable = CurrentValueSubject<String, Never>("")
variable.send("Initial Text")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}

variable.send("More Text")
variable.value // More Text


let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay)
// 알듯말듯 하면서 헷갈리네 허허
publisher.subscribe(variable)
