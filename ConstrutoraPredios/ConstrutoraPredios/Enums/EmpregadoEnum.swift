//
//  EmpregadoEnum.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

enum EmpregadoEnum: Double, CustomStringConvertible {
    var description: String {
        if self == .pedreiro {
            return "Pedreiro"
        }
        else if self == .servente{
            return "Servente"
        }
        else{
            return "Mestre de Obras"
        }
    }
    
    case servente = 100, pedreiro = 150, mestreDeObra = 200
}
