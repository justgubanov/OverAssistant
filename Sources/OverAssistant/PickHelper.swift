//
//  Helper.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 07/06/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public struct PickHelper {
    
    public enum QueueType {
        
        case roleSpecific(Hero.Role)
        case flexible
    }
    
    public var allies: [Hero] = []
    public var enemies: [Hero] = []
    
    public var conditions = GameConditions(map: nil, offenseSide: .symmetrical)
    public var playerProfile: Profile?
    public var typeOfQueue: QueueType = .flexible
    
    private var player: Player {
        guard let playerProfile = playerProfile else {
            return .average
        }
        return Player(profile: playerProfile)
    }
    
    public init() {}
    
    public func getScoredHeroes() -> [Hero: PickScore] {
        let requirements = makeSessionRequirements()
        let availableHeroes = HeroList.list.map { $0.value }
        
        var heroesScores: [Hero: PickScore] = [:]
        
        for hero in availableHeroes {
            guard !allies.contains(hero) else {
                continue
            }
            if case .roleSpecific(let role) = typeOfQueue, hero.role != role {
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
            
            if player.prefers(hero) {
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
    
    private func makeSessionRequirements() -> SessionRequirements {
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
