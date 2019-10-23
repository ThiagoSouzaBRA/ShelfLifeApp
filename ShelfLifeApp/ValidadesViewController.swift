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
    
    var produtosArray:[Produto] = []
    
    
    var diasSemana = ["Hoje", "Amanha", "3 dias", "1 semana"]
    //var people: [NSManagedObject] = []
    var hoje:[(String,Date)] = []
    var amanha:[(String,Date)]  = []
    var dia3:[(String,Date)] = []
    var dia7:[(String,Date)] = []
    
    var ordemHoje:[(String,Date)] = []
    var ordemAmanha:[(String,Date)] = []
    var ordemDia3:[(String,Date)] = []
    var ordemDia7:[(String,Date)] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.separatorColor = UIColor.white
        table.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        self.fetchData()
        self.table.reloadData()
        
        loadPackage()
        sortPackages()

        // Do any additional setup after loading the view.
        
        
    }
    func loadPackage(){
        for i in 0...14{
            let dado = produtosArray[i]
            
            let gregorian = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
            let components = gregorian?.components(NSCalendar.Unit.day, from: Date(), to: dado.dataValidade!, options: .matchFirst)
            
           
            
            if(components?.day == 0){
                hoje.append((dado.nome!,dado.dataValidade!))
            }
            else
            if(components?.day == 1){
                    amanha.append((dado.nome!,dado.dataValidade!))
            }
            else
            if((components?.day)! > 1 && (components?.day)! <= 3){
                dia3.append((dado.nome!,dado.dataValidade!))
            }
            else
            if((components?.day)! > 3 && (components?.day)! <= 7){
                dia7.append((dado.nome!,dado.dataValidade!))
            }
            
        }
        print()
    }
    
    func sortPackages(){
        
        ordemHoje = hoje.sorted { (e1, e2) -> Bool in
            e1.1 < e2.1
        }
        
        ordemAmanha = amanha.sorted { (e1, e2) -> Bool in
            e1.1 < e2.1
        }
        
        ordemDia3 = dia3.sorted { (e1, e2) -> Bool in
            e1.1 < e2.1
        }
        ordemDia7 = dia7.sorted { (e1, e2) -> Bool in
            e1.1 < e2.1
        }
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
        
        if(section == 0){
            return hoje.count
        }
        else
        if(section == 1){
            return amanha.count
        }
        else
        if(section == 2){
            return dia3.count
        }
        else
        if(section == 3){
            return dia7.count
        }
        return 1
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
        header.textLabel?.font = UIFont(name: "Arial", size: 35)!
        header.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! DiasTableViewCell;
        let oneRecord = produtosArray[indexPath.row]
        //let data = dataFormatter.string(from: oneRecord.dataValidade!)
        //cell.cellLabel!.text = oneRecord.nome! + " " + data
        //cell.cellLabel.text = produtos[indexPath.section][indexPath.row]
    
        //let gregorian = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        //let components = gregorian?.components(NSCalendar.Unit.day, from: oneRecord.dataValidade!, to: Date(), options: .matchFirst)
        
        //let interseccaoDias = Int?((components?.day)!)
        
        //print(interseccaoDias)
       
        
        if(indexPath.section == 0){
            let data = dataFormatter.string(from: ordemHoje[0].1)
         cell.cellLabel.text = ordemHoje[indexPath.row].0 + " " + data
        }
        else
        if(indexPath.section == 1){
            cell.cellLabel.text = ordemAmanha[indexPath.row].0
        }
        else
        if(indexPath.section == 2){
            cell.cellLabel.text = ordemDia3[indexPath.row].0
        }
        else
        if(indexPath.section == 3){
            cell.cellLabel.text = ordemDia7[indexPath.row].0
        }
        
    
        return(cell)
        
    }
    
    
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            produtosArray = try context.fetch(Produto.fetchRequest())
            
        }
        catch{
            print(error)
        }
    }
    
    

}
