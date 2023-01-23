import Foundation

struct BerlinClock: BerlinClockProtocol {

    // Public properties

    let date: Date

    // Private properties

    private let calendar = Calendar.current

    // Public methods

    func getSeconds() -> Light {
        let time = calendar.dateComponents([.second], from: date)
        return (time.second ?? 0) % 2 == 0 ? .yellow : .off
    }

    func getFiveHourRow() -> [Light] {
        let totalNumberOfLightsInRow = 4
        let time = calendar.dateComponents([.hour], from: date)
        let fraction = (time.hour ?? 0) / 5
        let lightsOn = [Light](repeating: .red, count: fraction)
        let lightsOff = [Light](repeating: .off, count: totalNumberOfLightsInRow - fraction)
        return lightsOn + lightsOff
    }

    func getSingleHourRow() -> [Light] {
        let totalNumberOfLightsInRow = 4
        let time = calendar.dateComponents([.hour], from: date)
        let remainder = (time.hour ?? 0) % 5
        let lightsOn = [Light](repeating: .red, count: remainder)
        let lightsOff = [Light](repeating: .off, count: totalNumberOfLightsInRow - remainder)
        return lightsOn + lightsOff
    }
}
