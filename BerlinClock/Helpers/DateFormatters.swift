import Foundation

enum DateFormatters {

    // MARK: - Public properties

    static let timeFormat: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "HH:mm:ss"
        return result
    }()
}
