//
//  Profile.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 15/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Foundation
import SwiftyJSON

enum GamePlatform: String {
    
    case psn
    case xBox
    case pc
    case nintendo
    
    var lowercased: String {
        return self.rawValue.lowercased()
    }
    
    var string: String {
        return self.rawValue
    }
}


struct Profile {
    
    static var list: [Profile: ProfileInfo] = [:]
    
    private(set) var playerName: String
    private(set) var platform: GamePlatform
    
    init(for nickname: String, on platform: GamePlatform) {
        self.playerName = nickname
        self.platform = platform
        
        Profile.loadInfo(for: self)
    }
    
    static func loadInfo(for profile: Profile) {
        if let url = URL(string: "https://owapi.net/api/v3/u/\(profile.playerName)/blob?platform=\(profile.platform.lowercased)") {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let responseData = data {
                    updateList(for: profile, from: responseData)
                }
            }
            dataTask.resume()
        }
    }
    
    private static func updateList(for player: Profile, from response: Data) {
        do {
            var heroStats = [String: HeroStatsRecord]()
            
            let json = try JSON(data: response)
            let rank = json["any", "stats", "competitive", "overall_stats", "comprank"].int ?? 0
            let level = json["any", "stats", "competitive", "overall_stats", "level"].int ?? 0
            
            let competitiveStats = json["any", "heroes", "stats", "competitive"]
            let quickplayStats = json["any", "heroes", "stats", "quickplay"]

            for (jsonName, heroName) in HeroList.list.map( { ($0.value.jsonName, $0.value.name) } ) {
                let competitiveTime = competitiveStats[jsonName, "general_stats", "time_played"].double ?? 0
                let quickplayTime = quickplayStats[jsonName, "general_stats", "time_played"].double ?? 0

                let competitiveTimeSpentOnFire = competitiveStats[jsonName, "general_stats", "time_spent_on_fire"].double ?? 0
                let quickplayTimeSpentOnFire = quickplayStats[jsonName, "general_stats", "time_spent_on_fire"].double ?? 0

                let competitiveDamageDone = competitiveStats[jsonName, "general_stats", "all_damage_done"].double ?? 0
                let quickplayDamageDone = quickplayStats[jsonName, "general_stats", "all_damage_done"].double ?? 0

                let competitiveHealingDone = competitiveStats[jsonName, "general_stats", "healing_done"].double ?? 0
                let quickplayHealingDone = quickplayStats[jsonName, "general_stats", "healing_done"].double ?? 0

                let competitiveDeathCount = competitiveStats[jsonName, "general_stats", "deaths"].int ?? 0
                let quickplayDeathCount = quickplayStats[jsonName, "general_stats", "deaths"].int ?? 0

                let competitiveKillCount = competitiveStats[jsonName, "general_stats", "eliminations"].int ?? 0
                let quickplayKillCount = quickplayStats[jsonName, "general_stats", "eliminations"].int ?? 0

                let results = HeroStatsRecord(
                    secondsPlayed: competitiveTime + quickplayTime * 60 * 60,
                    secondsOnFire: competitiveTimeSpentOnFire + quickplayTimeSpentOnFire  * 60 * 60,
                    damageDone: competitiveDamageDone + quickplayDamageDone,
                    healingDone: competitiveHealingDone + quickplayHealingDone,
                    deathCount: competitiveDeathCount + quickplayDeathCount,
                    killCount: competitiveKillCount + quickplayKillCount
                )

                if results.secondsPlayed != 0 {
                    heroStats.updateValue(results, forKey: heroName)
                }
            }
            
            let info = ProfileInfo(heroStats: heroStats, competitiveRank: rank, level: level)
            Profile.list.updateValue(info, forKey: player)
            
        } catch {
            print("Error \(error)")
        }
    }
}

extension Profile: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(platform)
        hasher.combine(playerName)
    }
}
