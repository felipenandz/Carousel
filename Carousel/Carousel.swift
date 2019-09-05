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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
        self.register(nibPanel, forCellWithReuseIdentifier: "Panel")
        
        
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

