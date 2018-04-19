//
//  Arquiteto.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

class Arquiteto: ProfissionalProtocol {
    var nome: String
    var fone: String
    var endereco: String
    var salarioPorHora: Double = 200
    var horasPorDia: Int = 0
    var salarioDiario: Double {
        return Double(horasPorDia) * salarioPorHora
    }
    var cra: String
    var description: String {
        return "Arquiteto: \(nome) - \(fone) - \(endereco) - \(cra) - Salario por Hora: \(salarioPorHora) - Salario Diario \(salarioDiario)"
    }
    init(nome: String, fone: String, endereco: String, cra: String) {
        self.nome = nome
        self.fone = fone
        self.endereco = endereco
        self.cra = cra
    }
    
    func incrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        self.horasPorDia = 8
    }
    
    func decrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        self.horasPorDia = 0
    }
}
