//
//  FirstLevelVC.swift
//  Puzzle-Test
//
//  Created by Vitalii Navrotskyi on 27.02.2023.
//

import UIKit

//class ImageCollectionViewCell: UICollectionViewCell {
//
//    @IBOutlet weak var puzzleImage: UIImageView!
//
//    override func awakeFromNib() {
//        self.frame = puzzleImage.frame
//    }
//
//}

class FirstLevelVC: UIViewController {

    @IBOutlet weak var collectiomView: UICollectionView!
    
    
    var puzzle = Puzzle(title: "First", solvedImages: ["1", "2", "3", "4", "5", "6", "7", "8", "9.", "10", "11", "12", "13", "14", "15", "16"])
    
    private var colors: [UIColor] = [
        .yellow, .systemBlue, .systemCyan, .systemGray,
        .systemMint, .systemRed, .systemPink, .systemTeal,
        .yellow, .systemBlue, .systemCyan, .systemGray,
        .systemMint, .systemRed, .systemPink, .systemTeal
    ]
    
    var index: Int = 0
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectiomView.layer.borderWidth = 5.0
        collectiomView.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
        collectiomView.clipsToBounds = true
        
        collectiomView.dragInteractionEnabled = true

        
        let longPressedGesture = UILongPressGestureRecognizer(target: self,
                                                              action: #selector(handleLongPressedGesture))
        collectiomView.addGestureRecognizer(longPressedGesture)
    }
    
    @objc private func handleLongPressedGesture(_ gesture: UILongPressGestureRecognizer) {
        let gestureLocation = gesture.location(in: collectiomView)
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectiomView.indexPathForItem(at: gestureLocation) else {
                return
            }
            collectiomView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectiomView.updateInteractiveMovementTargetPosition(gestureLocation)
        case .ended:
            collectiomView.endInteractiveMovement()
        default:
            collectiomView.cancelInteractiveMovement()
        }
    }
    
    
    
    
}

extension FirstLevelVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    
}

extension FirstLevelVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.4,
               height: collectionView.frame.height / 4.4)
    }
}

extension FirstLevelVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = colors.remove(at: sourceIndexPath.row)
        colors.insert(item, at: destinationIndexPath.row)
    }
}



