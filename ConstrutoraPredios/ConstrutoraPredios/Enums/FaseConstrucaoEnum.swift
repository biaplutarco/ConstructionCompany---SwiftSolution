//
//  FaseConstrucaoEnum.swift
//  ConstrutoraPredios
//
//  Created by Ada 2018 on 18/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import Foundation

enum FaseConstrucaoEnum : CustomStringConvertible{
    var description: String{
        if self == .planejamento{
            return "Em Planejamento"
        }else if self == .emConstrucao{
            return "Em Construçao"
        }else if self == .emVenda{
            return "Em Venda"
        }else {
            return "Vendido"
        }
    }
    
    case planejamento, emConstrucao, emVenda, vendido
}
