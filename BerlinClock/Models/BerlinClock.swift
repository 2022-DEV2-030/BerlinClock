import Foundation

struct BerlinClock: BerlinClockProtocol {

    let date: Date

    private let calendar = Calendar.current

    func getSeconds() -> Light {
        let time = calendar.dateComponents([.second], from: date)
        return (time.second ?? 0) % 2 == 0 ? .yellow : .off
    }
}
