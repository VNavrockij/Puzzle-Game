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
        for btn in buttons {
            btn.layer.cornerRadius = 25
            btn.layer.borderWidth = 5.0
            btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            btn.clipsToBounds = true
        }
    }

    
    
    @IBAction func pressedPlayBtn(_ sender: UIButton) {
        
    }
    
    
    
}

