//
//  CounterKey.swift
//
//
//  Created by Александр Губанов on 30.11.2020.
//

import Foundation

struct CounterKey {

    let dominantHeroId: HeroId
    let otherHeroId: HeroId

    init(_ dominantHeroId: HeroId, _ otherHeroId: HeroId) {
        self.dominantHeroId = dominantHeroId
        self.otherHeroId = otherHeroId
    }
}

extension CounterKey: Hashable, Equatable {}
