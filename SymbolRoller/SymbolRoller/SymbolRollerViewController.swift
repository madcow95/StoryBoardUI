//
//  SymbolRollerViewController.swift
//  SymbolRoller
//
//  Created by ChoiKwangWoo on 2023/02/12.
//  버튼을 누르면 이미지가 변경되는 간단한 앱
//

import UIKit

class SymbolRollerViewController: UIViewController {
    // 화면에 보이는 곳의 Event? 코드들

    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    func reload() {
        /*
         TO-DO
         - symbols에서 하나를 임의로 추출해서, 이미지와 텍스트를 설정한다.
         */
        
        let symbol = symbols.randomElement()!
        ImageView.image = UIImage(systemName: symbol)
        label.text = symbol.contains(".") ? String(symbol.split(separator: ".")[0]) : symbol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reload()
        button.tintColor = UIColor.systemGreen
    }
    
//     화면에 보이기 전까지 아래의 함수들이 호출됨
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }
}
