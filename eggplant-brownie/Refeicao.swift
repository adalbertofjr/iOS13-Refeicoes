//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class Refeicao: NSObject {
    var nome: String
    var felicidade: String
    var itens : Array<Item> = []
    
    init(nome: String, felicidade: String) {
        self.nome = nome
        self.felicidade = felicidade
    }
    
    func totalDeCalorias() -> Double {
        var total = 0.0
        
        for item in itens{
            total += item.calorias
        }
        
        return total
    }

}
