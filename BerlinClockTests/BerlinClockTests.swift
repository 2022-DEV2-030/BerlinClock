import XCTest

final class BerlinClockTests: XCTestCase {

    var clock: BerlinClockProtocol?

    let dateFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "HH:mm:ss"
        result.timeZone = TimeZone(abbreviation: "UTC")
        return result
    }()

    // Given I have started the converter
    // When I enter 00:00:00
    // Then Y is returned for the seconds lamp
    func testSecondsLampEven() throws {
        guard let date = dateFormatter.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSeconds(), Light.yellow)
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then O is returned for the seconds lamp
    func testSecondsLampOdd() throws {
        guard let date = dateFormatter.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSeconds(), Light.off)
    }
}
