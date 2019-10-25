//
//  RoundButton.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 10/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton
{


    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
    func shadowButton() {
        
        var newColor = UIColor.black.cgColor
        
        layer.shadowColor = UIColor(cgColor: newColor) as! CGColor
    }
}

