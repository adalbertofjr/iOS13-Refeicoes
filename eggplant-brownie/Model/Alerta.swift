//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 03/01/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botaoOK = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(botaoOK)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
