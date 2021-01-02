//
//  AdicionarItemViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 02/01/21.
//

import UIKit

class AdicionarItemViewController: UIViewController {

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions
    
    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
