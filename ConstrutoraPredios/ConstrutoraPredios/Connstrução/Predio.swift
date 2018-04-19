//coisas a fazer: sobrescrever sets dos empregados

import Foundation

class Predio : CustomStringConvertible{
    
    var nome : String
    var engenheiro: Engenheiro?
    var arquiteto: Arquiteto
    var empregados: [Empregado] = []
    var vendedores: [Vendedor] = []
    var apartamentos: [Apartamento] = []
    var fase: FaseConstrucaoEnum = .planejamento
    var precoMetroQuadrado: Double = 0
    var taxaPorAndar: Double = 0
    var terreno: Bool = false
    var predioConstruido: Bool = false
    var percentualParaVendedor: Double = 0
    var salarioDiario: [Double : ProfissionalProtocol] = [:]
    var description: String{
        return "Predio: \(nome) - \(arquiteto) - Fase: \(fase) \(terreno ? " - Terreno Comprado" : "")"
    }
    
    init(nome: String,arquiteto: Arquiteto) {
        self.nome = nome
        self.arquiteto = arquiteto
    }
    
    func addApartamentos(_ ap: Apartamento) {
        apartamentos.append(ap)
    }
    
    func mudarParaEmConstrucao(engenheiro: Engenheiro, mestreDeObra: Empregado) -> Bool{
        if terreno == true{
            self.fase = .emConstrucao
            self.engenheiro = engenheiro
            self.empregados.append(mestreDeObra)
            self.predioConstruido = true
            return true
        }
        return false
    }
    
    func mudarParaEmVenda(vendedoresResponsaveis: Vendedor, precoMetroQuadrado: Double, taxaPorAndar: Double, percentualParaVendedor: Double){
        if predioConstruido == true {
            self.fase = .emVenda
            self.vendedores.append(vendedoresResponsaveis)
            self.precoMetroQuadrado = precoMetroQuadrado
            self.taxaPorAndar = taxaPorAndar
            self.percentualParaVendedor = percentualParaVendedor
        }
    }
    
    func mudarParaVendido() {
        if apartamentos.isEmpty{
            self.fase = .vendido
        }
    }
    
}
