//
//  DatePickerViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit
import CoreData


class DatePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    var pickOption = ["Geladeira", "Despensa", "Outros"]
    
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var alertNome: UILabel!
    
    @IBOutlet weak var alertData: UILabel!
    
    @IBOutlet weak var alertCategoria: UILabel!
    
    @IBOutlet weak var alertWhitelist: UILabel!
    
    //customizacao validade input
    @IBOutlet weak var inputNome: UITextField!{
        didSet {
            inputNome.tintColor = UIColor.black
            inputNome.setIcon(UIImage(named: "validadeInput")!)
        }
        
    }
//customizacao nome input
    @IBOutlet weak var nomeInput: UITextField!{
        didSet {
            nomeInput.tintColor = UIColor.lightGray
            nomeInput.setIcon(UIImage(named: "leiteInput")!)
        }
    }
//customizacao categoria input
    @IBOutlet weak var categoriaOutlet: UITextField!{
        didSet {
            categoriaOutlet.tintColor = UIColor.lightGray
            categoriaOutlet.setIcon(UIImage(named: "categoriaInput")!)
            
        }
        
    }
    
    @IBOutlet weak var inputDate: UITextField!
    
    private var datePicker: UIDatePicker?
    
    override func viewWillAppear(_ animated: Bool) {
           
        alertNome.isHidden = true
        alertCategoria.isHidden = true
        alertData.isHidden = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        inputDate.text = dateFormatter.string(from: Date())
          
       }
    
//date picker
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.minimumDate = Date()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputDate.inputView = datePicker
        
        //picker categoria
        var pickerView = UIPickerView()
        
        pickerView.delegate = self as? UIPickerViewDelegate
        
        categoriaOutlet.inputView = pickerView

    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        inputDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
//BOTAO SALVAR
    @IBAction func saveButton(_ sender: Any) {
        
        alertWhitelist.isHidden = true
        alertNome.isHidden = true
        alertCategoria.isHidden = true
        alertData.isHidden = true
        
        //pegando os valores dos textfields
        let isNullNome = (self.nomeInput!.text == "")
        let isNullCategoria = (self.categoriaOutlet.text! == "")
        let isNullValidade = (self.inputDate.text! == "")
       
        if(isNullNome == true && isNullCategoria == true && isNullValidade == true){
            alertNome.isHidden = false
            alertCategoria.isHidden = false
            alertData.isHidden = false
        }
        else
        if(isNullNome == true){
            alertNome.isHidden = false
            alertCategoria.isHidden = true
            alertData.isHidden = true
        }
        else
        if(isNullCategoria == true){
            alertCategoria.isHidden = false
            alertNome.isHidden = true
            alertData.isHidden = true
        }else
        if(isNullValidade){
            alertData.isHidden = false
            alertCategoria.isHidden = true
            alertNome.isHidden = true
        }
        else{
            //
            var whitelist = "bobo|".lowercased()
            var arrayVerify = whitelist.split(separator: "|")
            
            var permissionWhitelist = true
            
            for i in 0...arrayVerify.count-1{
                if(self.nomeInput!.text!.lowercased() == arrayVerify[i]){
                    permissionWhitelist = false
                }
            }
            if(permissionWhitelist == true){
        
                let novoProduto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
                
                novoProduto.setValue(self.nomeInput!.text, forKey: "nome")
                novoProduto.setValue(self.datePicker?.date, forKey: "dataValidade")
                if(self.categoriaOutlet!.text! == "Geladeira"){
                    novoProduto.setValue(2, forKey: "categoria")
                }
                else
                if(self.categoriaOutlet!.text! == "Despensa"){
                    novoProduto.setValue(3, forKey: "categoria")
                }
                else
                if(self.categoriaOutlet!.text! == "Outros"){
                    novoProduto.setValue(4, forKey: "categoria")
                }
                
                
               novoProduto.setValue(Date(), forKey: "dataRegistro")
                
                do{
                    try context.save()
                    self.nomeInput!.text = ""
                    self.categoriaOutlet!.text = ""

                    print("Produto Cadastrado com sucesso.")
                    alertCategoria.isHidden = true
                    alertNome.isHidden = true
                    
                }catch{
                    print(error)
                }
            }
            else{
                alertWhitelist.isHidden = false
            }
        }
        
    }
//picker categoria
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoriaOutlet.text = pickOption[row]
    }
    
    



}
//colocando uma pequena imagem no TextFiel da data
extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
            CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    



}
