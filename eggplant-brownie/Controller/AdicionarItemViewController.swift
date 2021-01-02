//
//  AdicionarItemViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 02/01/21.
//

import UIKit

class AdicionarItemViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField.text,
              let calorias = caloriasTextField.text else {
            return
        }
        
        if let numDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numDeCalorias)
            print("item: \(item.nome) calorias: \(item.calorias)")
            
            navigationController?.popViewController(animated: true)
        }
        
       
    }
    
}
