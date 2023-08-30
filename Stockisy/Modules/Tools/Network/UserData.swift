import Foundation

final class UserData {

    public enum SettingsKeys: String, CaseIterable {
        case currencies
        case pairs
    }

    static var currencies: [String: Double] {
        get {
            if let saved = UserDefaults.standard.object(forKey: SettingsKeys.currencies.rawValue) as? [String: Double] {
                return saved
            }

            return [
                "EUR": 1.09,
                "USD": 1.0,
                "AUD": 0.68,
                "GBP": 1.28,
                "CAD": 0.76,
                "JPY": 0.0070,
                "NZD": 0.62,
                "CHF": 1.12
            ]
        }
    }

    static var pairs: [String: Double] {
        get {
            if let saved = UserDefaults.standard.object(forKey: SettingsKeys.pairs.rawValue) as? [String: Double] {
                return saved
            }

            return [
                "EURUSD": 0.0,
                "AUDUSD": 0.0,
                "GBPUSD": 0.0,
                "EURGBP": 0.0,
                "CADJPY": 0.0,
                "NZDJPY": 0.0,
                "USDJPY": 0.0,
                "EURCHF": 0.0,
                "EURJPY": 0.0,
                "USDCAD": 0.0,
                "USDCHF": 0.0,
                "GBPAUD": 0.0,
                "NZDUSD": 0.0,
                "AUDCAD": 0.0,
                "AUDCHF": 0.0,
                "AUDJPY": 0.0
            ]
        }
    }
}
