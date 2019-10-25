//
//  CategoriasViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 24/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit

class CategoriasViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TodosItens"{
            let controller = segue.destination as! ListaDeProdutosViewController
            
            controller.identificadorCat = 0
            controller.titulo = "Todos os Itens"
        }
        if segue.identifier == "AdicionadosRecentemente"{
                let controller = segue.destination as! ListaDeProdutosViewController
            
            controller.identificadorCat = 1
            controller.titulo = "Adicionados Recentemente"
                       
               }
        if segue.identifier == "Geladeira"{
                let controller = segue.destination as! ListaDeProdutosViewController
                
            controller.identificadorCat = 2
            controller.titulo = "Geladeira"
            
               }
        if segue.identifier == "Despensa"{
                let controller = segue.destination as! ListaDeProdutosViewController
            
            controller.identificadorCat = 3
            controller.titulo = "Despensa"
                       
               }
        if segue.identifier == "ItensVencidos"{
                let controller = segue.destination as! ListaDeProdutosViewController
                       
            controller.identificadorCat = 4
            controller.titulo = "Itens Vencidos"
               }
        if segue.identifier == "Outros"{
         let controller = segue.destination as! ListaDeProdutosViewController
            
            controller.identificadorCat = 5
            controller.titulo = "Outros"
                
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
