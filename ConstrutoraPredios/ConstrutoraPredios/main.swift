//  1 - Cadastro de Profissionais
//  2 - Cadastro de Vendedores
//  3 - Cadastro de Predios, Setar Apartamentos
//  4 - Inserçao de Profissionais em Predios
//  5 - Mudar Estado do Predo
//  6 - Venda de Apartamentos
//  7 - Clientes

import Foundation

var empreteira = Empreiteira()
//defaults'
empreteira.profissionais.append(Empregado(nome: "maria", fone: "123", endereco: "rua das flores", categoria: .mestreDeObra))
empreteira.profissionais.append(Empregado(nome: "jose", fone: "123", endereco: "rua das flores", categoria: .servente))
empreteira.profissionais.append(Empregado(nome: "elias", fone: "123", endereco: "rua das flores", categoria: .pedreiro))
empreteira.profissionais.append(Arquiteto(nome: "elias1", fone: "123", endereco: "rua das flores", cra: "45"))
empreteira.profissionais.append(Engenheiro(nome: "elias2", fone: "123", endereco: "rua das flores", crea: "450"))
empreteira.vendedoresTotais.append(Vendedor(nome: "zezim", fone: "345", endereco: "rua morratta"))
empreteira.clientes.append(Cliente(nome: "cibe", fone: "325", endereco: "rua rratta"))
//fim defaults

var continuar = true
var entrada : String?

