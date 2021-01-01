//
//  Item.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class Item: NSObject {
    var nome:String
    var calorias:Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
