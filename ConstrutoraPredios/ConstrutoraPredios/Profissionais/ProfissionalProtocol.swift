//
//  ProfissionalProtocol.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

protocol ProfissionalProtocol: PessoaProtocol, CustomStringConvertible{
    var salarioPorHora: Double { get set }
    var horasPorDia: Int { get }
    var salarioDiario: Double { get }
    
    func incrementarCargaHoraria(horasPorDia: HorasPorDiaEnum)
    func decrementarCargaHoraria(horasPorDia: HorasPorDiaEnum)
    
}
