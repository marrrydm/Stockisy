import Foundation

struct DividendCalendar: Decodable {
    let date, label: String
    let adjDividend: Double?
    let symbol: String
    let dividend: Double?
    let recordDate, paymentDate, declarationDate: String?
}

struct CurrencyResponse: Codable {
    var quotes: [String: Double]
}
