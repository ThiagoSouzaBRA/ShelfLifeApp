//
//  ValidadesViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit
import CoreData

class ValidadesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var table: UITableView!
    

    
    var produtosArray:[Produto] = []
    
    
    var diasSemana = ["Hoje", "Amanhã", "3 Dias", "7 Dias"]
    //var people: [NSManagedObject] = []
    //Nome,Data,Posicao Original
    var hoje:[(String,Date,Int)] = []
    var amanha:[(String,Date,Int)]  = []
    var dia3:[(String,Date,Int)] = []
    var dia7:[(String,Date,Int)] = []
    
    var ordemHoje:[(String,Date,Int)] = []
    var ordemAmanha:[(String,Date,Int)] = []
    var ordemDia3:[(String,Date,Int)] = []
    var ordemDia7:[(String,Date,Int)] = []
    
    
    override func viewDidLoad() {
        
        title = "Validades"
        super.viewDidLoad()
        table.separatorColor = UIColor.white
        table.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

        self.fetchData()
        loadPackage()
        sortPackages()
        table.reloadData()

        
    }
    

    
    func loadPackage(){
        hoje = []
        amanha = []
        dia3 = []
        dia7 = []
        if produtosArray.count > 0 {
            
                for i in 0...(produtosArray.count-1){
                    let dado = produtosArray[i]
                    
                    let formato = DateFormatter()
                    formato.dateFormat = "MM"
                    let mesmoMes = formato.string(from: dado.dataValidade!) == formato.string(from: Date())
                    formato.dateFormat = "dd"
                    let Dias = Int(formato.string(from: dado.dataValidade!))! - Int(formato.string(from: Date()))!
                
                    if(mesmoMes == true){
                        if(Dias == 0){
                            hoje.append((dado.nome!,dado.dataValidade!,i))
                        }
                        else
                        if(Dias == 1){
                            amanha.append((dado.nome!,dado.dataValidade!,i))
                        }
                        else
                        if((Dias) > 1 && (Dias) <= 3){
                            dia3.append((dado.nome!,dado.dataValidade!,i))
                        }
                        else
                        if((Dias) > 3 && (Dias) <= 7){
                            dia7.append((dado.nome!,dado.dataValidade!,i))
                        }

                    }
                }
        }
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
//            if(hoje.count == 0){return 1}
            return hoje.count
            
        }
        else
        if(section == 1){
//            if(amanha.count == 0){return 1}
            return amanha.count
        }
        else
        if(section == 2){
//            if(dia3.count == 0){return 1}
            return dia3.count
        }
        else
        if(section == 3){
//            if(dia7.count == 0){return 1}
            return dia7.count
        }
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return diasSemana[section]
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 28)!
        header.textLabel?.textColor = UIColor.black
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.2392160296, green: 0.3485338986, blue: 0.40531528, alpha: 0.7445954623)
            headerView.textLabel?.textColor = .white
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! DiasTableViewCell;
        //let oneRecord = produtosArray[indexPath.row]
        //let data = dataFormatter.string(from: oneRecord.dataValidade!)
        //cell.cellLabel!.text = oneRecord.nome! + " " + data
        //cell.cellLabel.text = produtos[indexPath.section][indexPath.row]
    
        //let gregorian = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
        //let components = gregorian?.components(NSCalendar.Unit.day, from: oneRecord.dataValidade!, to: Date(), options: .matchFirst)
        
        //let interseccaoDias = Int?((components?.day)!)
        
        //print(interseccaoDias)
       
        
        if(indexPath.section == 0){
            if(ordemHoje.count == 0){
                cell.cellLabel.text = "Não há produtos cadastrados."
                cell.dataLabel.text = ""
            }
            else{
            let data = dataFormatter.string(from: ordemHoje[indexPath.row].1)
            cell.cellLabel.text = ordemHoje[indexPath.row].0 
            cell.dataLabel.text = data
            cell.cellLabel.textColor = UIColor.red
            }
        }
        else
        if(indexPath.section == 1){
            if(ordemAmanha.count == 0){
                cell.cellLabel.text = "Não há produtos cadastrados."
                cell.dataLabel.text = ""
            }
            else{
            let data = dataFormatter.string(from:ordemAmanha[indexPath.row].1)
            cell.cellLabel.text = ordemAmanha[indexPath.row].0
            cell.dataLabel.text = data
                
            }
                
        }
        else
        if(indexPath.section == 2){
            if(ordemDia3.count == 0){
                cell.cellLabel.text = "Não há produtos cadastrados."
                cell.dataLabel.text = ""
            }
            else{
            let data = dataFormatter.string(from: ordemDia3[indexPath.row].1)
            cell.cellLabel.text = ordemDia3[indexPath.row].0
            cell.dataLabel.text = data
            }
        }
        else
        if(indexPath.section == 3){
            if(ordemDia7.count == 0){
                cell.cellLabel.text = "Não há produtos cadastrados."
                cell.dataLabel.text = ""
            }
            else{
            let data = dataFormatter.string(from: ordemDia7[indexPath.row].1)
            cell.cellLabel.text = ordemDia7[indexPath.row].0
            cell.dataLabel.text = data
            }
        }
        
    
        return(cell)
        
    }
//      DELETE
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
       
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        if editingStyle == .delete {
            var tuplaMaluca:(String,Date,Int)
            switch indexPath.section{
            case 0:
                tuplaMaluca = ordemHoje[indexPath.row]
                break
            case 1:
                tuplaMaluca = ordemAmanha[indexPath.row]
                break
            case 2:
                tuplaMaluca = ordemDia3[indexPath.row]
                break
            default:
                tuplaMaluca = ordemDia7[indexPath.row]
                break
            }
            let indexToRemove = produtosArray.firstIndex { (prod) -> Bool in
                prod.nome == tuplaMaluca.0 && prod.dataValidade == tuplaMaluca.1
            }
            context.delete(produtosArray[indexToRemove!])
            produtosArray.remove(at: indexToRemove!)
            loadPackage()
            sortPackages()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do {
                try context.save()
                self.fetchData()
                self.table.reloadData()
                
            } catch let error as NSError {
                print("Error While Deleting Note: \(error.userInfo)")
            }
        }
    }
  
//fetch
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
