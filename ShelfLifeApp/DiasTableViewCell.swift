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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // opacity of the shadow
 
        // coner
       myView.layer.cornerRadius = 25.0
        myView.clipsToBounds = true

    }
   // @IBOutlet weak var diasOutlet: UILabel!
    
    
    
    
}
