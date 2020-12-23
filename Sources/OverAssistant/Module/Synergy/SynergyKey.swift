//
//  SynergyKey.swift
//
//
//  Created by Александр Губанов on 17.10.2020.
//

import Foundation

struct SynergyKey {
    
    private let duoIdStrings: Set<HeroId>
    
    init?(_ firstId: HeroId, _ secondId: HeroId) {
        guard firstId != secondId else {
            return nil
        }
        duoIdStrings = [firstId, secondId]
    }
}

extension SynergyKey: Hashable, Equatable {
    
    static func == (_ lhs: SynergyKey, _ rhs: SynergyKey) -> Bool {
        return lhs.duoIdStrings == rhs.duoIdStrings
    }
}
