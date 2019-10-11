//
//  ValidadesViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit

class ValidadesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    
    
    var diasSemana = ["Hoje", "Amanha", "3 dias", "1 semana", "1 mês"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.separatorColor = UIColor.white
        table.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (diasSemana.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! DiasTableViewCell;
        cell.cellLabel.text = diasSemana[indexPath.row]
        
        
        return(cell)
        
    } 
    

}
