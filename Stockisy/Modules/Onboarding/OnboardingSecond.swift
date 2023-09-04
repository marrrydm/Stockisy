import StoreKit
import UIKit

class OnboardingSecond: UIViewController {
    private let bgView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "view")
        view.contentMode = .scaleToFill

        return view
    }()

    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.layer.cornerRadius =  16

        return view
    }()

    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.layer.cornerRadius =  16

        return view
    }()

    private let person1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let person2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let stars1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let stars2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let name1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let name2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let comment1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let comment2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

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

        labelTitle.text = OnboardingViewModel.init().items?[1].title
        contentLabel.text = OnboardingViewModel.init().items?[1].content
        person1.image = OnboardingViewModel.init().items?[1].images[0]
        person2.image = OnboardingViewModel.init().items?[1].images[1]
        name1.text = OnboardingViewModel.init().items?[1].name1
        name2.text = OnboardingViewModel.init().items?[1].name2
        comment1.text = OnboardingViewModel.init().items?[1].comment1
        comment2.text = OnboardingViewModel.init().items?[1].comment2
        stars1.image = OnboardingViewModel.init().items?[1].images[2]
        stars2.image = OnboardingViewModel.init().items?[1].images[2]
    }

    private func setupViews() {
        view.addSubviews(bgView, nextButton)
        bgView.addSubviews(labelTitle, contentLabel, view1, view2)
        view1.addSubviews(person1, name1, comment1, stars1)
        view2.addSubviews(person2, name2, comment2, stars2)
    }

    private func makeConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        view2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(labelTitle.snp.top).offset(-60)
            make.top.equalTo(person2.snp.top).offset(-20)
        }

        comment2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(view2.snp.bottom).offset(-20)
        }

        name2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(person2.snp.trailing).offset(16)
            make.bottom.equalTo(person2.snp.centerY).offset(-5)
        }

        stars2.snp.makeConstraints { make in
            make.leading.equalTo(person2.snp.trailing).offset(16)
            make.top.equalTo(person2.snp.centerY).offset(5)
        }

        person2.snp.makeConstraints { make in
            make.bottom.equalTo(comment2.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(54)
        }

        view1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view2.snp.top).offset(-20)
            make.top.equalTo(person1.snp.top).offset(-20)
        }

        comment1.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalTo(view1.snp.bottom).offset(-20)
        }

        name1.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(person1.snp.trailing).offset(16)
            make.bottom.equalTo(person1.snp.centerY).offset(-5)
        }

        stars1.snp.makeConstraints { make in
            make.leading.equalTo(person1.snp.trailing).offset(16)
            make.top.equalTo(person1.snp.centerY).offset(5)
        }

        person1.snp.makeConstraints { make in
            make.bottom.equalTo(comment1.snp.top).offset(-20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(54)
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

extension OnboardingSecond {
    @objc private func nextVC() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
        
        let vc = OnboardingThird()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
