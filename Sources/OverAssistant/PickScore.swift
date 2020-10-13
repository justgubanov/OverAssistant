//
//  Coefficient.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

enum ScoreFactor: String {
    
    case healthProvider
    case dps
    case hps
    case timeOnFire
    case beingFavourite
    case havingSuitableAbility
    case havingSuitableUltimate
    case havingSuitableRange
    case playStyle
    case countering
    case notBeingCountered
    case teamSynergy
    
    var value: Double {
        switch self {
        case .dps:
            return 0.001342
        case .hps:
            return 0.007246
        case .timeOnFire:
            return 0.011594
        case .beingFavourite:
            return 0.043478
        
        case .healthProvider:
            return 0.001318
        case .havingSuitableUltimate:
            return 0.057971
        case .havingSuitableRange:
            return 0.072464
        case .playStyle:
            return 0.072464
        case .havingSuitableAbility:
            return 0.028986
        
        case .countering:
            return 0.019324
        case .notBeingCountered:
            return 0.014493
        case .teamSynergy:
            return 0.036232
        }
    }
}


struct PickScore {
    
    var value: Double {
        return sequence.reduce(0) {
            $0 + $1.value
        }
    }
    
    private(set) var sequence: [ScoreFactor: Double] = [:]
    
    mutating func increase(with base: Double = 1, for factor: ScoreFactor) {
        let amount = base * factor.value
        let currentValue = sequence[factor] ?? 0
        sequence.updateValue(currentValue + amount, forKey: factor)
    }
}
