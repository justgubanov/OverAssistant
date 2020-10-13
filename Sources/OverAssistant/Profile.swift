//
//  Profile.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 15/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

struct Profile {
    
    enum Platform: String {
        
        case psn
        case xBox
        case pc
        case nintendo
    }
    
    let playerName: String
    let platform: Platform
    
    let level: Int
    let competitiveRank: Int
    
    let heroStats: [String: PerformanceRecord]
}

extension Profile: Hashable {
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        guard lhs.playerName == rhs.playerName,
              lhs.platform == rhs.platform else {
            return false
        }
        return true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(platform)
        hasher.combine(playerName)
    }
}
