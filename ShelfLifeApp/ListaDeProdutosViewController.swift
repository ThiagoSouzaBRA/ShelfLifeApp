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
    
    @IBOutlet weak var table2: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.fetchData()
        table2.reloadData()
        
        
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
        return produtosArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/yyyy"
        
        let cell2 = table2.dequeueReusableCell(withIdentifier: "cell2") as! ListaProdutosTableViewCell;
        
        let record = produtosArray2[indexPath.row]
        let data = dataFormatter.string(from: record.dataValidade!)
        cell2.produtoLabel.text = record.nome!
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
