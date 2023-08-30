import UIKit

class SettingsController: UIViewController {
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "tabbar.settings".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private lazy var privacyView: UIView = {
        let privacyView = UIView()
        privacyView.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        privacyView.layer.cornerRadius = 16
        privacyView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        privacyView.isUserInteractionEnabled = true
        privacyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(policyAction)))

        return privacyView
    }()

    private let privacyViewLabel: UILabel = {
        let privacyViewLabel = UILabel()
        privacyViewLabel.textColor = .white
        privacyViewLabel.text = "account.policy".localize()
        privacyViewLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        return privacyViewLabel
    }()

    private let privacyImg = UIImageView(image: UIImage(named: "right"))

    private lazy var termsView: UIView = {
        let termsView = UIView()
        termsView.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        termsView.layer.cornerRadius = 16
        termsView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        termsView.isUserInteractionEnabled = true
        termsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(termsAction)))

        return termsView
    }()

    private let termsViewLabel: UILabel = {
        let termsViewLabel = UILabel()
        termsViewLabel.textColor = .white
        termsViewLabel.text = "account.terms".localize()
        termsViewLabel.font = .systemFont(ofSize: 16, weight: .semibold)

        return termsViewLabel
    }()

    private let termsImg = UIImageView(image: UIImage(named: "right"))

    private let iconPolicy: UIImageView = {
        let iconPolicy = UIImageView()
        iconPolicy.image = UIImage(named: "policy")

        return iconPolicy
    }()

    private let iconTerms: UIImageView = {
        let iconTerms = UIImageView()
        iconTerms.image = UIImage(named: "terms")

        return iconTerms
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        view.addSubviews(titleLabel, privacyView, termsView)

        privacyView.addSubviews(privacyViewLabel, privacyImg, iconPolicy)
        termsView.addSubviews(termsViewLabel, termsImg, iconTerms)

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
        }

        privacyView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }

        iconPolicy.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        privacyViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconPolicy.snp.trailing).offset(12)
        }

        privacyImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }

        termsView.snp.makeConstraints { make in
            make.top.equalTo(privacyView.snp.bottom).offset(1)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }

        iconTerms.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        termsViewLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconTerms.snp.trailing).offset(12)
        }

        termsImg.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(24)
        }
    }
}

extension SettingsController {
    @objc private func policyAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/3bc53007-2582-467d-a420-860339791bb1"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @objc private func termsAction() {
        if let url = URL(string: "https://www.freeprivacypolicy.com/live/dfce9399-8ecc-4aee-a65f-6f5dde38b810"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
