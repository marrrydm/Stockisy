import UIKit

class BankCell: UICollectionViewCell {
    static let id = "Cell"
    private let imgView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill

        return view
    }()

    private var titleLabel: UILabel = {
        var view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.textColor = .white
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var subtitleLabel: UILabel = {
        var view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var currentLabel: UILabel = {
        var view = UILabel()
        view.text = "Current rate".localize()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var nextLabel: UILabel = {
        var view = UILabel()
        view.text = "Next Meeting".localize()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var lastLabel: UILabel = {
        var view = UILabel()
        view.text = "last Change".localize()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private var currentLabelVal: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var nextLabelVal: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private var lastLabelVal: UILabel = {
        var view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 12, weight: .semibold)
        view.textAlignment = .center

        return view
    }()

    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing

        return stackView
    }()

    func setup(data: BankModel) {
        setupViews()
        makeConstraints()

        if data.subtitle == "(CBR)".localize() {
            titleLabel.snp.makeConstraints { make in
                make.leading.equalTo(imgView.snp.trailing).offset(12)
                make.bottom.equalTo(imgView.snp.centerY).offset(2)
            }

            subtitleLabel.snp.makeConstraints { make in
                make.leading.equalTo(imgView.snp.trailing).offset(12)
                make.top.equalTo(imgView.snp.centerY).offset(6)
            }
        } else {
            titleLabel.snp.makeConstraints { make in
                make.leading.equalTo(imgView.snp.trailing).offset(12)
                make.centerY.equalTo(imgView.snp.centerY)
            }

            subtitleLabel.snp.makeConstraints { make in
                make.leading.equalTo(titleLabel.snp.trailing).offset(4)
                make.centerY.equalTo(imgView.snp.centerY)
            }
        }

        backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        imgView.image = UIImage(named: data.img)
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        currentLabelVal.text = data.percent
        nextLabelVal.text = data.nextMeet
        lastLabelVal.text = data.lastMeet
    }

    private func setupViews() {
        addSubviews(titleLabel, imgView, subtitleLabel, stackView1, currentLabelVal, nextLabelVal, lastLabelVal)
        stackView1.addArrangedSubviews(currentLabel, nextLabel, lastLabel)
    }

    private func makeConstraints() {
        imgView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(17)
            make.width.equalTo(24)
        }

        stackView1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.snp.centerY).offset(4)
            make.height.equalTo(15)
        }

        currentLabelVal.snp.makeConstraints { make in
            make.centerX.equalTo(currentLabel.snp.centerX)
            make.top.equalTo(currentLabel.snp.bottom).offset(4)
        }

        nextLabelVal.snp.makeConstraints { make in
            make.centerX.equalTo(nextLabel.snp.centerX)
            make.top.equalTo(nextLabel.snp.bottom).offset(4)
        }

        lastLabelVal.snp.makeConstraints { make in
            make.centerX.equalTo(lastLabel.snp.centerX)
            make.top.equalTo(lastLabel.snp.bottom).offset(4)
        }
    }
}
