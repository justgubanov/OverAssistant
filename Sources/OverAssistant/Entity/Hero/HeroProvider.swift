//
//  HeroProvider.swift
//  OWTB Alpha
//
//  Created by Александр Губанов on 24/07/2019.
//

public struct HeroProvider {
    
    public static let list = [
            Hero(id: 1, name: "Tracer",
                 abilities: [Ability(name: "Pulse Bomb", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Pulse Pistols", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 150),
            Hero(id: 2, name: "Reaper",
                 abilities: [Ability(name: "Death Blossom", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Hellfire Shotguns", range: .close)],
                 role: .damage, playstyle: .flanker, health: 250),
            Hero(id: 3, name: "Widowmaker",
                 abilities: [Ability(name: "Infra-Sight", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Widow's Kiss", range: .long)],
                 role: .damage, playstyle: .sniper, health: 200),
            Hero(id: 4, name: "Pharah",
                 abilities: [Ability(name: "Barrage", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Rocket Launcher", range: .medium)],
                 role: .damage, playstyle: .assault, health: 200),
            Hero(id: 5, name: "Reinhardt",
                 abilities: [Ability(name: "Earthshatter", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Rocket Hammer", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(300, armour: 200)),
        
        
            Hero(id: 6, name: "Mercy",
                 abilities: [Ability(name: "Valkyrie", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Caduceus Staff", range: .medium),
                           Weapon(name: "Caduceus Blaster", range: .medium)],
                 role: .support, playstyle: .healer, health: 200),
            Hero(id: 7, name: "Torbjörn",
                 abilities: [Ability(name: "Molten Core", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Rivet Gun", range: .medium),
                           Weapon(name: "Forge Hammer", range: .close)],
                 role: .damage, playstyle: .choker, health: .init(200, armour: 50)),
            Hero(id: 8, name: "Hanzo",
                 abilities: [Ability(name: "Dragonstrike", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Storm Bow", range: .long)],
                 role: .damage, playstyle: .sniper, health: 200),
            Hero(id: 9, name: "Winston",
                 abilities: [Ability(name: "Primal Rage", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Tesla Cannon", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(400, armour: 100)),
            Hero(id: 10, name: "Zenyatta",
                 abilities: [Ability(name: "Transcendence", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Orb of Destruction", range: .medium)],
                 role: .support, playstyle: .healer, health: .init(50, shield: 150)),
        
        
            Hero(id: 11, name: "Bastion",
                 abilities: [Ability(name: "Configuration: Tank", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Configuration: Recon", range: .medium),
                           Weapon(name: "Configuration: Sentry", range: .medium),
                           Weapon(name: "Configuration: Tank", range: .medium)],
                 role: .damage, playstyle: .choker, health: .init(200, armour: 100)),
            Hero(id: 12, name: "Symmetra",
                 abilities: [Ability(name: "Photon Barrier", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Photon Projector", range: .close)],
                 role: .damage, playstyle: .choker, health: .init(100, shield: 100)),
            Hero(id: 13, name: "Zarya",
                 abilities: [Ability(name: "Graviton Surge", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Particle Cannon", range: .long)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(200, shield: 200)),
            Hero(id: 14, name: "McCree",
                 abilities: [Ability(name: "Deadeye", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Peacekeeper", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
            Hero(id: 15, name: "Soldier: 76",
                 abilities: [Ability(name: "Tactical Visor", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Heavy Pulse Rifle", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
        
        
            Hero(id: 16, name: "Lúcio",
                 abilities: [Ability(name: "Sound Barrier", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Sonic Amplifier", range: .close)],
                 role: .support, playstyle: .healer, health: 200),
            Hero(id: 17, name: "Roadhog",
                 abilities: [Ability(name: "Whole Hog", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Scrap Gun", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: 600),
            Hero(id: 18, name: "Junkrat",
                 abilities: [Ability(name: "RIP-Tire", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Frag Launcher", range: .medium)],
                 role: .damage, playstyle: .choker, health: 200),
            Hero(id: 19, name: "D.Va",
                 abilities: [Ability(name: "Self-Destruct", kind: .ultimate, tags: .offensive),
                             Ability(name: "Call Mech", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Fusion Cannons", range: .close),
                           Weapon(name: "Light Gun", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(400, armour: 200)),
            Hero(id: 20, name: "Mei",
                 abilities: [Ability(name: "Blizzard", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Endothermic Blaster", range: .medium)],
                 role: .damage, playstyle: .assault, health: 250),
        
        
            Hero(id: 21, name: "Genji",
                 abilities: [Ability(name: "Dragonblade", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Shuriken", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 200),
            Hero(id: 22, name: "Ana",
                 abilities: [Ability(name: "Nano Boost", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Biotic Rifle", range: .long)],
                 role: .support, playstyle: .healer, health: 200),
            Hero(id: 23, name: "Sombra",
                 abilities: [Ability(name: "EMP", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Machine Pistol", range: .medium)],
                 role: .damage, playstyle: .flanker, health: 200),
            Hero(id: 24, name: "Orisa",
                 abilities: [Ability(name: "Supercharger", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "Fusion Driver", range: .medium)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(200, armour: 250)),
            Hero(id: 25, name: "Doomfist",
                 abilities: [Ability(name: "Meteor strike", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Hand Cannon", range: .close)],
                 role: .damage, playstyle: .flanker, health: 250),
        
        
            Hero(id: 26, name: "Moira",
                 abilities: [Ability(name: "Coalescence", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Biotic Grasp", range: .close)],
                 role: .support, playstyle: .healer, health: 200),
            Hero(id: 27, name: "Brigitte",
                 abilities: [Ability(name: "Rally", kind: .ultimate, tags: .defensive)],
                 weapons: [Weapon(name: "Rocket Flail", range: .close)],
                 role: .support, playstyle: .healer, health: .init(150, armour: 50)),
            Hero(id: 28, name: "Wrecking Ball",
                 abilities: [Ability(name: "Minefield", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Quad Cannons", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(500, armour: 100)),
            Hero(id: 29, name: "Ashe",
                 abilities: [Ability(name: "B.O.B.", kind: .ultimate, tags: .offensive)],
                 weapons: [Weapon(name: "The Viper", range: .long)],
                 role: .damage, playstyle: .assault, health: 200),
            Hero(id: 30, name: "Baptiste",
                 abilities: [Ability(name: "Amplification Matrix", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Biotic Launcher", range: .medium)],
                 role: .support, playstyle: .healer, health: 200),
        
        
            Hero(id: 31, name: "Sigma",
                 abilities: [Ability(name: "Gravitic Flux", kind: .ultimate, tags: .control)],
                 weapons: [Weapon(name: "Hyperspheres", range: .medium),
                           Weapon(name: "Accretion", range: .close)],
                 role: .tank, playstyle: .damageAbsorber, health: .init(300, shield: 100)),
            Hero(id: 32, name: "Echo",
                 abilities: [Ability(name: "Duplicate", kind: .ultimate, tags: .special)],
                 weapons: [Weapon(name: "Tri-Shot", range: .medium),
                           Weapon(name: "Sticky Bombs", range: .medium),
                           Weapon(name: "Focusing Beam", range: .close)],
                 role: .damage, playstyle: .assault, health: 200)
    ]
    
    public static func getHero(id: HeroId) -> Hero? {
        return Self.list.first {
            $0.id == id
        }
    }
    
    public static func getHeroes(role: Hero.Role) -> [Hero] {
        return list.filter {
            $0.role == role
        }
    }
}
