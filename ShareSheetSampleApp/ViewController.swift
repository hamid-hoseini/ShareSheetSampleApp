//
//  ViewController.swift
//  ShareSheetSampleApp
//
//  Created by Hamid Hoseini on 10/13/20.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("Tap Me", for: .normal)
        button.setTitleColor(.white, for: .normal)
       return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func presentShareSheet(_ sender: UIButton) {
        guard let image = UIImage(systemName: "bell"),
              let url = URL(string: "https://www.google.com") else {
            return
        }
        
        let shareSheetVC = UIActivityViewController(
            activityItems: [
                image,
                url
            ], applicationActivities: nil)
        
        
        // These two lines suport iPad
        shareSheetVC.popoverPresentationController?.sourceView = sender
        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
        
        present(shareSheetVC, animated: true)
    }

}

