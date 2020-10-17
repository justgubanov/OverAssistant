import XCTest
@testable import OverAssistant

final class SynergyClassTests: XCTestCase {
    
    static var allTests = [
        ("testEquitability_exactlyTheSame", testEquitability_exactlyTheSame),
        ("testEquitability_theSameButDifferentInit", testEquitability_theSameButDifferentInit),
        ("testEquitability_exactlyTheSameButParametrised", testEquitability_exactlyTheSameButParametrised),
        ("testEquitability_different", testEquitability_different),
        ("testEquitability_differentStrength", testEquitability_differentStrength),
        ("testEquitability_differentStrengthLevels", testEquitability_differentStrengthLevels)
    ]
 
    func testEquitability_exactlyTheSame() {
        let firstSynergy: SynergyClass = .abilityBased(value: .undeniable)
        let sameSynergy: SynergyClass = .abilityBased(value: .undeniable)
        
        XCTAssertEqual(firstSynergy, sameSynergy, "Two instance of same type with same strength should be equal")
    }
    
    func testEquitability_theSameButDifferentInit() {
        let firstSynergy: SynergyClass = .abilityBased(value: .best(levels: nil))
        let sameSynergy: SynergyClass = .abilityBased(value: .best)
        
        XCTAssertEqual(firstSynergy, sameSynergy, "Two instance of same type with same strength should be equal")
    }
    
    func testEquitability_exactlyTheSameButParametrised() {
        let firstSynergy: SynergyClass = .abilityBased(value: .best(levels: 0...5000))
        let sameSynergy: SynergyClass = .abilityBased(value: .best(levels: 0...5000))
        
        XCTAssertEqual(firstSynergy, sameSynergy, "Two instance of same type with same strength should be equal")
    }
    
    func testEquitability_different() {
        let firstSynergy: SynergyClass = .playStyleBased(value: .undeniable)
        let sameSynergy: SynergyClass = .abilityBased(value: .undeniable)
        
        XCTAssertNotEqual(firstSynergy, sameSynergy, "Two instance of same type with different strength should NOT be equal")
    }
    
    func testEquitability_differentStrength() {
        let firstSynergy: SynergyClass = .abilityBased(value: .good)
        let sameSynergy: SynergyClass = .abilityBased(value: .undeniable)
        
        XCTAssertNotEqual(firstSynergy, sameSynergy, "Two instance of same type with different strength should NOT be equal")
    }
    
    func testEquitability_differentStrengthLevels() {
        let firstSynergy: SynergyClass = .abilityBased(value: .good(levels: 0...5000))
        let sameSynergy: SynergyClass = .abilityBased(value: .good(levels: 0...4000))
        
        XCTAssertNotEqual(firstSynergy, sameSynergy, "Two instance of same type with different strength should NOT be equal")
    }
}
