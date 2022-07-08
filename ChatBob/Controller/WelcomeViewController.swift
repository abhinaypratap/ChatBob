//
//  ViewController.swift
//  ChatBob
//
//  Created by Abhinay Pratap on 07/07/22.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
//        configureTitleLabel()
    }
    
//    func configureTitleLabel() {
//        titleLabel.text = ""
//        var index = 0.0
//        let titleText = "ChatBob"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * index, repeats: false)
//            { (timer) in
//                self.titleLabel.text?.append(letter)
//            }
//            index += 1
//        }
//    }
}

