import XCTest
@testable import OverAssistant

final class OverAssistantTests: XCTestCase {
    
    func testSelectorWithProfile() {
//        ProfileProvider().loadProfile(nickname: "Xogsnim", platform: .psn)
//        sleep(10)
//
//        guard let xogsnimProfile = ProfileStorage["Xogsnim"] else {
//            XCTFail()
//            return
//        }
        let availableHeroes = HeroList.list.map { $0.value }
        
        let enemies = [HeroList[.tracer],
                       HeroList[.mercy],
                       HeroList[.winston],
                       HeroList[.junkrat]]
        let allies = [HeroList[.soldier76],
                      HeroList[.roadhog],
                      HeroList[.dva]]
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
        
        print(HeroList.getHeroes(role: .support).map {$0.name} )
    }
    
    static var allTests = [
        ("testSelectorWithProfile", testSelectorWithProfile)
    ]
}
