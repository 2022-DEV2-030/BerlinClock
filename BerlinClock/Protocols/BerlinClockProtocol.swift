import Foundation

protocol BerlinClockProtocol {
    func getSeconds() -> Light
    func getFiveHourRow() -> [Light]
    func getSingleHourRow() -> [Light]
    func getFiveMinutesRow() -> [Light]
}
