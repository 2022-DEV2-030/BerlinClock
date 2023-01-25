import Foundation

final class TimerService {

    @Published var timePublisher = Date()

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.timePublisher = Date()
        }
    }
}
