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
    
    
//date picker
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
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
        
        //pegando os valores dos textfields
        
        let nome = self.nomeInput!.text
        let dataValidade = self.datePicker?.date
        let categoria = Int(self.categoriaOutlet.text!)
        
        let novoProduto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        novoProduto.setValue(self.nomeInput!.text, forKey: "nome")
        novoProduto.setValue(self.datePicker?.date, forKey: "dataValidade")
        novoProduto.setValue((Int(self.categoriaOutlet!.text!)), forKey: "categoria")
        
        do{
            try context.save()
            self.nomeInput!.text = ""
            self.categoriaOutlet!.text = ""

            print("OK")
            
        }catch{
            print(error)
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
