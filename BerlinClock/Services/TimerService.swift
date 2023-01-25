import Foundation

final class TimerService {

    @Published var timePublisher = Date()

    // MARK: - Init

    init() {
        publish()
    }
}

// MARK: - Private methods

private extension TimerService {
    func publish() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.timePublisher = Date()
            self?.publish()
        }
    }
}
