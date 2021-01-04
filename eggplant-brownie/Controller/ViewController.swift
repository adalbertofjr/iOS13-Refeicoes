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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItemDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Muçarela", calorias: 20.0),
                         Item(nome: "Manjericão", calorias: 20.0),
                         Item(nome: "Molho de tomate", calorias: 20.0),
                         Item(nome: "Calabresa", calorias: 20.0)]
    var itensSelecionados:[Item] = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField:UITextField?
    @IBOutlet var felicidadeTextField:UITextField?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionatItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionatItem
                
        do{
            guard let caminho = recuperaDiretorio() else { return }
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return }
            itens = itensSalvos
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItemViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        itens.append(item)
        
        if let tableView = itensTableView{
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(mensagem:  "Não foi possível atualizar a tabela")
        }
        
        guard let caminho = recuperaDiretorio() else { return }
                
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            try dados.write(to: caminho)
            
//            Dica: - No modo debug para visualizar o caminho :
//            (lldb) po NSHomeDirectory()  "/Users/adalbertofernandesjunior/Library/Developer/CoreSimulator/Devices/B8328B9A-DEEF-419A-926C-19BA7C32EA00/data/Containers/Data/Application/E0D47388-296E-4FE2-BA9A-F58D92177332"
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaDiretorio() -> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let itemSelecionado = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: itemSelecionado)                
            }
        }
    }
    
    func recuperaRefeicaoDoFormulario() -> Refeicao?{
        guard let nome = nomeTextField?.text else {
            return nil
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text,
              let felicidade = Int(felicidadeRefeicao) else {
            return nil
        }
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any){
        if let refeicao = recuperaRefeicaoDoFormulario(){
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true)
        }else{
            Alerta(controller: self).exibe(mensagem: "Erro ao recuperar dados do formulário")
        }
    }
}

