import SnapKit
import UIKit

class LoadController: UIViewController {
    private let bgView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "view")
        logoView.contentMode = .scaleToFill

        return logoView
    }()

    private let logoView: UIImageView = {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "logo")
        logoView.contentMode = .scaleAspectFit

        return logoView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        makeConstraints()

        if UserDefaults.standard.integer(forKey: "score") == 0 {
            UserDefaults.standard.set(0, forKey: "score")
        }

        if UserDefaults.standard.object(forKey: "arrLessons") == nil {
            UserDefaults.standard.set([0, 1, 2, 3, 4], forKey: "arrLessons")
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.nextVC()
        })
    }

    private func setupViews() {
        view.addSubviews(bgView)
        bgView.addSubview(logoView)
    }

    private func makeConstraints() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        logoView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(107)
        }
    }
}

extension LoadController {
    @objc private func nextVC() {
        if (UserDefaults.standard.string(forKey: "showedOnboarding") != nil) == true {
            let vc = TabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        } else {
            UserDefaults.standard.set(true, forKey: "showedOnboarding")
            let vc = OnboardingFirst()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
        }
    }
}
