//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by ChoiKwangWoo on 2023/02/25.
//

import UIKit
import SafariServices

class FrameworkDetailViewController: UIViewController {

    var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "Unknwon", urlString: "Unknwon", description: "Unknwon")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        imageView.image = UIImage(named: framework.imageName)
        titleLabel.text = framework.name
        descriptionLabel.text = framework.description
    }
    
    @IBAction func LearnMoreTapped(_ sender: Any) {
        
        guard let url = URL(string: framework.urlString) else {
            return
        }
        
        let safari = SFSafariViewController(url: url)
        present(safari, animated: true)
    }
}
