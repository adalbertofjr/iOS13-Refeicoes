//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 03/01/21.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        alert.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        alert.addAction(botaoRemover)
        
        controller.present(alert, animated: true, completion: nil)
    }
}
