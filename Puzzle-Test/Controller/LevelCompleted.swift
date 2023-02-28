//
//  LevelCompleted.swift
//  Puzzle-Test
//
//  Created by Vitalii Navrotskyi on 28.02.2023.
//

import UIKit

class LevelCompleted: UIViewController {
    
    var time: String = ""
    
    @IBOutlet weak var timeCompleted: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeCompleted.text = "Time: \(time)"
    }
}
