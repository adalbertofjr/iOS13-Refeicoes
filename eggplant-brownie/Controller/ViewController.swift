//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["Muçarela", "Manjericão", "Molho de tomate", "Calabresa"]
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField:UITextField?
    @IBOutlet var felicidadeTextField:UITextField?
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
        } else {
            celula.accessoryType = .none
        }
    }
    
    // MARK: - IBActions
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
        delegate?.add(refeicao)
                
        navigationController?.popViewController(animated: true)        
    }
}

