import Foundation

struct BerlinClock {

    // Public properties

    let date: Date

    // Private properties

    private let calendar = Calendar.current
}

// MARK: - BerlinClockProtocol

extension BerlinClock: BerlinClockProtocol {

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

    func getFiveMinutesRow() -> [Light] {
        let totalNumberOfLightsInRow = 11
        let time = calendar.dateComponents([.minute], from: date)
        let fraction = (time.minute ?? 0) / 5
        let lightsOn = (0..<fraction).map { ($0 + 1) % 3 == 0 ? Light.red : Light.yellow }
        let lightsOff = [Light](repeating: .off, count: totalNumberOfLightsInRow - fraction)
        return lightsOn + lightsOff
    }

    func getSingleMinutesRow() -> [Light] {
        let totalNumberOfLightsInRow = 4
        let time = calendar.dateComponents([.minute], from: date)
        let remainder = (time.minute ?? 0) % 5
        let lightsOn = [Light](repeating: .yellow, count: remainder)
        let lightsOff = [Light](repeating: .off, count: totalNumberOfLightsInRow - remainder)
        return lightsOn + lightsOff
    }

    func getFormattedTime() -> String {
        return DateFormatters.timeFormat.string(from: date)
    }
}
