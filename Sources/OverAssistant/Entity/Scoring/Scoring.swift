//
//  Scoring.swift
//  
//
//  Created by Александр Губанов 16.10.2020.
//

public struct Scoring {
    
    private let player: Player
    private let allies: [Hero]
    private let enemies: [Hero]
    private var requirements: SessionRequirements
    
    public let hero: Hero
    
    public init(of scoredHero: Hero, in background: ScoringBackground) {
        hero = scoredHero
        allies = background.allies
        enemies = background.enemies
        player = Player(profile: background.targetProfile)
        
        requirements = SessionRequirements(for: background.conditions)
        adjust(&requirements, for: player)
    }
    
    public var result: PickScore {
        var score = PickScore()
    
// TODO: Reenable this after improving inner logic
//        increaseScoreForHeroDPS(&score)
//        increaseScoreForHeroHPS(&score)
//        increaseScoreForHeroHealth(&score)
//        increaseScoreForHeroTimeOnFire(&score)
        
//        increaseScoreForHeroPreference(&score)
//        increaseScoreForHeroPlayStyle(&score)
//        increaseScoreForHeroRangeCoverage(&score)
//        increaseScoreForHeroUltimate(&score)
        
        increaseScoreForCountering(&score)
        increaseScoreForSynergy(&score)
        return score
    }
    
    private func adjust(_ requirements: inout SessionRequirements, for player: Player) {
        for ally in allies {
            requirements.teamHealth -= ally.stats.effectiveHealth
            requirements.teamDPS -= player.getDPS(on: ally)
            requirements.teamHPS -= player.getHPS(on: ally)
            requirements.ultimatesTags.remove(ally.getUltimateAbilityTags())
            
            if let index = requirements.rangesList.firstIndex( where: { ally.isEffective(at: $0) } ) {
                requirements.rangesList.remove(at: index)
            }
            
            if let index = requirements.playstyleList.firstIndex( where: { $0 == ally.playstyle } ) {
                requirements.playstyleList.remove(at: index)
            }
        }
    }
}
    
extension Scoring {

    private func increaseScoreForHeroDPS(_ score: inout PickScore) {
        guard requirements.teamDPS > 0 else {
            return
        }
        let rewardedDPS = min(player.getDPS(on: hero), requirements.teamDPS)
        score.increase(with: rewardedDPS, for: .dps)
    }
    
    private func increaseScoreForHeroHPS(_ score: inout PickScore) {
        guard requirements.teamHPS > 0 else {
            return
        }
        let rewardedHPS = min(player.getHPS(on: hero), requirements.teamHPS)
        score.increase(with: rewardedHPS, for: .hps)
    }
    
    private func increaseScoreForHeroHealth(_ score: inout PickScore) {
        guard requirements.teamHealth > 0 else {
            return
        }
        let rewardedHealth = min(hero.stats.effectiveHealth, requirements.teamHealth)
        score.increase(with: Double(rewardedHealth), for: .healthProvider)
    }
    
    private func increaseScoreForHeroTimeOnFire(_ score: inout PickScore) {
        score.increase(with: player.getTimeOnFirePercentage(playing: hero), for: .timeOnFire)
    }
    
    private func increaseScoreForHeroPreference(_ score: inout PickScore) {
        guard player.prefers(hero) else {
            return
        }
        score.increase(for: .beingFavourite)
    }
    
    private func increaseScoreForHeroPlayStyle(_ score: inout PickScore) {
        let heroPlaystyle = hero.playstyle
        
        guard requirements.playstyleList.contains(heroPlaystyle) else {
            return
        }
        score.increase(for: .playStyle)
    }
    
    private func increaseScoreForHeroRangeCoverage(_ score: inout PickScore) {
        let isSuitableForRequiredRange = requirements.rangesList.contains { requiredRange in
            hero.isEffective(at: requiredRange)
        }
        
        guard isSuitableForRequiredRange else {
            return
        }
        score.increase(for: .havingSuitableRange)
    }
    
    private func increaseScoreForHeroUltimate(_ score: inout PickScore) {
        let ultimateTags = hero.getUltimateAbilityTags()
        
        guard requirements.ultimatesTags.contains(ultimateTags) else {
            return
        }
        score.increase(for: .havingSuitableUltimate)
    }
    
    private func increaseScoreForCountering(_ score: inout PickScore) {
        for enemy in enemies {
            if hero.counters(enemy) {
                score.increase(for: .counteringEnemy)
            }
            
            if !enemy.counters(hero) {
                score.increase(for: .notBeingCountered)
            }
        }
    }
    
    private func increaseScoreForSynergy(_ score: inout PickScore) {
        for ally in allies {
            if hero.synergises(with: ally) {
                score.increase(for: .teamSynergy)
            }
        }
    }
}
