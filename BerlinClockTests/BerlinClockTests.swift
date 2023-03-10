import XCTest

final class BerlinClockTests: XCTestCase {

    var clock: BerlinClockProtocol?

    // MARK: - Seconds

    // Given I have started the converter
    // When I enter 00:00:00
    // Then Y is returned for the seconds lamp
    func testSecondsLampEven() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
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
        guard let date = DateFormatters.timeFormat.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSeconds(), Light.off)
    }

    // MARK: - Five hours row

    func testFiveHoursRowLength() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow().count, 4)
    }

    // Given I have started the converter
    // When I enter 00:00:00
    // Then OOOO is returned for the five hours row
    func testFiveHoursRowAllOff() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then RRRR is returned for the five hours row
    func testFiveHoursRowAllOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.red, Light.red, Light.red])
    }

    // Given I have started the converter
    // When I enter 02:04:00
    // Then OOOO is returned for the five hours row
    func testFiveHoursRowNoLights() throws {
        guard let date = DateFormatters.timeFormat.date(from: "02:04:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 08:23:00
    // Then ROOO is returned for the five hours row
    func testFiveHoursRowSingleLightOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "08:23:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 16:35:00
    // Then RRRO is returned for the five hours row
    func testFiveHoursRowMultipleLightsOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "16:35:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveHourRow(), [Light.red, Light.red, Light.red, Light.off])
    }

    // MARK: - Single hours row

    func testSingleHoursRowLength() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow().count, 4)
    }

    // Given I have started the converter
    // When I enter 00:00:00
    // Then OOOO is returned for the single hours row
    func testSingleHoursRowAllOff() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then RRRO is returned for the single hours row
    func testSingleHoursRowMidnight() throws {
        guard let date = DateFormatters.timeFormat.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow(), [Light.red, Light.red, Light.red, Light.off])
    }

    // Given I have started the converter
    // When I enter 02:04:00
    // Then RROO is returned for the single hours row
    func testSingleHoursRowTwoLights() throws {
        guard let date = DateFormatters.timeFormat.date(from: "02:04:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow(), [Light.red, Light.red, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 08:23:00
    // Then RRRO is returned for the single hours row
    func testSingleHoursRowThreeLightOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "08:23:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow(), [Light.red, Light.red, Light.red, Light.off])
    }

    // Given I have started the converter
    // When I enter 14:35:00
    // Then RRRR is returned for the single hours row
    func testSingleHoursRowAllLightsOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "14:35:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleHourRow(), [Light.red, Light.red, Light.red, Light.red])
    }

    // MARK: - Five minutes row

    func testFiveMinutesRowLength() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow().count, 11)
    }

    // Given I have started the converter
    // When I enter 00:00:00
    // Then OOOOOOOOOOO is returned for the five minutes row
    func testFiveMinutesRowAllOff() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow(),
                       [Light.off, Light.off, Light.off, Light.off, Light.off, Light.off,
                        Light.off, Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then YYRYYRYYRYY is returned for the five minutes row
    func testFiveMinutesRowMidnight() throws {
        guard let date = DateFormatters.timeFormat.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow(),
                       [Light.yellow, Light.yellow, Light.red, Light.yellow, Light.yellow, Light.red,
                        Light.yellow, Light.yellow, Light.red, Light.yellow, Light.yellow])
    }

    // Given I have started the converter
    // When I enter 12:04:00
    // Then OOOOOOOOOOO is returned for the five minutes row
    func testFiveMinutesRowNoLights() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:04:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow(),
                       [Light.off, Light.off, Light.off, Light.off, Light.off, Light.off,
                        Light.off, Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 12:23:00
    // Then YYRYOOOOOOO is returned for the five minutes row
    func testFiveMinutesRowSingleRedLight() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:23:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow(),
                       [Light.yellow, Light.yellow, Light.red, Light.yellow, Light.off, Light.off,
                        Light.off, Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 12:35:00
    // Then YYRYYRYOOOO is returned for the five minutes row
    func testFiveMinutesRowMultipleRedLights() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:35:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFiveMinutesRow(),
                       [Light.yellow, Light.yellow, Light.red, Light.yellow, Light.yellow, Light.red,
                        Light.yellow, Light.off, Light.off, Light.off, Light.off])
    }

    // MARK: - Single minutes row

    func testSingleMinutesRowLength() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow().count, 4)
    }

    // Given I have started the converter
    // When I enter 00:00:00
    // Then OOOO is returned for the single minutes row
    func testSingleMinutesRowAllOff() throws {
        guard let date = DateFormatters.timeFormat.date(from: "00:00:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 23:59:59
    // Then YYYY is returned for the single minutes row
    func testSingleMinutesRowMidnight() throws {
        guard let date = DateFormatters.timeFormat.date(from: "23:59:59") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow(), [Light.yellow, Light.yellow, Light.yellow, Light.yellow])
    }

    // Given I have started the converter
    // When I enter 12:32:00
    // Then YYOO is returned for the single minutes row
    func testSingleMinutesRowTwoLights() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:32:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow(), [Light.yellow, Light.yellow, Light.off, Light.off])
    }

    // Given I have started the converter
    // When I enter 12:34:00
    // Then YYYY is returned for the single minutes row
    func testSingleMinutesRowFourLightsOn() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:34:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow(), [Light.yellow, Light.yellow, Light.yellow, Light.yellow])
    }

    // Given I have started the converter
    // When I enter 12:35:00
    // Then OOOO is returned for the single minutes row
    func testSingleMinutesRowFourLightsOff() throws {
        guard let date = DateFormatters.timeFormat.date(from: "12:35:00") else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getSingleMinutesRow(), [Light.off, Light.off, Light.off, Light.off])
    }

    // MARK: - Time formats
    func testTimeFormat1() throws {
        let input = "12:35:00"
        guard let date = DateFormatters.timeFormat.date(from: input) else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFormattedTime(), input)
    }

    func testTimeFormat2() throws {
        let input = "00:00:00"
        guard let date = DateFormatters.timeFormat.date(from: input) else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFormattedTime(), input)
    }

    func testTimeFormat3() throws {
        let input = "23:59:59"
        guard let date = DateFormatters.timeFormat.date(from: input) else {
            XCTFail("Error parsing date")
            return
        }
        clock = BerlinClock(date: date)
        XCTAssertEqual(clock?.getFormattedTime(), input)
    }
}
