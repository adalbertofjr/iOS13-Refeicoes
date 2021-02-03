//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 02/02/21.
//

import Foundation

class ItemDAO{
    
    func save(_ itens: [Item]){
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
    
    func recupera() -> [Item] {
        do{
            guard let caminho = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else { return []}
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory,
                                                       in: .userDomainMask).first else { return nil}
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
}
