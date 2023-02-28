//
//  MainViewControllerViewController.swift
//  Puzzle-Test
//
//  Created by Vitalii Navrotskyi on 27.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customStyleBtn(mainButtons)
    }
    
    func customStyleBtn(_ buttons: [UIButton]) {
        
        var counter = 0
        for btn in buttons {
            
            let gradientLayer = CAGradientLayer()
            
            gradientLayer.colors = [MainGradient.topColor, MainGradient.bottomColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame.size = btn.frame.size

            btn.layer.insertSublayer(gradientLayer, at: 0)

            btn.layer.cornerRadius = 25
            btn.layer.borderWidth = 5.0
            btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor

            btn.titleLabel?.text = MainWordOnButtons.mainWordArr[counter].uppercased()

            btn.clipsToBounds = true
            counter += 1
        }
    }
    
    
    @IBAction func pressedPlayBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func pressedRulesBtn(_ sender: UIButton) {
        
    }
    
    
}

