//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField:UITextField?
    @IBOutlet var felicidadeTextField:UITextField?
    
    var tableViewController: RefeicaoTableViewController?
    
    @IBAction func adicionar(_ sender: Any){
//        if let nomeRefeicao = nomeTextField?.text,
//           let felicidadeRefeicao = felicidadeTextField?.text{
//            let nome = nomeRefeicao
//            if let felicidade = Int(felicidadeRefeicao){
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//            }else{
//                print("Erro ao adicionar refeição")
//            }
//        }
        
        guard let nome = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade)
        if let tableView = tableViewController {
            tableView.add(refeicao)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
}

