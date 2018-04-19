//
//  Engenheiro.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

class Engenheiro: ProfissionalProtocol {
    var salarioPorHora: Double = 350
    var horasPorDia: Int = 0
    var salarioDiario: Double {
        return Double(horasPorDia) * salarioPorHora
    }
    var nome: String
    var fone: String
    var endereco: String
    var crea: String
    
    var description: String {
        return "Engenehiro: \(nome) - \(fone) - \(endereco) - \(crea) - Salario por Hora: \(salarioPorHora) - Salario Diario \(salarioDiario)"
    }
    init(nome: String, fone: String, endereco: String, crea: String) {
        self.nome = nome
        self.fone = fone
        self.endereco = endereco
        self.crea = crea
    }
    func incrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        self.horasPorDia = 8
    }
    
    func decrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        self.horasPorDia = 0
    }
}
