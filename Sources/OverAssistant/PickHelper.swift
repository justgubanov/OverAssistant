//
//  Helper.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 07/06/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

struct PickHelper {
    
    var allies = [Hero]()
    var enemies = [Hero]()
    var typeOfQueue: Hero.Role?
    
    var conditions = GameConditions(map: nil, offenseSide: .symmetrical)
    var playerProfile: Profile?
    
    lazy var player: Player = {
        if let playerProfile = playerProfile {
            return Player(profile: playerProfile)
        } else {
            return Player.average
        }
    }()
    
    mutating func getScoredHeroes() -> [Hero: PickScore] {
        let requirements = makeSessionRequirements()
        let availableHeroes = HeroList.list.map { $0.value }
        
        var heroesScores: [Hero: PickScore] = [:]
        
        for hero in availableHeroes {
            if allies.contains(hero) ||
            typeOfQueue != nil && hero.role != typeOfQueue {
                continue
            }
            
            var score = PickScore()
            
            if requirements.teamDPS > 0 {
                let rewardedDPS = min(player.getDPS(on: hero), requirements.teamDPS)
                score.increase(with: rewardedDPS, for: .dps)
            }
            
            if requirements.teamHPS > 0 {
                let rewardedHPS = min(player.getHPS(on: hero), requirements.teamHPS)
                score.increase(with: rewardedHPS, for: .hps)
            }
            
            if requirements.teamHealth > 0 {
                let rewardedHealth = min(hero.stats.fullHealth, requirements.teamHealth)
                score.increase(with: Double(rewardedHealth), for: .healthProvider)
            }
            
            score.increase(with: player.getTimeOnFirePercentage(playing: hero), for: .timeOnFire)
            
            if player.hasFavouriteHero(of: hero) {
                score.increase(for: .beingFavourite)
            }
            
            if requirements.playstyleList.contains(hero.playstyle) {
                score.increase(for: .playStyle)
            }
            
            if requirements.rangesList.contains( where: { hero.isEffective(at: $0) } ) {
                score.increase(for: .havingSuitableRange)
            }
            
            if requirements.ultimatesTags.contains(hero.getUltimateAbilityTags()) {
                score.increase(for: .havingSuitableUltimate)
                
            }
                        
            for enemy in enemies {
                if hero.counters(enemy) {
                    score.increase(for: .countering)
                }
                
                if !enemy.counters(hero) {
                    score.increase(for: .notBeingCountered)
                }
            }
            
            for ally in allies {
                if hero.synergises(with: ally) {
                    score.increase(for: .teamSynergy)
                }
            }
            
            heroesScores.updateValue(score, forKey: hero)
        }
        
        return heroesScores
    }
    
    private mutating func makeSessionRequirements() -> SessionRequirements {
        var requirements = SessionRequirements(for: conditions)
        for hero in allies {
            requirements.teamHealth -= hero.stats.fullHealth
            requirements.teamDPS -= player.getDPS(on: hero)
            requirements.teamHPS -= player.getHPS(on: hero)
            requirements.ultimatesTags.remove(hero.getUltimateAbilityTags())
            
            if let index = requirements.rangesList.firstIndex( where: { hero.isEffective(at: $0) } ) {
                requirements.rangesList.remove(at: index)
            }
            
            if let index = requirements.playstyleList.firstIndex( where: { $0 == hero.playstyle } ) {
                requirements.playstyleList.remove(at: index)
            }
        }
        
        return requirements
    }
}
