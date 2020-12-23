//
//  SynergyOption.swift
//
//
//  Created by Александр Губанов on 17.10.2020.
//

import Foundation

enum SynergyOption: Equatable {
    
    case abilityBased(strength: SynergyStrength)
    case ultimateBased(strength: SynergyStrength)
    case playStyleBased(strength: SynergyStrength)
    
    static func == (lhs: SynergyOption, rhs: SynergyOption) -> Bool {
        switch (lhs, rhs) {
        case (.abilityBased(let strengthOne), .abilityBased(let strengthTwo)) where strengthOne == strengthTwo,
             (.ultimateBased(let strengthOne), .ultimateBased(let strengthTwo)) where strengthOne == strengthTwo,
             (.playStyleBased(let strengthOne), .playStyleBased(let strengthTwo)) where strengthOne == strengthTwo:
            return true
        default:
            return false
        }
    }
}
