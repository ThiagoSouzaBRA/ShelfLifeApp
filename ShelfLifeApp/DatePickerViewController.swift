//
//  DatePickerViewController.swift
//  ShelfLifeApp
//
//  Created by Aluno Mack on 08/10/19.
//  Copyright © 2019 TheLastFoundation. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var inputNome: UITextField!{
        didSet {
            inputNome.tintColor = UIColor.black
            inputNome.setIcon(UIImage(named: "validadeInput")!)
        }
        
    }
    
    @IBOutlet weak var nomeInput: UITextField!{
        didSet {
            nomeInput.tintColor = UIColor.lightGray
            nomeInput.setIcon(UIImage(named: "leiteInput")!)
        }
    }
    
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
