//
//  AdicionarItemViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 02/01/21.
//

import UIKit

protocol AdicionarItemDelegate {
    func add(_ item: Item)
}

class AdicionarItemViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    var delegate: AdicionarItemDelegate?
    
    init(delegate: AdicionarItemDelegate){
        super.init(nibName: "AdicionarItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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
            delegate?.add(item)            
            navigationController?.popViewController(animated: true)
        }
        
       
    }
    
}
