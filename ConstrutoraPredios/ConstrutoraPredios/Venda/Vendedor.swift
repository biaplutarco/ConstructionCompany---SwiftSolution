//
//  Vendedor.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

class Vendedor: PessoaProtocol, Equatable, CustomStringConvertible {
    var nome: String
    var fone: String
    var endereco: String
    var capital: Double = 0
    var description: String{
        return "Vendedor: \(nome) - \(fone) - \(endereco)"
    }
    
    
    init(nome: String, fone: String, endereco: String) {
        self.nome = nome
        self.fone = fone
        self.endereco = endereco
    }
    
    static func ==(lhs: Vendedor, rhs: Vendedor) -> Bool {
        return
            lhs.nome == rhs.nome &&
            lhs.fone == rhs.fone &&
            lhs.endereco == rhs.endereco &&
            lhs.capital == rhs.capital
    }
}
