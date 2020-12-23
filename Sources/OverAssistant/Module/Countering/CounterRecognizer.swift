//
//  CounterRecognizer.swift
//
//
//  Created by Александр Губанов on 30.11.2020.
//

import Foundation

class CounterRecognizer {

    // TODO: Move records to CoreData
    private static var counterRecords: [CounterKey: CounterOption] = [
        CounterKey(.pharah, .tracer) : .playStyleAdvantage,
        CounterKey(.pharah, .reaper) : .skillRequiring,
        CounterKey(.widowmaker, .pharah) : .skillRequiring,

        CounterKey(.reinhardt, .widowmaker) : .playStyleAdvantage,
        CounterKey(.reaper, .reinhardt) : .skillRequiring,
        CounterKey(.pharah, .reinhardt) : .skillRequiring,

        CounterKey(.torbjorn, .tracer) : .playStyleAdvantage,
        CounterKey(.widowmaker, .torbjorn) : .skillRequiring,

        CounterKey(.hanzo, .torbjorn) : .skillRequiring,
        CounterKey(.tracer, .hanzo) : .skillRequiring,
        CounterKey(.widowmaker, .hanzo) : .playStyleAdvantage,

        CounterKey(.winston, .widowmaker) : .playStyleAdvantage,
        CounterKey(.reaper, .winston) : .skillRequiring,

        CounterKey(.tracer, .zenyatta) : .skillRequiring,
        CounterKey(.reaper, .zenyatta) : .skillRequiring,
        CounterKey(.winston, .zenyatta) : .skillRequiring,

        CounterKey(.bastion, .reinhardt) : .skillRequiring,
        CounterKey(.bastion, .winston) : .skillRequiring,
        CounterKey(.tracer, .bastion) : .playStyleAdvantage,
        CounterKey(.widowmaker, .bastion) : .playStyleAdvantage,
        CounterKey(.hanzo, .bastion) : .playStyleAdvantage,

        CounterKey(.pharah, .symmetra) : .skillRequiring,
        CounterKey(.winston, .symmetra) : .skillRequiring,

        CounterKey(.zarya, .torbjorn) : .skillRequiring,
        CounterKey(.reaper, .zarya) : .playStyleAdvantage,
        CounterKey(.pharah, .zarya) : .skillRequiring,
        CounterKey(.zenyatta, .zarya) : .playStyleAdvantage,
        CounterKey(.bastion, .zarya) : .playStyleAdvantage,

        CounterKey(.mccree, .tracer) : .skillRequiring,
        CounterKey(.mccree, .pharah) : .skillRequiring,
        CounterKey(.mccree, .mercy) : .playStyleAdvantage,
        CounterKey(.mccree, .symmetra) : .playStyleAdvantage,
        CounterKey(.widowmaker, .mccree) : .playStyleAdvantage,
        CounterKey(.winston, .mccree) : .playStyleAdvantage,

        CounterKey(.soldier76, .pharah) : .playStyleAdvantage,
        CounterKey(.soldier76, .torbjorn) : .skillRequiring,
        CounterKey(.soldier76, .bastion) : .playStyleAdvantage,
        CounterKey(.reinhardt, .soldier76) : .playStyleAdvantage,

        CounterKey(.mccree, .lucio) : .skillRequiring,

        CounterKey(.roadhog, .winston) : .skillRequiring,
        CounterKey(.roadhog, .bastion) : .playStyleAdvantage,
        CounterKey(.roadhog, .mccree) : .playStyleAdvantage,
        CounterKey(.roadhog, .soldier76) : .playStyleAdvantage,
        CounterKey(.roadhog, .lucio) : .playStyleAdvantage,
        CounterKey(.reaper, .roadhog) : .skillRequiring,
        CounterKey(.zarya, .roadhog) : .playStyleAdvantage,

        CounterKey(.junkrat, .tracer) : .playStyleAdvantage,
        CounterKey(.junkrat, .reaper) : .playStyleAdvantage,
        CounterKey(.junkrat, .reinhardt) : .skillRequiring,
        CounterKey(.junkrat, .torbjorn) : .skillRequiring,
        CounterKey(.junkrat, .bastion) : .playStyleAdvantage,
        CounterKey(.widowmaker, .junkrat) : .skillRequiring,
        CounterKey(.pharah, .junkrat) : .skillRequiring,
        CounterKey(.zarya, .junkrat) : .playStyleAdvantage,

        CounterKey(.dva, .widowmaker) : .skillRequiring,
        CounterKey(.dva, .pharah) : .playStyleAdvantage,
        CounterKey(.dva, .mercy) : .skillRequiring,
        CounterKey(.dva, .hanzo) : .skillRequiring,
        CounterKey(.dva, .bastion) : .playStyleAdvantage,
        CounterKey(.dva, .mccree) : .playStyleAdvantage,
        CounterKey(.reaper, .dva) : .playStyleAdvantage,
        CounterKey(.zarya, .dva) : .skillRequiring,
        CounterKey(.junkrat, .dva) : .playStyleAdvantage,

        CounterKey(.mei, .reinhardt) : .skillRequiring,
        CounterKey(.mei, .mccree) : .playStyleAdvantage,
        CounterKey(.mei, .roadhog) : .skillRequiring,
        CounterKey(.mei, .dva) : .playStyleAdvantage,
        CounterKey(.widowmaker, .mei) : .playStyleAdvantage,
        CounterKey(.pharah, .mei) : .playStyleAdvantage,
        CounterKey(.zarya, .mei) : .playStyleAdvantage,
        CounterKey(.lucio, .mei) : .playStyleAdvantage,

        CounterKey(.genji, .widowmaker) : .skillRequiring,
        CounterKey(.genji, .mercy) : .skillRequiring,
        CounterKey(.genji, .hanzo) : .skillRequiring,
        CounterKey(.genji, .bastion) : .playStyleAdvantage,
        CounterKey(.pharah, .genji) : .playStyleAdvantage,
        CounterKey(.winston, .genji) : .skillRequiring,
        CounterKey(.zarya, .genji) : .skillRequiring,

        CounterKey(.ana, .pharah) : .playStyleAdvantage,
        CounterKey(.ana, .torbjorn) : .playStyleAdvantage,
        CounterKey(.ana, .zenyatta) : .playStyleAdvantage,
        CounterKey(.ana, .bastion) : .playStyleAdvantage,
        CounterKey(.ana, .lucio) : .playStyleAdvantage,
        CounterKey(.winston, .ana) : .playStyleAdvantage,

        CounterKey(.sombra, .tracer) : .skillRequiring,
        CounterKey(.sombra, .reinhardt) : .playStyleAdvantage,
        CounterKey(.sombra, .zenyatta) : .playStyleAdvantage,
        CounterKey(.sombra, .symmetra) : .playStyleAdvantage,
        CounterKey(.sombra, .lucio) : .playStyleAdvantage,
        CounterKey(.sombra, .dva) : .playStyleAdvantage,
        CounterKey(.reaper, .sombra) : .playStyleAdvantage,
        CounterKey(.hanzo, .sombra) : .playStyleAdvantage,
        CounterKey(.mccree, .sombra) : .playStyleAdvantage,
        CounterKey(.roadhog, .sombra) : .playStyleAdvantage,
        CounterKey(.junkrat, .sombra) : .playStyleAdvantage,

        CounterKey(.orisa, .widowmaker) : .playStyleAdvantage,
        CounterKey(.orisa, .torbjorn) : .playStyleAdvantage,
        CounterKey(.reaper, .orisa) : .playStyleAdvantage,
        CounterKey(.hanzo, .orisa) : .playStyleAdvantage,
        CounterKey(.genji, .orisa) : .playStyleAdvantage,

        CounterKey(.doomfist, .reinhardt) : .playStyleAdvantage,
        CounterKey(.doomfist, .dva) : .playStyleAdvantage,
        CounterKey(.doomfist, .genji) : .playStyleAdvantage,
        CounterKey(.pharah, .doomfist) : .skillRequiring,
        CounterKey(.mccree, .doomfist) : .playStyleAdvantage,
        CounterKey(.soldier76, .doomfist) : .playStyleAdvantage,
        CounterKey(.sombra, .doomfist) : .skillRequiring,
        CounterKey(.orisa, .doomfist) : .playStyleAdvantage,

        CounterKey(.moira, .reinhardt) : .playStyleAdvantage,
        CounterKey(.moira, .orisa) : .playStyleAdvantage,
        CounterKey(.dva, .moira) : .playStyleAdvantage,
        CounterKey(.ana, .moira) : .playStyleAdvantage,

        CounterKey(.brigitte, .tracer) : .playStyleAdvantage,
        CounterKey(.brigitte, .reinhardt) : .playStyleAdvantage,
        CounterKey(.brigitte, .dva) : .playStyleAdvantage,
        CounterKey(.brigitte, .genji) : .playStyleAdvantage,
        CounterKey(.pharah, .brigitte) : .skillRequiring,
        CounterKey(.junkrat, .brigitte) : .playStyleAdvantage,
        CounterKey(.sombra, .brigitte) : .playStyleAdvantage,

        CounterKey(.wreckingBall, .widowmaker) : .playStyleAdvantage,
        CounterKey(.reaper, .wreckingBall) : .playStyleAdvantage,
        CounterKey(.roadhog, .wreckingBall) : .playStyleAdvantage,
        CounterKey(.mei, .wreckingBall) : .playStyleAdvantage,
        CounterKey(.ana, .wreckingBall) : .playStyleAdvantage,
        CounterKey(.sombra, .wreckingBall) : .skillRequiring,
        CounterKey(.brigitte, .wreckingBall) : .skillRequiring,
    ]

    static func estimate(_ hero: Hero, countering otherHero: Hero) -> CounterOption? {
        let record = CounterKey(hero.id, otherHero.id)
        return counterRecords[record]
    }
}
