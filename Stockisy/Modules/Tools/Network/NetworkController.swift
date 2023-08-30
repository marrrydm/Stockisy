import UIKit

final class NetworkController {
    static let shared = NetworkController()
    private(set) var dividendCalendar = [DividendCalendar]()
    private var currencies = UserData.currencies
    private(set) var pairs = UserData.pairs

    private init() {
        getCalendar()
        getCurrencies()
    }

    private func getCurrencies() {
        let url = "http://api.apilayer.com/currency_data/live?currencies=EUR,AUD,GBP,CAD,JPY,NZD,CHF&apikey=uWjg948vH7YhiLuNAv12hEd8Jec7PWhQ"

        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                if let data = data {
                    if let currencyResponse = try? JSONDecoder().decode(CurrencyResponse.self, from: data) as CurrencyResponse {
                        currencyResponse.quotes.forEach({ currency in
                            self.currencies[String(currency.key.suffix(3))] = 1.0 / currency.value
                        })

                        UserDefaults.standard.set(self.currencies, forKey: UserData.SettingsKeys.currencies.rawValue)

                        self.pairs.keys.forEach { symbol in
                            let value = (self.currencies[String(symbol.prefix(3))] ?? 1.0) / (self.currencies[String(symbol.suffix(3))] ?? 1.0)
                            self.pairs[symbol] = round(value * 1000) / 1000.0
                        }

                        UserDefaults.standard.set(self.pairs, forKey: UserData.SettingsKeys.pairs.rawValue)
                    }
                }
            }.resume()
        }
    }

    private func getCalendar() {
        let year = Calendar.current.component(.year, from: Date())
        let month = Calendar.current.component(.month, from: Date())
        let day = Calendar.current.component(.day, from: Date())

        let url = "https://financialmodelingprep.com/api/v3/stock_dividend_calendar?from=\(year)-\(month)-\(day)&to=2023-08-30&apikey=6846c904049c9990f41d64326d555dc6"
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let data = data else { return }
                do {
                    let data_new = try JSONDecoder().decode([DividendCalendar].self, from: data)
                    self?.dividendCalendar = data_new
                } catch {
                    print("error: ", error)
                }
            }.resume()
        }
    }
}
