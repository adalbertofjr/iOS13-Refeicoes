//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Adalberto Fernandes Júnior on 01/01/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField:UITextField!
    @IBOutlet var felicidadeTextField:UITextField!
    
    @IBAction func adicionar(_ sender: Any){
        let nome = nomeTextField.text
        let felicidae = felicidadeTextField.text
        
        print("comi \(nome) e ficquei com felicidade: \(felicidae)")
    }
    


}

