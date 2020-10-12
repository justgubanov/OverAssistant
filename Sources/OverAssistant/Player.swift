//
//  Player.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 15/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

class Player: NSObject {
    private var profile: Profile?
    
    var nickname: String {
        return profile?.playerName ?? ""
    }
    
    var platform: String {
        return profile?.platform.string ?? ""
    }
    
    var rank: Int {
        if let record = profileList[profile!] {
            return record.competitiveRank
        } else {
            return 0
        }
    }
    
    var level: Int {
        if let record = profileList[profile!] {
            return record.level
        } else {
            return 0
        }
    }
    
    
    init (profile: Profile? = nil) {
        self.profile = profile
    }
    
    
    func DamagePerSecond(on hero: Hero) -> Double {
        if profile != nil,
            let record = profileList[profile!],
            let stats = record.heroStats[hero.name] {
            return stats.damageDone / stats.secondsPlayed
        } else {
            return AverageMeasurment.DPS(on: hero)
        }
    }
    
    func HealingPerSecond(on hero: Hero) -> Double {
        if profile != nil,
            let record = profileList[profile!],
            let stats = record.heroStats[hero.name] {
            return stats.healingDone / stats.secondsPlayed
        } else {
            return AverageMeasurment.HPS(on: hero)
        }
    }
    
    func FavoriteHeroes(includes hero: Hero) -> Bool {
        if profile != nil,
            let record = profileList[profile!],
            let secondsOnHero = record.heroStats[hero.name]?.secondsPlayed {
            
            let maxSeconds = record.heroStats.values.reduce(0) {
                ($1.secondsPlayed > $0) ? $1.secondsPlayed : $0
            }
            
            return secondsOnHero > maxSeconds / 2
        } else {
            return false
        }
    }
    
    func TimeOnFirePersentage(on hero: Hero) -> Double {
        if profile != nil,
            let record = profileList[profile!],
            let stats = record.heroStats[hero.name] {
            return stats.secondsOnFire * 100 / stats.secondsPlayed
        } else {
            return 0
        }
    }
}


struct AverageMeasurment {
    private static var measurements: [String:(dps: Double, hps: Double)] = [
        "Tracer": (dps: 100, hps: 0)
    ]
    
    static func DPS(on hero: Hero) -> Double {
        return measurements[hero.name]?.dps ?? 0
    }
    
    static func HPS(on hero: Hero) -> Double {
        return measurements[hero.name]?.hps ?? 0
    }
}
