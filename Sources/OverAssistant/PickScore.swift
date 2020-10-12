//
//  Coefficient.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 12/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

enum ScoreFactor: String {
    
    case Health
    case DPS
    case HPS
    case TimeOnFire
    case Favourite
    case Ultimate
    case Range
    case PlayStyle
    case Counter
    case NotCounter
    case Synergy
    case Ability
    
    var value: Double {
        switch self {
        case .DPS:
            return 0.001342
        case .HPS:
            return 0.007246
        case .TimeOnFire:
            return 0.011594
        case .Favourite:
            return 0.043478
        
        case .Health:
            return 0.001318
        case .Ultimate:
            return 0.057971
        case .Range:
            return 0.072464
        case .PlayStyle:
            return 0.072464
        case .Ability:
            return 0.028986
        
        case .Counter:
            return 0.019324
        case .NotCounter:
            return 0.014493
        case .Synergy:
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
    
    private(set) var sequence: [String: Double] = [:]
    
    mutating func increase(with base: Double = 1, for factor: ScoreFactor) {
        let amount = base * factor.value
        let currentValue = sequence[factor.rawValue] ?? 0
        sequence.updateValue(currentValue + amount, forKey: factor.rawValue)
    }
}
