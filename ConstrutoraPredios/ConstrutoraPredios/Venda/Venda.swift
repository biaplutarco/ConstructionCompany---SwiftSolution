//
//  Venda.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

struct Venda {
    var vendedor: Vendedor?
    var predio: Predio
    var apartamento: Apartamento?
    
    init(vendedor: Vendedor, predio: Predio, apartamento: Apartamento, cliente: Cliente) {
        if predio.vendedores.contains(vendedor) {
            self.vendedor = vendedor
        }
        if predio.apartamentos.contains(apartamento) {
            self.apartamento = apartamento
            apartamento.apartamentoVendido = true
        }
        self.predio = predio
    }
}
