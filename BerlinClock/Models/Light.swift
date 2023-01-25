enum Light {
    case yellow, red, off
}

// MARK: - Identifiable

extension Light: Identifiable {
    var id: Self {
        return self
    }
}
