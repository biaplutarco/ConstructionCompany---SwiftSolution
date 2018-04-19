//
//  Apartamento.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

class Apartamento: Equatable, CustomStringConvertible {
    var metroQuadrado: Double
    var andar: Int
    var apartamentoVendido = false
    var description: String {
        return "Apartamento: Andar - \(andar) Metro Quadrado - \(metroQuadrado) \(apartamentoVendido ? "- Vendido" : "")"
    }
    
    
    init(metroQuadrado: Double, andar: Int) {
        self.metroQuadrado = metroQuadrado
        self.andar = andar
    }

    static func ==(lhs: Apartamento, rhs: Apartamento) -> Bool {
        return
            lhs.andar == rhs.andar &&
            lhs.metroQuadrado == rhs.metroQuadrado
    }
}
