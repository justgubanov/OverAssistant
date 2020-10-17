import XCTest
@testable import OverAssistant

final class ScoringTests: XCTestCase {
    
    static var allTests = [
        ("testSelectorWithProfile", testSelectorWithProfile)
    ]
    
    func testSelectorWithProfile() {
//        ProfileProvider().loadProfile(nickname: "Xogsnim", platform: .psn)
//        sleep(10)
//
//        guard let xogsnimProfile = ProfileStorage["Xogsnim"] else {
//            XCTFail()
//            return
//        }
        let availableHeroes = HeroProvider.list
        
        let enemies = [HeroProvider.getHero(id: .tracer)!,
                       HeroProvider.getHero(id: .mercy)!,
                       HeroProvider.getHero(id: .winston)!,
                       HeroProvider.getHero(id: .junkrat)!]
        let allies = [HeroProvider.getHero(id: .wreckingBall)!,
                      HeroProvider.getHero(id: .roadhog)!,
                      HeroProvider.getHero(id: .widowmaker)!,
                      HeroProvider.getHero(id: .moira)!]
        let searchedRole: Hero.Role? = .damage
        
        
        var heroesScores: [Hero: PickScore] = [:]
        let scoringBackground = ScoringBackground(allies: allies,
                                                  enemies: enemies,
//                                                  targetProfile: xogsnimProfile,
                                                  conditions: GameConditions(map: nil, offenseSide: .symmetrical))
        
        for hero in availableHeroes {
            guard !allies.contains(hero) else {
                continue
            }
            if let searchedRole = searchedRole,
               hero.role != searchedRole {
                continue
            }
            let score = Scoring(of: hero, in: scoringBackground).result
            
            heroesScores.updateValue(score, forKey: hero)
        }
        
        let sortedByScore = heroesScores.sorted { firstPick, secondPick in
            firstPick.value.value > secondPick.value.value
        }
        let topFive = sortedByScore.prefix(5)
        for (hero, score) in topFive {
            print(hero.name, score.value, score.sequence[.dps] ?? 0)
        }
        
        print(HeroProvider.getHeroes(role: .support).map {$0.name} )
    }
}
