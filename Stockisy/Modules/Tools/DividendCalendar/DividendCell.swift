import UIKit

class DividendCell: UICollectionViewCell {
    static let id = "Cell"
    private var titleLabel: UILabel = {
        var view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var dividendlabel: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textAlignment = .right

        return view
    }()

    private var datelabel: UILabel = {
        var pricelabel = UILabel()
        pricelabel.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        pricelabel.font = .systemFont(ofSize: 14, weight: .regular)
        pricelabel.textAlignment = .right

        return pricelabel
    }()
    
    func setup(data: DividendCalendar) {
        setupViews()
        makeConstraints()
        backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        layer.cornerRadius = 16
        titleLabel.text = data.symbol
        if data.adjDividend != nil {
            dividendlabel.text = "$\(data.adjDividend!)"
        } else {
            dividendlabel.text = "$\(0)"
        }
        datelabel.text = data.label
    }

    private func setupViews() {
        addSubviews(titleLabel, dividendlabel, datelabel)
    }

    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.centerY).offset(-4)
        }

        dividendlabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.snp.centerY).offset(-4)
        }

        datelabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.snp.centerY).offset(4)
        }
    }
}
