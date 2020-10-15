//
//  Player.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 15/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

class Player {
    
    static var average: Player {
        return AveragePlayer()
    }
    
    private var profile: Profile?
    
    fileprivate init() {}
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func getDPS(on hero: Hero) -> Double {
        guard let profile = profile,
              let stats = profile.heroStats[hero.name] else {
            return Player.average.getDPS(on: hero)
        }
        return stats.damageDone / stats.secondsPlayed
    }
    
    func getHPS(on hero: Hero) -> Double {
        guard let profile = profile,
              let stats = profile.heroStats[hero.name] else {
            return Player.average.getHPS(on: hero)
        }
        return stats.healingDone / stats.secondsPlayed
    }
    
    func prefers(_ hero: Hero) -> Bool {
        guard let profile = profile,
              let stats = profile.heroStats[hero.name] else {
            return false
        }
        let secondsOnHero = stats.secondsPlayed
        let maxSeconds = profile.heroStats.values.reduce(0) {
            ($1.secondsPlayed > $0) ? $1.secondsPlayed : $0
        }
        return secondsOnHero > maxSeconds / 2
    }
    
    func getTimeOnFirePercentage(playing hero: Hero) -> Double {
        guard let record = profile,
              let stats = record.heroStats[hero.name] else {
            return 0
        }
        return stats.secondsOnFire * 100 / stats.secondsPlayed
    }
}

fileprivate final class AveragePlayer: Player {
    
    override func getDPS(on hero: Hero) -> Double {
        switch hero.role {
        case .tank:
            return 50
        case .damage:
            return 100
        case .support:
            return 5
        }
    }
    
    override func getHPS(on hero: Hero) -> Double {
        guard hero.role == .support else {
            return 0
        }
        return 70
    }
    
    // TODO: Create most popular heroes list and return true if it contains requested hero
    override func prefers(_ hero: Hero) -> Bool {
        return false
    }
    
    override func getTimeOnFirePercentage(playing hero: Hero) -> Double {
        return 0
    }
}
