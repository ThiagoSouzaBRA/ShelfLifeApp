//
//  ListaDeProdutosViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 24/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit
import CoreData

class ListaDeProdutosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var produtosArray2:[Produto] = []
    
    var identificadorCat = 0
    
    var titulo:String = "Tela"
    
    var lista:[(String,Date,Date)] = []
    var ordemLista:[(String,Date,Date)] = []
    
    @IBOutlet weak var table2: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = titulo
        //self.navigationItem.title = "Meu"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.fetchData()
        table2.reloadData()
        loadPackage()
        sortPackages()
        
    }
    
    func loadPackage(){

        if produtosArray2.count > 0 {
            
                for i in 0...(produtosArray2.count-1){
                    
                    //Todos
                    if(identificadorCat == 0){
                        lista.append((produtosArray2[i].nome!,produtosArray2[i].dataValidade!,produtosArray2[i].dataRegistro!))
                    }
                    else // Adicionados Recentemente
                    if(identificadorCat == 1){
                        lista.append((produtosArray2[i].nome!,produtosArray2[i].dataValidade!,produtosArray2[i].dataRegistro!))
                    }
                    else // Geladeira
                    if(identificadorCat == 2 && produtosArray2[i].categoria == 2){
                        lista.append((produtosArray2[i].nome!,produtosArray2[i].dataValidade!,produtosArray2[i].dataRegistro!))
                    }
                    else // Despensa
                    if(identificadorCat == 3 && produtosArray2[i].categoria == 3){
                        lista.append((produtosArray2[i].nome!,produtosArray2[i].dataValidade!,produtosArray2[i].dataRegistro!))
                    }
                    else // Itens Vencidos
                    if(identificadorCat == 4){
                        
                    }
                    else // Outros
                    if(identificadorCat == 5 && produtosArray2[i].categoria == 5){
                        lista.append((produtosArray2[i].nome!,produtosArray2[i].dataValidade!,produtosArray2[i].dataRegistro!))
                    }
                    
                    
                }
        }
    }
    
    //Função Utilizada para ordenar a lista
    func sortPackages(){
        
        //Adicionados Recentemente
        if(identificadorCat == 1){
             ordemLista = lista.sorted { (e1, e2) -> Bool in
                       e1.2 < e2.2
                   }
        }
        else //Itens Vencidos
        if(identificadorCat == 4){
            
             ordemLista = lista.sorted { (e1, e2) -> Bool in
                       e1.1 < e2.1
                   }
        }
        else{
            ordemLista = lista.sorted { (e1, e2) -> Bool in
                       e1.1 < e2.1
                   }
        }
        
       
        
    }
    
    //PREPARE FOR SEGUE
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Because view is going to have multiple segue's going to different views, you have to identify wich segue's you are working with
        if segue.identifier == "TodosItens"{
            let dest = segue.destination as! 
            //dest.video = sender as? Video
            
        }
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(lista.count == 0){
            return 1
        }

        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        
        let cell2 = table2.dequeueReusableCell(withIdentifier: "cell2") as! ListaProdutosTableViewCell;
        
        if(lista.count == 0){
            cell2.produtoLabel.text = "Não há produtos."
            cell2.dataOutlet.text = ""
            return(cell2)
        }
        
        let record = ordemLista[indexPath.row]
        let data = dataFormatter.string(from: record.1)
        cell2.produtoLabel.text = record.0
        cell2.dataOutlet.text = data
        
        return (cell2)
        
        
    }
    


    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            produtosArray2 = try context.fetch(Produto.fetchRequest())
            
        }
        catch{
            print(error)
        }
    }
    
    
}
