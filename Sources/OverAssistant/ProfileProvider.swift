//
//  ProfileProvider.swift
//  
//
//  Created by Александр Губанов on 13.10.2020.
//

import Foundation
import SwiftyJSON

public struct ProfileProvider {
    
    private struct ProfileInfo {
        
        var heroStats = [String: PerformanceRecord]()
        
        var competitiveRank: Int = 0
        var level: Int = 0
    }
    
    public init() {}
    
    public func loadProfile(nickname: String, platform: Profile.Platform) {
        loadInfo(nickname: nickname, platform: platform) { info in
            let newProfile = Profile(playerName: nickname,
                                     platform: platform,
                                     level: info.level,
                                     competitiveRank: info.competitiveRank,
                                     heroStats: info.heroStats)
            
            ProfileStorage.saves.append(newProfile)
        }
    }
    
    private func loadInfo(nickname: String, platform: Profile.Platform, completionHandler: @escaping (ProfileInfo) -> Void) {
        let nickname = nickname
        let platformString = platform.rawValue.lowercased()
        
        if let url = URL(string: "https://owapi.net/api/v3/u/\(nickname)/blob?platform=\(platformString)") {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                if let responseData = data,
                   let profileInfo = makeProfileInfo(from: responseData) {
                    completionHandler(profileInfo)
                }
            }
            dataTask.resume()
        }
    }
    
    private func makeProfileInfo(from data: Data) -> ProfileInfo? {
        do {
            var heroStats = [String: PerformanceRecord]()
            
            let json = try JSON(data: data)
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

                let results = PerformanceRecord(
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
            return info
        } catch {
            print("Error creating profile info \(error)")
            return nil
        }
    }
}

fileprivate extension Hero {
    
    var jsonName: String {
        switch name {
        case "Torbjörn":
            return "torbjorn"
        case "Soldier: 76":
            return "soldier76"
        case "Lúcio":
            return "lucio"
        case "D.Va":
            return "dva"
        case "Wrecking Ball":
            return "wrecking_ball"
        default:
            return name.lowercased()
        }
    }
}
