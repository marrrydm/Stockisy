import UIKit

class LessonController: UIViewController, UIScrollViewDelegate {
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.isUserInteractionEnabled = true

        return view
    }()
    
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "left")
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pop)))

        return view
    }()

    private let labelTitleLarge: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 28, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let viewBlue: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)

        return view
    }()

    private let labelBlue: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let labelMain1: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let labelMain2: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var lessonsArray: [(String, String, String, String, Int)] = [
        ("Introduction to Trading Basics: Navigating the Financial Markets",
         """
         Embarking on a journey into the realm of financial markets holds immense promise, but it's imperative to grasp the fundamental tenets before embarking. This guide serves as a compass for novices, elucidating core concepts crucial for a nascent understanding of trading dynamics.
         """,
         """
         1. Decoding Market Dynamics: Financial markets orchestrate the trade of diverse assets like stocks, currencies, and commodities. Each market operates under distinct influences—ranging from supply-demand dynamics to economic indicators and geopolitical nuances.
         2. Unveiling Trading Styles: Trading styles come in an array of flavors: day trading for swift gains, swing trading for short-term holds, and long-term investing for the strategic mind. Opt for a style in harmony with your risk appetite and lifestyle.
         3. Brokers and Platforms: Trading necessitates a brokerage conduit. Brokers act as intermediaries, bridging the trader-market divide. The selection process warrants vigilance—opt for reputable brokers housing user-centric trading platforms aligned with your requisites.
         4. Cognizing Risk Management: Trading inherently carries risk. Prudent risk management is cardinal. Confining investments within manageable thresholds and delineating stop-loss and take-profit benchmarks mitigate potential losses.
         5. Insightful Market Analysis: The trader's arsenal encompasses two pivotal analysis strands: fundamental and technical. Fundamental analysis revolves around gauging economic indicators, news, and events influencing asset values. On the flip side, technical analysis mines price charts, patterns, and indicators to project future price trajectories.
         6. Constructing Trading Blueprints: The cornerstone of success lies in meticulous planning. A trading blueprint encapsulates aspirations, risk tolerance, and strategies. It functions as a compass, aiding in rationale-driven decision-making and circumventing impulsive actions.
         7. Harmonizing Trading Psyche: The emotional facet significantly influences trading outcomes. Cultivating discipline, managing emotions, and exuding patience are tantamount to triumph.
         8. Prelude via Demo Trading: Prior to real-money engagements, simulating trades on a demo account affords invaluable practice. This incubation phase facilitates learning and refining strategies sans jeopardizing capital.
         9. Initiating with Caution: Embark with a modest investment. Gradually amplify positions as proficiency and confidence burgeon.
         10. Eternal Learning Quest: Financial markets are a perpetually evolving ecosystem. Staying attuned to financial news, market shifts, and novel trading tactics fuels the trajectory of knowledge enhancement.
         """,
         "Bear in mind that trading mandates devotion, ceaseless learning, and persistence. Commence with a strong edifice and methodically fortify your acumen and prowess over time. Accumulating experience positions you favorably to navigate the intricate tapestry of trading and execute sagacious decisions.", 0),

        ("How to Choose Dividend Stocks for Your Portfolio",
         """
         Choosing dividend stocks is a crucial decision for investors seeking a reliable source of passive income. Dividends are a portion of a company's earnings distributed to shareholders, making them an attractive option for those looking to build wealth over time. Here's a guide on how to choose dividend stocks wisely to enhance your investment portfolio.
         """,
         """
         1. Research Dividend History: Before investing, research a company's dividend history. Consistent dividend payments over several years indicate financial stability and a commitment to rewarding shareholders.
         2. Dividend Yield: Dividend yield represents the annual dividend income relative to the stock price. A higher yield isn't always better, as it could indicate an unstable financial position. Aim for a balance between a reasonable yield and a financially strong company.
         3. Payout Ratio: The dividend payout ratio measures the proportion of earnings paid out as dividends. A sustainable payout ratio is generally below 75% to ensure the company retains enough earnings for growth.
         4. Earnings Growth: Look for companies with a history of steady earnings growth. A growing business is more likely to maintain or increase dividend payments.
         5. Industry and Market Trends: Consider the industry's outlook and the company's position within it. Companies in stable or growing industries are more likely to sustain dividends.
         6. Dividend Aristocrats: Dividend aristocrats are companies that have consistently increased dividends for a minimum number of years (usually 25). They tend to be well-established and reliable choices.
         7. Company Debt: Assess a company's debt level. Excessive debt could strain finances, impacting the ability to maintain dividends.
         8. Management Stability: Effective management plays a role in a company's success. A well-led company is more likely to make prudent decisions about dividend payments.
         9. Market Capitalization: Larger, established companies often have the financial stability to sustain dividends. Smaller companies might be riskier in this regard.
         10. Diversification: Don't rely solely on dividend stocks; diversify your portfolio. This ensures your investment strategy isn't overly reliant on dividends alone.
         11. Tax Considerations: Dividend taxation varies by country. Research tax implications to understand how dividends affect your overall return.
         12. Long-Term Perspective: Dividend investing is a long-term strategy. The benefits of compounding and consistent income take time to materialize.
         """,
         "In conclusion, choosing dividend stocks requires thorough research and a focus on long-term growth. A combination of financial health, historical performance, and market trends should guide your decision. By carefully selecting dividend stocks, you can build a resilient portfolio that generates passive income while fostering long-term wealth accumulation.", 1),
        ("How to Choose Dividend Stocks for Your Portfolio",
         """
         Choosing dividend stocks is a crucial decision for investors seeking a reliable source of passive income. Dividends are a portion of a company's earnings distributed to shareholders, making them an attractive option for those looking to build wealth over time. Here's a guide on how to choose dividend stocks wisely to enhance your investment portfolio.
         """,
         """
         Definition of Daily Pivot Points:
         
         Daily Pivot Points are a set of price levels that act as potential areas of support and resistance within a trading day. They are calculated using the high, low, and closing prices from the previous trading day. The primary pivot point serves as a reference point, while additional support and resistance levels are derived from it.

         Calculation:

         1. Pivot Point (PP): (High + Low + Close) / 3
         2. Support 1 (S1): (2 * PP) - High
         3. Support 2 (S2): PP - (High - Low)
         4. Resistance 1 (R1): (2 * PP) - Low
         5. Resistance 2 (R2): PP + (High - Low)

         Significance in Trading:

         1. Identifying Support and Resistance: Pivot Points help traders identify potential support and resistance levels. These levels indicate where the price might reverse, making them valuable for entry and exit points.
         2. Range Bound vs. Trending Markets: In range-bound markets, price tends to fluctuate between pivot support and resistance levels. In trending markets, pivot points can act as confirmation for trend continuation or reversal.
         3. Intraday Trading: Traders often use Pivot Points for intraday trading. Price movement around these levels provides insights into market sentiment and potential breakout points.
         4. Confirmation with Indicators: Pivot Points can be used in conjunction with other technical indicators to confirm trading signals and increase the accuracy of predictions.
         5. Scalping Strategies: Short-term traders, known as scalpers, use Pivot Points to identify quick trading opportunities within tight price ranges.
         6. Day Trading: Day traders utilize Pivot Points to determine potential high and low points for the trading day. These levels guide their trading decisions.
         7. Stop Loss Placement: Pivot Points assist traders in placing stop loss orders. A break below a support level or above a resistance level may indicate a change in market direction.

         Variations:

         1. Fibonacci Pivot Points: Pivot Points can be combined with Fibonacci retracement levels to enhance accuracy.
         2. Camarilla Pivot Points: This variation includes more support and resistance levels, offering a wider range of potential price targets.
         3. Woodie's Pivot Points: This method uses a different formula to calculate the pivot point and its associated levels.
         """,
         "In conclusion, Daily Pivot Points provide traders with valuable insights into potential price movements and areas of support and resistance. By incorporating Pivot Points into your trading strategy, you can make more informed decisions and improve your trading success. However, like any technical tool, Pivot Points should be used alongside other analysis techniques for a comprehensive trading approach.", 2)
    ]

    private var numberSection = 0

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.layoutIfNeeded()
        scrollView.updateContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        scrollView.delegate = self
        view.addSubviews(scrollView, labelTitle, imgView)

        scrollView.addSubviews(labelTitleLarge, viewBlue, labelBlue, labelMain1, labelMain2)

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
        })

        imgView.snp.makeConstraints({ make in
            make.centerY.equalTo(labelTitle.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        })

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(12)
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }

        labelTitleLarge.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.top).offset(5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        })

        viewBlue.snp.makeConstraints({ make in
            make.top.equalTo(labelTitleLarge.snp.bottom).offset(16)
            make.bottom.equalTo(labelBlue.snp.bottom).offset(2)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.width.equalTo(2)
        })

        labelBlue.snp.makeConstraints({ make in
            make.top.equalTo(viewBlue.snp.top).offset(2)
            make.leading.equalTo(viewBlue.snp.trailing).offset(9)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
        })

        labelMain1.snp.makeConstraints({ make in
            make.top.equalTo(viewBlue.snp.bottom).offset(21)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        })

        labelMain2.snp.makeConstraints({ make in
            make.top.equalTo(labelMain1.snp.bottom).offset(12)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        })
    }
}

