import Foundation

extension String {

    func format(withFormat format: String = "dd MMMM yyyy\nHH:mm") -> String {
        guard let date = self.toDate() else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    private func toDate() -> Date? {
        var strDate = self
        strDate.removeLast()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.date(from: strDate)
    }
}
