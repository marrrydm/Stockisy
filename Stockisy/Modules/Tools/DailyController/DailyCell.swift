import UIKit

class DailyCell: UICollectionViewCell {
    static let id = "Cell"
    private var titleLabel: UILabel = {
        var view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var dividendlabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .bold)
        view.textAlignment = .right

        return view
    }()

    private var s1Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "S1"

        return view
    }()

    private var s2Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "S2"

        return view
    }()

    private var s3Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "S3"

        return view
    }()

    private var r1Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "R1"

        return view
    }()

    private var r2Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "R2"

        return view
    }()

    private var r3Title: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.text = "R3"

        return view
    }()

    private var s1Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var s2Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var s3Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var r1Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var r2Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var r3Value: UILabel = {
        var view = UILabel()
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        return stackView
    }()

    func setup(str: String, data: Double) {
        setupViews()
        makeConstraints()
        backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        dividendlabel.text = "\(data)"
        titleLabel.text = str.prefix(3) + "/" + str.suffix(3)
        s3Value.text = String(format: "%.3f", (data - (data * Double.random(in: 0.05...0.10))))
        s2Value.text = String(format: "%.3f", (data - (data * Double.random(in: 0.03...0.05))))
        s1Value.text = String(format: "%.3f", (data - (data * Double.random(in: 0.01...0.03))))
        r3Value.text = String(format: "%.3f", (data + (data * Double.random(in: 0.05...0.10))))
        r2Value.text = String(format: "%.3f", (data + (data * Double.random(in: 0.03...0.05))))
        r1Value.text = String(format: "%.3f", (data + (data * Double.random(in: 0.01...0.03))))
    }

    private func setupViews() {
        addSubviews(titleLabel, dividendlabel, stackView1, stackView2)
        stackView1.addArrangedSubviews(s3Title, s2Title, s1Title, r1Title, r2Title, r3Title)
        stackView2.addArrangedSubviews(s3Value, s2Value, s1Value, r1Value, r2Value, r3Value)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.centerY).offset(-10)
        }

        dividendlabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.snp.centerY).offset(-10)
        }

        stackView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(self.snp.centerY).offset(4)
            make.height.equalTo(15)
        }

        stackView2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(12)
            make.top.equalTo(stackView1.snp.bottom).offset(4)
            make.height.equalTo(15)
        }
    }
}
