//
//  SynergyRecognizer.swift
//
//
//  Created by Александр Губанов on 17.10.2020.
//

import Foundation

class SynergyRecognizer {
    
    // TODO: Move records to CoreData
    private static var synergyRecords: [SynergyKey: [SynergyOption]] = [
        SynergyKey(.reinhardt, .reaper)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.mercy, .pharah)! : [.abilityBased(strength: .good)],
        SynergyKey(.mercy, .reinhardt)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.torbjorn, .reinhardt)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.winston, .tracer)! : [.abilityBased(strength: .good)],
        SynergyKey(.winston, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.winston, .torbjorn)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.zenyatta, .tracer)! : [.abilityBased(strength: .good)],
        SynergyKey(.zenyatta, .pharah)! : [.abilityBased(strength: .good)],
        SynergyKey(.zenyatta, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.zenyatta, .winston)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.bastion, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.bastion, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.bastion, .zenyatta)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.symmetra, .torbjorn)! : [.abilityBased(strength: .good)],
        SynergyKey(.symmetra, .bastion)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.zarya, .tracer)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .reaper)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .pharah)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .hanzo)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .winston)! : [.abilityBased(strength: .good)],
        SynergyKey(.zarya, .bastion)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.mccree, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.mccree, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.mccree, .zenyatta)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.soldier76, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.soldier76, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.soldier76, .winston)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.lucio, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.lucio, .winston)! : [.abilityBased(strength: .good)],
        SynergyKey(.lucio, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.lucio, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.lucio, .mccree)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.roadhog, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.roadhog, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.roadhog, .zarya)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.junkrat, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.junkrat, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.junkrat, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.junkrat, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.junkrat, .lucio)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.dva, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.dva, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.dva, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.dva, .soldier76)! : [.abilityBased(strength: .good)],
        SynergyKey(.dva, .lucio)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.genji, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.genji, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.genji, .soldier76)! : [.abilityBased(strength: .good)],
        SynergyKey(.genji, .lucio)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.ana, .reaper)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .pharah)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .winston)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .roadhog)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .junkrat)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .dva)! : [.abilityBased(strength: .good)],
        SynergyKey(.ana, .genji)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.sombra, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.sombra, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.sombra, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.sombra, .roadhog)! : [.abilityBased(strength: .good)],
        SynergyKey(.sombra, .mei)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.orisa, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .torbjorn)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .symmetra)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .soldier76)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.orisa, .ana)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.doomfist, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.doomfist, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.doomfist, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.doomfist, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.doomfist, .mei)! : [.abilityBased(strength: .good)],
        SynergyKey(.doomfist, .ana)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.moira, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .roadhog)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .junkrat)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .dva)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .genji)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .sombra)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .orisa)! : [.abilityBased(strength: .good)],
        SynergyKey(.moira, .doomfist)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.brigitte, .reaper)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .winston)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .mccree)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .junkrat)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .dva)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .genji)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .ana)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .sombra)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .orisa)! : [.abilityBased(strength: .good)],
        SynergyKey(.brigitte, .doomfist)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.wreckingBall, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .roadhog)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .ana)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .moira)! : [.abilityBased(strength: .good)],
        SynergyKey(.wreckingBall, .brigitte)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.ashe, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .mercy)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .zenyatta)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .lucio)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .mei)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .ana)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .moira)! : [.abilityBased(strength: .good)],
        SynergyKey(.ashe, .brigitte)! : [.abilityBased(strength: .good)],
        
        SynergyKey(.baptiste, .reinhardt)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .winston)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .bastion)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .zarya)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .mccree)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .soldier76)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .roadhog)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .junkrat)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .dva)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .genji)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .sombra)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .orisa)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .doomfist)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .brigitte)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .wreckingBall)! : [.abilityBased(strength: .good)],
        SynergyKey(.baptiste, .ashe)! : [.abilityBased(strength: .good)],
    ]
    
    static func getSynergy(between firstHero: Hero, and secondHero: Hero) -> [SynergyOption]? {
        guard let record = SynergyKey(firstHero.id, secondHero.id) else {
            return nil
        }
        return synergyRecords[record]
    }
}
