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
    
    private let profile: Profile
    
    var nickname: String? {
        return profile.playerName
    }
    
    var rank: Int {
        if let record = Profile.list[profile] {
            return record.competitiveRank
        } else {
            return 0
        }
    }
    
    var level: Int {
        if let record = Profile.list[profile] {
            return record.level
        } else {
            return 0
        }
    }
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func getDPS(on hero: Hero) -> Double {
        guard let record = Profile.list[profile],
              let stats = record.heroStats[hero.name] else {
            return Player.average.getDPS(on: hero)
        }
        return stats.damageDone / stats.secondsPlayed
    }
    
    func getHPS(on hero: Hero) -> Double {
        guard let record = Profile.list[profile],
              let stats = record.heroStats[hero.name] else {
            return Player.average.getHPS(on: hero)
        }
        return stats.healingDone / stats.secondsPlayed
    }
    
    func hasFavouriteHero(of hero: Hero) -> Bool {
        guard let record = Profile.list[profile],
              let stats = record.heroStats[hero.name] else {
            return false
        }
        let secondsOnHero = stats.secondsPlayed
        
        let maxSeconds = record.heroStats.values.reduce(0) {
            ($1.secondsPlayed > $0) ? $1.secondsPlayed : $0
        }
        
        return secondsOnHero > maxSeconds / 2
    }
    
    func getTimeOnFirePercentage(playing hero: Hero) -> Double {
        guard let record = Profile.list[profile],
              let stats = record.heroStats[hero.name] else {
            return 0
        }
        return stats.secondsOnFire * 100 / stats.secondsPlayed
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

final class AveragePlayer: Player {
    
    private static let stats: (dps: Double, hps: Double) = (dps: 100, hps: 0)
    override var nickname: String? { nil }
    override var rank: Int { 0 }
    override var level: Int { 0 }
    
    fileprivate init() {
        super.init(profile: Profile(for: "", on: .pc))
    }
    
    override func getDPS(on hero: Hero) -> Double {
        return AveragePlayer.stats.dps
    }
    
    override func getHPS(on hero: Hero) -> Double {
        return AveragePlayer.stats.hps
    }
    
    override func hasFavouriteHero(of hero: Hero) -> Bool {
        return false
    }
    
    override func getTimeOnFirePercentage(playing hero: Hero) -> Double {
        return 0
    }
}
