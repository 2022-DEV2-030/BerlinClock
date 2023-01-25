import Foundation
import Combine

class ClockViewModel: ObservableObject {

    @Published var timeString = ""
    @Published var secondsLight = Light.off
    @Published var fiveHoursLights = [Light](repeating: .off, count: 4)
    @Published var singleHoursLights = [Light](repeating: .off, count: 4)
    @Published var fiveMinutesLights = [Light](repeating: .off, count: 11)
    @Published var singleMinutesLights = [Light](repeating: .off, count: 4)

    private let timerService = TimerService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        timerService
            .$timePublisher
            .sink { [weak self] date in
                let berlinClock = BerlinClock(date: date)
                self?.secondsLight = berlinClock.getSeconds()
                self?.fiveHoursLights = berlinClock.getFiveHourRow()
                self?.singleHoursLights = berlinClock.getSingleHourRow()
                self?.fiveMinutesLights = berlinClock.getFiveMinutesRow()
                self?.singleMinutesLights = berlinClock.getSingleMinutesRow()
                self?.timeString = berlinClock.getFormattedTime()
            }
            .store(in: &cancellables)
    }
}