extension LessonController {
    @objc private func pop() {

        var savedNumbers = UserDefaults.standard.array(forKey: "arrLessons") as? [Int]
        let old = savedNumbers
        savedNumbers?.removeAll(where: { $0 == numberSection })
        if savedNumbers != old {
            UserDefaults.standard.set(savedNumbers, forKey: "arrLessons")
            var score = UserDefaults.standard.integer(forKey: "score")
            score += 200
            UserDefaults.standard.set(score, forKey: "score")

            if numberSection == 2 {
                if UserDefaults.standard.integer(forKey: "score3") == 0 {
                    UserDefaults.standard.set(200, forKey: "score3")
                }
            } else if numberSection == 3 {
                if UserDefaults.standard.integer(forKey: "score4") == 0 {
                    UserDefaults.standard.set(200, forKey: "score4")
                }
            } else {
                if UserDefaults.standard.integer(forKey: "score5") == 0 {
                    UserDefaults.standard.set(200, forKey: "score5")
                }
            }
        }

        navigationController?.popViewController(animated: false)
    }
}

extension LessonController: EduDelegate {
    func updateEdu(title: String, num: Int, numSection: Int) {
        numberSection = numSection
        labelTitle.text = title
        switch num {
        case 0:
            labelTitleLarge.text = lessonsArray[0].0
            labelBlue.text = lessonsArray[0].1
            labelMain1.text = lessonsArray[0].2
            labelMain2.text = lessonsArray[0].3
        case 1:
            labelTitleLarge.text = lessonsArray[1].0
            labelBlue.text = lessonsArray[1].1
            labelMain1.text = lessonsArray[1].2
            labelMain2.text = lessonsArray[1].3
        case 2:
            labelTitleLarge.text = lessonsArray[2].0
            labelBlue.text = lessonsArray[2].1
            labelMain1.text = lessonsArray[2].2
            labelMain2.text = lessonsArray[2].3
        default: break
        }
    }
}
