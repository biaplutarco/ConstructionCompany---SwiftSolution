//
//  Empreiteira.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

struct Empreiteira {
    var profissionais: [ProfissionalProtocol] = []
    var vendedoresTotais: [Vendedor] = []
    var predios: [Predio] = []
    var vendas: [Venda] = []
    var clientes: [Cliente] = []
    
    init(){
        
    }
    
    mutating func comprarTerrenoPara(predio: Predio){
        predio.terreno = true
    }
    
    func precoVenda(venda: Venda) -> Double {
        let precoMetroQuadrado = (venda.apartamento?.metroQuadrado)! * venda.predio.precoMetroQuadrado
        let precoPorAndar = Double((venda.apartamento?.andar)! - 1) * venda.predio.taxaPorAndar + 100
        let precoVenda = precoMetroQuadrado * precoPorAndar/100
        return precoVenda
    }
    
    func pagamentoVendedorPor(venda: Venda) -> Double {
        return venda.predio.percentualParaVendedor/100 * precoVenda(venda: venda)
    }
    
    
}
