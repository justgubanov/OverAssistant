//
//  ProfileInfo.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 29/06/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

struct HeroStatsRecord {
    var secondsPlayed: Double
    var secondsOnFire: Double
    
    var damageDone: Double
    var healingDone: Double
    
    var deathCount: Int
    var killCount: Int
}

struct ProfileInfo {
    var heroStats = [String: HeroStatsRecord]()
    
    var competitiveRank: Int = 0
    var level: Int = 0
}
