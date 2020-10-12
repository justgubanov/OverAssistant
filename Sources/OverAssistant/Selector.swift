//
//  Helper.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 07/06/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

import Cocoa

class Selector: NSObject {
    
    static var allies = [Hero]()
    static var enemies = [Hero]()
    static var typeOfQueue: Role?
    
    static var conditions = GameConditions(map: .Hanamura, mode: .Assault, side: .Attack)
    static var playerProfile: Profile?
    
    private static func AdjustedRequirements() -> CompositionRequirements {
        let required = CompositionRequirements(for: conditions)
        let player = Player(profile: playerProfile)
        
        for hero in allies {
            required.teamHealth -= hero.stats.fullHealth
            required.teamDPS -= player.DamagePerSecond(on: hero)
            required.teamHPS -= player.HealingPerSecond(on: hero)
            
            
            if let index = required.ultimatesList.firstIndex( where: { hero.HasAbility(of: .Ultimate, with: $0) } ) {
                required.ultimatesList.remove(at: index)
            }
            
            if let index = required.rangesList.firstIndex( where: { hero.HasRange(of: $0) } ) {
                required.rangesList.remove(at: index)
            }
            
            if let index = required.playstyleList.firstIndex( where: { $0 == hero.playstyle } ) {
                required.playstyleList.remove(at: index)
            }
        }
        
        return required
    }
    
    static var rankedHeroes: [Hero: PickScore] {
        let required = AdjustedRequirements()
        let player = Player(profile: playerProfile)
        
        var heroesWeight = [Hero: PickScore]()
        
        let avaliableHeroes = HeroCollection.list.map { $0.value }
        
        for hero in avaliableHeroes {
            if allies.contains(hero) ||
            typeOfQueue != nil && hero.role != typeOfQueue {
                continue
            }
            
            var score = PickScore()
            
            if required.teamDPS > 0 {
                let rewardedDPS = min(player.DamagePerSecond(on: hero), required.teamDPS)
                score.increase(with: rewardedDPS, for: .DPS)
            }
            
            if required.teamHPS > 0 {
                let rewardedHPS = min(player.HealingPerSecond(on: hero), required.teamHPS)
                score.increase(with: rewardedHPS, for: .HPS)
            }
            
            if required.teamHealth > 0 {
                let rewardedHealth = min(hero.stats.fullHealth, required.teamHealth)
                score.increase(with: Double(rewardedHealth), for: .Health)
            }
            
            score.increase(with: player.TimeOnFirePersentage(on: hero), for: .TimeOnFire)
            
            if player.FavoriteHeroes(includes: hero) {
                score.increase(for: .Favourite)
            }
            
            if required.playstyleList.contains(hero.playstyle) {
                score.increase(for: .PlayStyle)
            }
            
            if required.rangesList.contains( where: { hero.HasRange(of: $0) } ) {
                score.increase(for: .Range)
            }
            
            if required.ultimatesList.contains( where: { hero.HasAbility(of: .Ultimate, with: $0) } ) {
                score.increase(for: .Ultimate)
            }
            
            for enemy in enemies {
                if Hero.Counter(for: enemy, is: hero) {
                    score.increase(for: .Counter)
                }
                
                if !Hero.Counter(for: hero, is: enemy) {
                    score.increase(for: .NotCounter)
                }
            }
            
            for ally in allies {
                if Hero.Synergy(between: hero, and: ally) {
                    score.increase(for: .Synergy)
                }
            }
            
            heroesWeight.updateValue(score, forKey: hero)
        }
        
        return heroesWeight
    }
}