while continuar {
    print("SISTEMA EMPRETEIRA")
    print("<1> Registrar Empregados\n<2> Empregados\n<3> Registrar Vendedor\n<4> Registrar Predios\n<5> Predios \n<6> Vendedores \n<7> Registrar Venda \n<8> Registrar Cliente \n<9> Clientes")
    entrada = readLine()
    switch entrada! {
    case "1":
        print("Digite o Nome do Empregado")
        let nome = readLine()!
        print("Digite o Fone do Empregado")
        let fone = readLine()!
        print("Digite o Endereco do Empregado")
        let endereco = readLine()!
        print("Digite a Categoria do Empregado \n<1> pedreiro \n<2> servente \n<3> mestre de obras \n<4> Engenheiro \n<5> arquiteto\n> ")
        let categoria = Int(readLine()!)!
        
        var profissional : ProfissionalProtocol?
        
        switch categoria {
        case 1:
            profissional = Empregado(nome: nome, fone: fone, endereco: endereco, categoria: .pedreiro)
        case 2:
            profissional = Empregado(nome: nome, fone: fone, endereco: endereco, categoria: .servente)
        case 3:
            profissional = Empregado(nome: nome, fone: fone, endereco: endereco, categoria: .mestreDeObra)
        case 4:
            print("Digite o CREA do engenheiro")
            let crea = readLine()!
            profissional = Engenheiro(nome: nome, fone: fone, endereco: endereco, crea: crea)
        case 5:
            print("Digite o CREA do engenheiro")
            let cra = readLine()!
            profissional = Arquiteto(nome: nome, fone: fone, endereco: endereco, cra: cra)
        default:
            print("Profissional Nao Existe")
        }
        
        if let profDaEmpreteira = profissional{
            empreteira.profissionais.append(profDaEmpreteira)
        }
    case "2":
        empreteira.profissionais.forEach({ (profissional) in
            print(profissional)
        })
        print()
    case "3":
        print("Digite o Nome do Vendedor")
        let nome = readLine()!
        print("Digite o Fone do Vendedor")
        let fone = readLine()!
        print("Digite o Endereco do Vendedor")
        let endereco = readLine()!
        
        let vendedor : Vendedor = Vendedor(nome: nome, fone: fone, endereco: endereco)
        empreteira.vendedoresTotais.append(vendedor)
    case "4":
        print("Digite o Nome do Predio")
        let nome = readLine()!
        print("Escolha o Arquiteto: ")
        
        for (index, profissional) in empreteira.profissionais.enumerated(){
            if let arquiteto =  profissional as? Arquiteto{
                if arquiteto.horasPorDia == 0{
                    print("<\(index)> \(arquiteto)")
                }
            }
        }
        let arquitetoIndex = Int(readLine()!)!
        let arquiteto = empreteira.profissionais[arquitetoIndex] as! Arquiteto
        let predio = Predio(nome: nome, arquiteto: arquiteto)
        
        arquiteto.incrementarCargaHoraria(horasPorDia: .alto)
        
        empreteira.predios.append(predio)
    case "5":
        for (index, predio) in empreteira.predios.enumerated(){
            print("<\(index)> \(predio)")
        }
        print("<1> Sair \n<2> Mudar Fase de Desenvolvimento\n<3> Comprar Terreno\n<4> Ver Apartamentos\n<5> Adicionar Empregados no Predio\n<6> Empregados\n<7> Adicionar Vendedor\n<8> Vendedor")
        let opcao = readLine()!
        switch opcao {
        case "8":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            
            predio.vendedores.forEach({ (vendedor) in
                print(vendedor)
            })
        case "7":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            
            print("Escolha o Vendedor: ")
            for (index, vendedor) in empreteira.vendedoresTotais.enumerated(){
                if !predio.vendedores.contains(vendedor){
                    print("<\(index)> \(vendedor)")
                }
            }
            
            let vendedorIndex = Int(readLine()!)!
            let vendedor = empreteira.vendedoresTotais[vendedorIndex]
            predio.vendedores.append(vendedor)
        case "6":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            
            predio.empregados.forEach({ (empregado) in
                print(empregado)
            })
        case "4":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            if predio.apartamentos.count > 0{
                for (index, apartamento) in predio.apartamentos.enumerated(){
                    print("<\(index)> \(apartamento)")
                }
            }
            else{
                print("Predio Não Tem Apartamentos")
            }
        case "3":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            if predio.terreno{
                print("TERRENO JA FOI COMPRADO")
            }else{
                print("TERRENO COMPRADO")
                predio.terreno = true
            }
        case "2":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            
            if predio.fase == .planejamento{
                print("Escolha o Engenheiro: ")
                for (index, profissional) in empreteira.profissionais.enumerated(){
                    if let engenheiro =  profissional as? Engenheiro{
                        if engenheiro.horasPorDia == 0 {
                            print("<\(index)> \(engenheiro)")
                        }
                    }
                }
                let engenheiroIndex = Int(readLine()!)!
                let engenheiro = empreteira.profissionais[engenheiroIndex] as! Engenheiro
                engenheiro.incrementarCargaHoraria(horasPorDia: .alto)
                
                print("Escolha o Mestre de Obras: ")
                for (index, profissional) in empreteira.profissionais.enumerated(){
                    if let mestre =  profissional as? Empregado{
                        if mestre.categoria == .mestreDeObra{
                            print("<\(index)> \(mestre)")
                        }
                    }
                }
                let mestreIndex = Int(readLine()!)!
                let mestre = empreteira.profissionais[mestreIndex] as! Empregado
                print("Qual a Carga Horaria do Mestre de Obras? <1> Para 4h <2> Para 6h <3> Para 8h")
                let cargaHoraria = Int(readLine()!)!
                switch cargaHoraria{
                case 1:
                    mestre.incrementarCargaHoraria(horasPorDia: .pouco)
                case 2:
                    mestre.incrementarCargaHoraria(horasPorDia: .medio)
                case 3:
                    mestre.incrementarCargaHoraria(horasPorDia: .alto)
                default:
                    mestre.incrementarCargaHoraria(horasPorDia: .pouco)
                }
                
            
                if predio.mudarParaEmConstrucao(engenheiro: engenheiro, mestreDeObra: mestre) {
                    print("PREDIO \(predio.nome) AGORA ESTÁ EM CONSTRUÇÃO")
                }
                else{
                    print("NÃO FOI POSSIVEL MUDAR FASE, POIS O PREDIO NÃO TEM TERRENO")
                }
            }
            else if predio.fase == .emConstrucao{
                print("Digite a Taxa por Andar")
                let taxaAndar = Double(readLine()!)!
                print("Digite o Percentual do Vendedor")
                let percentual = Double(readLine()!)!
                print("Digite o Preço do Metro Quadrado")
                let metroQ = Double(readLine()!)!
                
                print("Digite a Quantidade de Apartamentos")
                let nApartamentos = Int(readLine()!)!
                var aparamentoAtual: Apartamento?
                for nApartamento in 0..<nApartamentos{
                    print("Digite o Metro Quadrado do Apartamento <\(nApartamento)>")
                    let metroQA = Double(readLine()!)!
                    print("Digite o Andar do Apartamento <\(nApartamento)>")
                    let andar = Int(readLine()!)!
                    aparamentoAtual = Apartamento(metroQuadrado: metroQA, andar: andar)
                    predio.apartamentos.append(aparamentoAtual!)
                }
                
                print("Escolha o Vendedor: ")
                for (index, vendedor) in empreteira.vendedoresTotais.enumerated(){
                    print("<\(index)> \(vendedor)")
                }
                let vendedorIndex = Int(readLine()!)!
                let vendedor = empreteira.vendedoresTotais[vendedorIndex]
                predio.mudarParaEmVenda(vendedoresResponsaveis: vendedor, precoMetroQuadrado: metroQ, taxaPorAndar: taxaAndar, percentualParaVendedor: percentual)
            }
        case "5":
            print("Qual o Numero do Predio? ")
            let predioIndex = Int(readLine()!)!
            let predio = empreteira.predios[predioIndex]
            
            print("Qual a Carga Horaria do Profissional? <1> Para 4h <2> Para 6h <3> Para 8h")
            let cargaH = Int(readLine()!)!
            var cargaHoraria: HorasPorDiaEnum?
            switch cargaH{
            case 1:
                cargaHoraria = .pouco
            case 2:
                cargaHoraria = .medio
            case 3:
                cargaHoraria = .alto
            default:
                cargaHoraria = .pouco
            }

            print("Escolha Profissional:")
            for (index, profissional) in empreteira.profissionais.enumerated(){
                if cargaHoraria!.rawValue + profissional.horasPorDia < 9 {
                    if let empregado = profissional as? Empregado{
                        if !predio.empregados.contains(empregado) {
                            print("<\(index)> \(empregado)")
                        }
                    }
                }
            }
            let profissionalIndex = Int(readLine()!)!
            let profissional = empreteira.profissionais[profissionalIndex]
            predio.empregados.append(profissional as! Empregado)
            
        default:
            print("Opcao Nao Existe")
        }
    case "6":
        empreteira.vendedoresTotais.forEach({ (vendedor) in
            print(vendedor)
        })
        print()
    case "7":
        print("Escolha o Predio: ")
        for (index, predio) in empreteira.predios.enumerated(){
            print("<\(index)> \(predio)")
        }
        let predioIndex = Int(readLine()!)!
        let predio = empreteira.predios[predioIndex]
        if predio.apartamentos.count > 0 {
            print("Escolha o Cliente: ")
            for (index, cliente) in empreteira.clientes.enumerated(){
                print("<\(index)> \(cliente)")
            }
            let clienteIndex = Int(readLine()!)!
            let cliente = empreteira.clientes[clienteIndex]
            print("Escolha o Vendedor: ")
            for (index, vendedor) in empreteira.vendedoresTotais.enumerated(){
                print("<\(index)> \(vendedor)")
            }
            let vendedorIndex = Int(readLine()!)!
            let vendedor = empreteira.vendedoresTotais[vendedorIndex]
            print("Escolha o Apartamento: ")
            for (index, apartamento) in predio.apartamentos.enumerated() where !apartamento.apartamentoVendido{
                print("<\(index)> \(apartamento)")
            }
            let apartamentoIndex = Int(readLine()!)!
            let apartamento = predio.apartamentos[apartamentoIndex]
            
            let venda = Venda(vendedor: vendedor, predio: predio, apartamento: apartamento, cliente: cliente)
            empreteira.vendas.append(venda)
            
            let precoVenda = empreteira.precoVenda(venda: venda)
            print("Preço da Venda: \(precoVenda)")
            
            let pagamentoVendedor = empreteira.pagamentoVendedorPor(venda: venda)
            print("Pagamento do Vendedor pela Venda: \(pagamentoVendedor)")
            
            vendedor.capital += pagamentoVendedor
            
        } else {
            print("NÃO EXISTEM APARTAMENTOS REGISTRADOS NESSE PREDIO")
        }
    case "8":
        print("Digite o Nome do Cliente")
        let nome = readLine()!
        print("Digite o Fone do Cliente")
        let fone = readLine()!
        print("Digite o Endereco do Cliente")
        let endereco = readLine()!
        
        
        let cliente : Cliente = Cliente(nome: nome, fone: fone, endereco: endereco)
        empreteira.clientes.append(cliente)
    case "9":
        empreteira.clientes.forEach({ (cliente) in
            print(cliente)
        })
        print()
    default:
        print("deu ruim")
    }
    
}
