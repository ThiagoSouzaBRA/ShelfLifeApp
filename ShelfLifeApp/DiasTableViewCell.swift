//
//  DiasTableViewCell.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 09/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit

class DiasTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    
    let cornerRadius : CGFloat = 25.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // opacity of the shadow
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOpacity = 1
        myView.layer.shadowOffset = .zero
        myView.layer.shadowRadius = 10
        
        myView.layer.shadowPath = UIBezierPath(rect: myView.bounds).cgPath
        myView.layer.shouldRasterize = true
        
        // coner
       myView.layer.cornerRadius = 25.0
        myView.clipsToBounds = true
        
    }
   // @IBOutlet weak var diasOutlet: UILabel!
    
    
    
    
}
