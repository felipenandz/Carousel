//
//  Carousel.swift
//  Carousel
//
//  Created by Felipe Fernandes on 05/09/2019.
//  Copyright © 2019 Felipe Fernandes. All rights reserved.
//

import Foundation
import UIKit






class Carousel: UICollectionView {

    let source: [Card] = [Card(),Card(),Card(),Card(),Card(),Card(),Card()]
    let nibPanel = UINib(nibName: "Panel", bundle: nil)
    
    
    
    
    
    let referenceSize : CGSize? = nil
    let referenceWidth: CGFloat = abs(( 287 / 375 ))
    var directionReference = CGFloat()


    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        // MAIN CONFIGURATIONS
        
        
        self.register(nibPanel, forCellWithReuseIdentifier: "Panel")
        self.delegate = self
        self.dataSource = self
        
        
        // INSERTCONFIGURATION

        self.contentInset.left  = 50
        self.contentInset.right = 50
        
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
            
        }
        
    
        
    }
    
    
    
    
    override var contentOffset: CGPoint {
        
        didSet {
     
                var visibleRect = CGRect()
                
                visibleRect.origin = self.contentOffset
                visibleRect.size = self.bounds.size
                
                let visiblePoint = CGPoint(x: visibleRect.midX - 50, y: visibleRect.midY - 50)
                guard let CurrentIndexPath = self.indexPathForItem(at: visiblePoint) else { return }
   
            
                let currentRow = CurrentIndexPath.row
                let nextRow = currentRow + 1
                let previousRow = currentRow - 1
            
            
                guard let currentCell = cellForItem(at: CurrentIndexPath) else {return}
                guard let nextCell = cellForItem(at: IndexPath(row: nextRow, section: 0)) else {return}
                guard let previousCell = cellForItem(at: IndexPath(row: previousRow, section: 0)) else {return}
            
            
                 let newForward = self.contentOffset.x
            


                if newForward > directionReference {

                    
                
                

                } else if newForward < directionReference  {


             


                }

            
      
            
                directionReference = self.contentOffset.x
            
            
            

        }
        
        
        
    }
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        findNearest ()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//         findNearest()
    }
    
    

    
}




extension Carousel: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let panel = self.dequeueReusableCell(withReuseIdentifier: "Panel", for: indexPath)

        return panel

    }

    
}




extension Carousel : UICollectionViewDelegateFlowLayout  {
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let collectionViewHeight = collectionView.frame.height
        let standardWidth = collectionViewWidth * referenceWidth
        
        
//        referenceSize
//
        
        return CGSize(width: standardWidth - 60, height: collectionViewHeight - 60)


    }


//
//    func findNearest() {
//
//        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
//        var closestCellIndex = -1
//        var closestDistance: Float = .greatestFiniteMagnitude
//        for i in 0..<self.visibleCells.count {
//            let cell = self.visibleCells[i]
//            let cellWidth = cell.bounds.size.width
//            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
//
//            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
//            if distance < closestDistance {
//                closestDistance = distance
//                closestCellIndex = self.indexPath(for: cell)!.row
//            }
//        }
//        if closestCellIndex != -1 {
//            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
//
//        }
//    }
    

    
    
}
