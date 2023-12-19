import Foundation

extension String {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()

    var formattedDate: Date? {
        Self.formatter.date(from: self)
    }
}

extension Date {
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()

    var toReadableDateString: String? {
        Self.formatter.string(from: self)
    }
}
