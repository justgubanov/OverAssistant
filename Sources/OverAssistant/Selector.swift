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
    
    
    static var rankedHeroes: [Hero: Score] {
        let required = AdjustedRequirements()
        let player = Player(profile: playerProfile)
        
        var heroesWeight = [Hero: Score]()
        
        let avaliableHeroes = HeroCollection.list.map { $0.value }
        
        for hero in avaliableHeroes {
            if allies.contains(hero) ||
            typeOfQueue != nil && hero.role != typeOfQueue {
                continue
            }
            
            var points = Score()
            
            if required.teamDPS > 0 {
                let rewardedDPS = min(player.DamagePerSecond(on: hero), required.teamDPS)
                points.Increase(with: rewardedDPS, for: .DPS)
            }
            
            if required.teamHPS > 0 {
                let rewardedHPS = min(player.HealingPerSecond(on: hero), required.teamHPS)
                points.Increase(with: rewardedHPS, for: .HPS)
            }
            
            if required.teamHealth > 0 {
                let rewardedHealth = min(hero.stats.fullHealth, required.teamHealth)
                points.Increase(with: Double(rewardedHealth), for: .Health)
            }
            
            points.Increase(with: player.TimeOnFirePersentage(on: hero), for: .TimeOnFire)
            
            if player.FavoriteHeroes(includes: hero) {
                points.Increase(for: .Favorite)
            }
            
            if required.playstyleList.contains(hero.playstyle) {
                points.Increase(for: .PlayStyle)
            }
            
            if required.rangesList.contains( where: { hero.HasRange(of: $0) } ) {
                points.Increase(for: .Range)
            }
            
            if required.ultimatesList.contains( where: { hero.HasAbility(of: .Ultimate, with: $0) } ) {
                points.Increase(for: .Ultimate)
            }
            
            for enemy in enemies {
                if Hero.Counter(for: enemy, is: hero) {
                    points.Increase(for: .Counter)
                }
                
                if !Hero.Counter(for: hero, is: enemy) {
                    points.Increase(for: .NotCounter)
                }
            }
            
            for ally in allies {
                if Hero.Synergy(between: hero, and: ally) {
                    points.Increase(for: .Synergy)
                }
            }
            
            heroesWeight.updateValue(points, forKey: hero)
        }
        
        return heroesWeight
    }
}
