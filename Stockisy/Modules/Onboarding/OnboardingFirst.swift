import AppsFlyerLib
import AppTrackingTransparency
import FirebaseAnalytics
import SnapKit
import UIKit

class OnboardingFirst: UIViewController {
    private let bgView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "view")
        view.contentMode = .scaleToFill

        return view
    }()

    private let logoView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let labelTitle: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let contentLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0.815, green: 0.833, blue: 0.85, alpha: 1)
        view.font = .systemFont(ofSize: 15, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("onboarding.nextButton".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        
        return nextButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        setupViews()
        makeConstraints()

        logoView.image = OnboardingViewModel.init().items?[0].images[0]
        labelTitle.text = OnboardingViewModel.init().items?[0].title
        contentLabel.text = OnboardingViewModel.init().items?[0].content
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppsFlyerLib.shared().logEvent("onboarding_start", withValues: nil)
        Analytics.logEvent("onboarding_start", parameters: nil)

        ATTrackingManager.requestTrackingAuthorization { status in
            switch status {
            case .authorized:
                print("The user has granted access.")
            case .denied, .restricted:
                print("The user has denied access.")
            case .notDetermined:
                print("The user has not yet received an authorization request.")
            @unknown default:
                break
            }
        }
    }

    private func setupViews() {
        view.addSubviews(bgView, nextButton)
        bgView.addSubviews(logoView, labelTitle, contentLabel)
    }

    private func makeConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        logoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(272)
            make.bottom.equalTo(labelTitle.snp.top).offset(-80)
        }

        labelTitle.snp.makeConstraints { make in
            make.bottom.equalTo(contentLabel.snp.top).offset(-12)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        contentLabel.snp.makeConstraints { make in
            make.bottom.equalTo(nextButton.snp.top).offset(-37)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
}

extension OnboardingFirst {
    @objc private func nextVC() {
        let vc = OnboardingSecond()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
