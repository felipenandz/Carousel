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
    
    
    
    
    
    let referenceSize = CGSize(width: 287, height: 180)
    let referenceWidth: CGFloat = abs(( 287 / 375 ))
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        // MAIN CONFIGURATIONS
        
        
        self.register(nibPanel, forCellWithReuseIdentifier: "Panel")
        self.delegate = self
        self.dataSource = self
        
        
        // INSERTCONFIGURATION

        self.contentInset.left  = 50
        self.contentInset.right = 50
        
        
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

        return CGSize(width: standardWidth - 60, height: collectionViewHeight - 60)
        
        
    }
    
    
    
    
    
}
