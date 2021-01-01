//
//  RefeicaoTableViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class RefeicaoTableViewController: UITableViewController {
    let refeicoes = [Refeicao(nome: "pizza", felicidade: 5),
                     Refeicao(nome: "comida japoneza", felicidade: 2),
                     Refeicao(nome: "hamburguer", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]        
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
}
