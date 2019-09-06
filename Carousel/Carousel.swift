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

    let source: [Card] = [Card(),Card(),Card()]
    let nibPanel = UINib(nibName: "Panel", bundle: nil)
    
    
    
    var referenceSize : CGSize? = nil
    let referenceWidth: CGFloat = abs(( 287 / 375 ))
    var directionReference = CGFloat()

    let layout = UPCarouselFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reloadData()
        
        
        // MAIN CONFIGURATIONS
        
//        layout.itemSize = CGSize(width: 384, height: 180)
        self.collectionViewLayout = layout
        
        
        self.register(nibPanel, forCellWithReuseIdentifier: "Panel")
        self.delegate = self
        self.dataSource = self
        
        
        
        layout.itemSize = CGSize(width: 287,height: 180)
        // INSERTCONFIGURATION


            
        NotificationCenter.default.addObserver(self, selector: #selector(rotationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
        

    }
    
    fileprivate var currentPage: Int = 0 {
        didSet {
 
        }
    }
    
    @objc fileprivate func rotationDidChange() {
        guard !orientation.isFlat else { return }
        let layout = self.collectionViewLayout as! UPCarouselFlowLayout
        let direction: UICollectionView.ScrollDirection = orientation.isPortrait ? .horizontal : .vertical
        layout.scrollDirection = direction
        if currentPage > 0 {
            let indexPath = IndexPath(item: currentPage, section: 0)
            let scrollPosition: UICollectionView.ScrollPosition = orientation.isPortrait ? .centeredHorizontally : .centeredVertically
            self.scrollToItem(at: indexPath, at: scrollPosition, animated: false)
        }
    }
    
    fileprivate var pageSize: CGSize {
        let layout = self.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    fileprivate func setupLayout() {
        let layout = self.collectionViewLayout as! UPCarouselFlowLayout
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }

    
//    override var contentOffset: CGPoint {
//
//        didSet {
//
//                var visibleRect = CGRect()
//
//                visibleRect.origin = self.contentOffset
//                visibleRect.size = self.bounds.size
//
//                let visiblePoint = CGPoint(x: visibleRect.minX + 100, y: visibleRect.midY )
//                guard let CurrentIndexPath = self.indexPathForItem(at: visiblePoint) else { return }
//
//
//
//                let currentRow = CurrentIndexPath.row
//                let nextRow = currentRow + 1
//                let previousRow = currentRow - 1
//
//
//                guard let currentCell = cellForItem(at: CurrentIndexPath) else { return}
//                guard let nextCell = cellForItem(at: IndexPath(row: nextRow, section: 0)) else { return}
////                guard let previousCell = cellForItem(at: IndexPath(row: previousRow, section: 0)) else {return}
//
//
//
//                guard let standardSize = referenceSize else {return}
//
//
//                print(self.contentOffset.x)
//                print(self.directionReference)
//
//
//
//
//                if self.contentOffset.x > directionReference {
//
//
//                    if currentCell.frame.size.height < standardSize.height {
//
//                    if nextCell.frame.size.height < standardSize.height {
//
//                        currentCell.transform.a -= 0.005
//                        currentCell.transform.d -= 0.005
//
//                        nextCell.transform.a += 0.005
//                        nextCell.transform.d += 0.005
//
//                        currentCell.frame.origin.x -= 0.5
//                        nextCell.frame.origin.x -= 0.9
//
//
//                    }
//                }
//
    
                    
                
                
//
//                } else if self.contentOffset.x < directionReference  {
//
//
//
//
//
//                }
//
//
//
//
//                directionReference = self.contentOffset.x
//
//
//
//
//
//        }
//
//
//
//    }
    
    

    

    
}




extension Carousel: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        var panel = self.dequeueReusableCell(withReuseIdentifier: "Panel", for: indexPath)

        return panel

    }

    
}
//
//
//
//
//extension Carousel : UICollectionViewDelegateFlowLayout  {
//
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionViewWidth = collectionView.frame.width
//        let collectionViewHeight = collectionView.frame.height
//        let standardWidth = collectionViewWidth * referenceWidth
//
//        referenceSize = CGSize(width: standardWidth, height: collectionViewHeight)
//
//        return CGSize(width: standardWidth - 60, height: collectionViewHeight - 60 )
//
//
//    }
//////
//////
////////
////////    func findNearest() {
////////
////////        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
////////        var closestCellIndex = -1
////////        var closestDistance: Float = .greatestFiniteMagnitude
////////        for i in 0..<self.visibleCells.count {
////////            let cell = self.visibleCells[i]
////////            let cellWidth = cell.bounds.size.width
////////            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
////////
////////            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
////////            if distance < closestDistance {
////////                closestDistance = distance
////////                closestCellIndex = self.indexPath(for: cell)!.row
////////            }
////////        }
////////        if closestCellIndex != -1 {
////////            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
////////
////////        }
////////    }
//////
//////
//////
//////
////}
//}
