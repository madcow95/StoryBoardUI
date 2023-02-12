//
//  WhetherViewController.swift
//  SympleWhether
//
//  Created by ChoiKwangWoo on 2023/02/12.
//

import UIKit

class WhetherViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var whetherImageView: UIImageView!
    @IBOutlet weak var mainTempLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    let cities: [String] = ["서울", "뉴욕", "바르셀로나", "파리", "런던"]
    let whethers: [String] = ["cloud.fill", "wind", "sun.max.fill", "hurricane", "cloud.bolt.rain.fill"]
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = cities.randomElement()
        whetherImageView.image = UIImage(systemName: whethers.randomElement()!)
        mainTempLabel.text = "\(String((12...25).randomElement()!))°"
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewDidLoad()
    }
}
