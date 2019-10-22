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
    
    
    var diasSemana = ["Hoje", "Amanha", "3 dias", "1 semana"]
    
    var produtos = [["ovo", "leite", "bacon"], ["lalal", "laka", "sei la"], ["pao", "palmito", "miojo"], ["ovo", "lalala", "nao sei"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.separatorColor = UIColor.white
        table.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        

        // Do any additional setup after loading the view.
    }
    
    //table  view
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return diasSemana.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return produtos[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return diasSemana[section]
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "Futura", size: 35)!
        header.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! DiasTableViewCell;
        cell.cellLabel.text = produtos[indexPath.section][indexPath.row]
        
        
        return(cell)
        
    } 
    

}
