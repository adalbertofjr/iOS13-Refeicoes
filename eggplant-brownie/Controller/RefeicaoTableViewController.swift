//
//  RefeicaoTableViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class RefeicaoTableViewController: UITableViewController,
                                   AdicionaRefeicaoDelegate {
    var refeicoes = [Refeicao(nome: "pizza", felicidade: 5),
                     Refeicao(nome: "comida japoneza", felicidade: 2),
                     Refeicao(nome: "hamburguer", felicidade: 5)]
    
    override func viewDidLoad() {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first else { return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeiçõesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {
                return
            }            
            refeicoes = refeiçõesSalvas
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]        
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
    
    func add(_  refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first else { return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes,
                                                         requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(self).exibe(refeicao, handler: {alert in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
}
