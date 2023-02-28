//
//  FirstLevelVC.swift
//  Puzzle-Test
//
//  Created by Vitalii Navrotskyi on 27.02.2023.
//

import UIKit

class FirstLevelVC: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var collectiomView: UICollectionView!
    
    var index: Int = 0
    var gameTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PuzzlesForFirstLvl.puzzles.shuffle()
        
        customCollectionView()
        
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
    
    func customCollectionView() {
        collectiomView.layer.borderWidth = 5.0
        collectiomView.layer.cornerRadius = 25
        collectiomView.layer.borderColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1).cgColor
        collectiomView.clipsToBounds = true
        
        collectiomView.dragInteractionEnabled = true
    }
}

extension FirstLevelVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PuzzlesForFirstLvl.puzzles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        var b = UIBackgroundConfiguration.listPlainCell()
        b.customView = UIImageView(image: UIImage(named: PuzzlesForFirstLvl.puzzles[indexPath.row] ))
        cell.backgroundConfiguration = b

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
        let item = PuzzlesForFirstLvl.puzzles.remove(at: sourceIndexPath.row)
        PuzzlesForFirstLvl.puzzles.insert(item, at: destinationIndexPath.row)
    }
}



