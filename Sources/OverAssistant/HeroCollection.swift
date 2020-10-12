//
//  HeroCollection.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 24/07/2019.
//

import Cocoa

enum HeroCollection {
    static let list = [
        Tracer :
            Hero(name: "Tracer", number: 1,
                 abilities: [Ability(name: "Pulse Bomb", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Pulse Pistols", range: .Medium)],
                 role: .Damage, playstyle: .Flanker, health: 150),
        Reaper :
            Hero(name: "Reaper", number: 2,
                 abilities: [Ability(name: "Death Blossom", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Hellfire Shotguns", range: .Close)],
                 role: .Damage, playstyle: .Flanker, health: 250),
        Widowmaker :
            Hero(name: "Widowmaker", number: 3,
                 abilities: [Ability(name: "Infra-Sight", type: .Ultimate, tags: .Special)],
                 weapons: [Weapon(name: "Widow's Kiss", range: .Long)],
                 role: .Damage, playstyle: .Sniper, health: 200),
        Pharah :
            Hero(name: "Pharah", number: 4,
                 abilities: [Ability(name: "Barrage", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Rocket Launcher", range: .Medium)],
                 role: .Damage, playstyle: .Assault, health: 200),
        Reinhardt :
            Hero(name: "Reinhardt", number: 5,
                 abilities: [Ability(name: "Earthshatter", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Rocket Hammer", range: .Close)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 300, armor: 200),
        
        
        Mercy :
            Hero(name: "Mercy", number: 6,
                 abilities: [Ability(name: "Valkyrie", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Caduceus Staff", range: .Medium),
                           Weapon(name: "Caduceus Blaster", range: .Medium)],
                 role: .Support, playstyle: .Healer, health: 200),
        Torbjorn :
            Hero(name: "Torbjörn", number: 7,
                 abilities: [Ability(name: "Molten Core", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Rivet Gun", range: .Medium),
                           Weapon(name: "Forge Hammer", range: .Close)],
                 role: .Damage, playstyle: .Choker, health: 200),
        Hanzo :
            Hero(name: "Hanzo", number: 8,
                 abilities: [Ability(name: "Dragonstrike", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Storm Bow", range: .Long)],
                 role: .Damage, playstyle: .Sniper, health: 200),
        Winston :
            Hero(name: "Winston", number: 9,
                 abilities: [Ability(name: "Primal Rage", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Tesla Cannon", range: .Close)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 400, armor: 100),
        Zenyatta :
            Hero(name: "Zenyatta", number: 10,
                 abilities: [Ability(name: "Transcendence", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Orb of Destruction", range: .Medium)],
                 role: .Support, playstyle: .Healer, health: 50, shield: 150),
        
        
        Bastion :
            Hero(name: "Bastion", number: 11,
                 abilities: [Ability(name: "Configuration: Tank", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Configuration: Recon", range: .Medium),
                           Weapon(name: "Configuration: Sentry", range: .Medium),
                           Weapon(name: "Configuration: Tank", range: .Medium)],
                 role: .Damage, playstyle: .Choker, health: 200, armor: 100),
        Symmetra :
            Hero(name: "Symmetra", number: 12,
                 abilities: [Ability(name: "Photon Barrier", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Photon Projector", range: .Close)],
                 role: .Support, playstyle: .Choker, health: 100, shield: 100),
        Zarya :
            Hero(name: "Zarya", number: 13,
                 abilities: [Ability(name: "Graviton Surge", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Particle Cannon", range: .Long)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 200, shield: 200),
        McCree :
            Hero(name: "McCree", number: 14,
                 abilities: [Ability(name: "Deadeye", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Peacekeeper", range: .Long)],
                 role: .Damage, playstyle: .Assault, health: 200),
        Soldier76 :
            Hero(name: "Soldier: 76", number: 15,
                 abilities: [Ability(name: "Tactical Visor", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Heavy Pulse Rifle", range: .Long)],
                 role: .Damage, playstyle: .Assault, health: 200),
        
        
        Lucio :
            Hero(name: "Lúcio", number: 16,
                 abilities: [Ability(name: "Sound Barrier", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Sonic Amplifier", range: .Close)],
                 role: .Support, playstyle: .Healer, health: 200),
        Roadhog :
            Hero(name: "Roadhog", number: 17,
                 abilities: [Ability(name: "Whole Hog", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Scrap Gun", range: .Close)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 600),
        Junkrat :
            Hero(name: "Junkrat", number: 18,
                 abilities: [Ability(name: "RIP-Tire", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Frag Launcher", range: .Medium)],
                 role: .Damage, playstyle: .Choker, health: 200),
        DVa :
            Hero(name: "D.Va", number: 19,
                 abilities: [Ability(name: "Self-Destruct", type: .Ultimate, tags: .Offensive),
                             Ability(name: "Call Mech", type: .Ultimate, tags: .Special)],
                 weapons: [Weapon(name: "Fusion Cannons", range: .Close),
                           Weapon(name: "Light Gun", range: .Close)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 400, armor: 200),
        Mei :
            Hero(name: "Mei", number: 20,
                 abilities: [Ability(name: "Blizzard", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Endothermic Blaster", range: .Medium)],
                 role: .Damage, playstyle: .Assault, health: 250),
        
        
        Genji :
            Hero(name: "Genji", number: 21,
                 abilities: [Ability(name: "Dragonblade", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Shuriken", range: .Medium)],
                 role: .Damage, playstyle: .Flanker, health: 200),
        Ana :
            Hero(name: "Ana", number: 22,
                 abilities: [Ability(name: "Nano Boost", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Biotic Rifle", range: .Long)],
                 role: .Support, playstyle: .Healer, health: 200),
        Sombra :
            Hero(name: "Sombra", number: 23,
                 abilities: [Ability(name: "EMP", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Machine Pistol", range: .Medium)],
                 role: .Damage, playstyle: .Flanker, health: 200),
        Orisa :
            Hero(name: "Orisa", number: 24,
                 abilities: [Ability(name: "Supercharger", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "Fusion Driver", range: .Medium)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 200, armor: 200),
        Doomfist :
            Hero(name: "Doomfist", number: 25,
                 abilities: [Ability(name: "Meteor strike", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Hand Cannon", range: .Close)],
                 role: .Damage, playstyle: .Flanker, health: 250),
        
        
        Moira :
            Hero(name: "Moira", number: 26,
                 abilities: [Ability(name: "Coalescence", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Biotic Grasp", range: .Close)],
                 role: .Support, playstyle: .Healer, health: 200),
        Brigitte :
            Hero(name: "Brigitte", number: 27,
                 abilities: [Ability(name: "Rally", type: .Ultimate, tags: .Defensive)],
                 weapons: [Weapon(name: "Rocket Flail", range: .Close)],
                 role: .Support, playstyle: .Healer, health: 200, armor: 50),
        WreckingBall :
            Hero(name: "Wrecking Ball", number: 28,
                 abilities: [Ability(name: "Minefield", type: .Ultimate, tags: .Control)],
                 weapons: [Weapon(name: "Quad Cannons", range: .Close)],
                 role: .Tank, playstyle: .DamageAbsorber, health: 500, armor: 100),
        Ashe :
            Hero(name: "Ashe", number: 29,
                 abilities: [Ability(name: "B.O.B.", type: .Ultimate, tags: .Offensive)],
                 weapons: [Weapon(name: "The Viper", range: .Long)],
                 role: .Damage, playstyle: .Assault, health: 200),
        Baptiste :
            Hero(name: "Baptiste", number: 30,
                 abilities: [Ability(name: "Amplification Matrix", type: .Ultimate, tags: .Special)],
                 weapons: [Weapon(name: "Biotic Launcher", range: .Medium)],
                 role: .Support, playstyle: .Healer, health: 200),
        
        
        Sigma :
            Hero(name: "Sigma", number: 31,
                 abilities: [],
                 weapons: [],
                 role: .Tank, playstyle: .DamageAbsorber, health: 300, shield: 100)
    ]
    
    case Tracer, Reaper, Widowmaker, Pharah, Reinhardt
    case Mercy, Torbjorn, Hanzo, Winston, Zenyatta
    case Bastion, Symmetra, Zarya, McCree, Soldier76
    case Lucio, Roadhog, Junkrat, DVa, Mei
    case Genji, Ana, Sombra, Orisa, Doomfist
    case Moira, Brigitte, WreckingBall, Ashe, Baptiste
    case Sigma
    
    #if swift(>=5.1)
    static subscript(hero: HeroCollection) -> Hero {
        return HeroCollection.list[hero]!
    }
    #endif
    
    @available(swift, deprecated: 5.1, message: "To get Hero instance use type subscript insted")
    var value: Hero {
        return HeroCollection.list[self]!
    }
    
    static func SelectBy(role: Role) -> [Hero] {
        return list.filter {
            $0.value.role == role
        }
        .map { $1 }
    }
}
