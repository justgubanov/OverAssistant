//
//  Hero.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 11/05/2019.
//  Copyright © 2019 Plekhanov University. All rights reserved.
//

public class Hero {
    
    enum Playstyle: String {
        
        case flanker
        case assault
        case choker
        case healer
        case damageAbsorber
        case sniper
    }
    
    public enum Role: String {
        
        case tank
        case damage
        case support
    }
    
    let id: HeroId
    
    let name: String
    var number: Int { id.number }
    let role: Role
    let stats: HealthStats
    
    let playstyle: Playstyle
    let abilityList: [Ability]
    let weaponList: [Weapon]

    init (id: HeroId, name: String, abilities: [Ability], weapons: [Weapon], role: Role, playstyle: Playstyle, health: HealthStats) {
        self.id = id
        self.name = name
        self.role = role
        self.stats = health
        
        self.playstyle = playstyle
        self.abilityList = abilities
        self.weaponList = weapons
    }
    
    func getUltimateAbilityTags() -> Ability.TagSet {
        let selectedAbilities = abilityList.filter { ability in
            ability.kind == .ultimate
        }
        return selectedAbilities.reduce([]) { tags, ability in
            tags.union(ability.tags)
        }
    }

    func isEffective(at range: Weapon.Range) -> Bool {
        let ranges = weaponList.flatMap { $0.effectiveRange }
        return ranges.contains(range)
    }

    func synergises(with otherHero: Hero) -> Bool {
        guard let synergies = SynergyRecognizer.getSynergy(between: self, and: otherHero),
              !synergies.isEmpty else {
            return false
        }
        return true
    }

    func counters(_ otherHero: Hero) -> Bool {
        let counteringOption = CounterRecognizer.estimate(self, countering: otherHero)
        return counteringOption != nil
    }
}

extension Hero: Hashable {
    
    public static func == (lhs: Hero, rhs: Hero) -> Bool {
        lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
