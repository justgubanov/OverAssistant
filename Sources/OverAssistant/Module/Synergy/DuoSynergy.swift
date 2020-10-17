//
//  DuoSynergy.swift
//  
//
//  Created by Александр Губанов on 17.10.2020.
//

import Foundation

struct DuoSynergy {
    
    typealias HeroId = String
    
    private let duoIdStrings: Set<String>
    
    init?(_ firstId: HeroId, _ secondId: HeroId) {
        guard firstId != secondId else {
            return nil
        }
        duoIdStrings = [firstId, secondId]
    }
}

extension DuoSynergy: Hashable, Equatable {
    
    static func == (_ lhs: DuoSynergy, _ rhs: DuoSynergy) -> Bool {
        return lhs.duoIdStrings == rhs.duoIdStrings
    }
}
