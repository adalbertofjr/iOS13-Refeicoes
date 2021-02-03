//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 02/02/21.
//

import Foundation

class RefeicaoDAO {
    
    func save(_ refeicoes: [Refeicao]){
        guard let caminho = recuperaDiretorio() else { return }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes,
                                                         requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Refeicao]{
        guard let caminho = recuperaDiretorio() else { return [] }
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeiçõesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else {
                return []
            }
            return refeiçõesSalvas
        } catch {
            print(error.localizedDescription)
            return []            
        }
    }
    
    func recuperaDiretorio() -> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        return caminho
    }
}
