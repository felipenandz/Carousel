//
//  PanelCollectionViewCell.swift
//  Carousel
//
//  Created by Felipe Fernandes on 05/09/2019.
//  Copyright © 2019 Felipe Fernandes. All rights reserved.
//

import UIKit

class Panel: UICollectionViewCell {

    @IBOutlet var background: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
        background.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = true
//        self.background.alpha = 0.5
        self.layer.cornerRadius = 10
        
        
        
    }

    

}
