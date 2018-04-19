//
//  Empregado.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

class Empregado: ProfissionalProtocol, Equatable{
    static func ==(lhs: Empregado, rhs: Empregado) -> Bool {
        return lhs.categoria == rhs.categoria && lhs.nome == rhs.nome && lhs.fone == rhs.fone && lhs.endereco == rhs.endereco && lhs.salarioPorHora == rhs.salarioPorHora && lhs.horasPorDia == rhs.horasPorDia 
    }
    
    var salarioPorHora: Double
    var nome: String
    var fone: String
    var endereco: String
    var categoria: EmpregadoEnum
    var horasPorDia: Int = 0
    var salarioDiario: Double {
        return Double(horasPorDia) * salarioPorHora
    }
    
    var description: String {
        return "\(categoria): \(nome) - \(fone) - \(endereco) - Salario por Hora: \(salarioPorHora) - Salario Diario \(salarioDiario) - Carga Horaria \(horasPorDia)"
    }
    init(nome: String, fone: String, endereco: String, categoria: EmpregadoEnum) {
        self.nome = nome
        self.fone = fone
        self.endereco = endereco
        self.categoria = categoria
        self.salarioPorHora = categoria.rawValue
    }
    
    func incrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        if self.horasPorDia + horasPorDia.rawValue < 8{
            self.horasPorDia += horasPorDia.rawValue
        }
    }
    
    func decrementarCargaHoraria(horasPorDia: HorasPorDiaEnum) {
        if self.horasPorDia - horasPorDia.rawValue > 0 {
            self.horasPorDia -= horasPorDia.rawValue
        }else{
            self.horasPorDia = 0
        } 
    }
}
