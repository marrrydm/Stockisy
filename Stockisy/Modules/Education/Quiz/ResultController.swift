import UIKit

class ResultController: UIViewController {
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

    private let resLbl1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "res1".localize()
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let resLbl2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.text = "res2".localize()
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let resLblNum: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        view.font = .systemFont(ofSize: 22, weight: .bold)
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
        nextButton.setTitle("Back".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        nextButton.addTarget(self, action: #selector(pop), for: .touchUpInside)

        return nextButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        view.addSubviews(labelTitle, imgView, resLbl1, resLbl2, resLblNum, nextButton)

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
        })

        imgView.snp.makeConstraints({ make in
            make.centerY.equalTo(labelTitle.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        })

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        }

        resLblNum.snp.makeConstraints({ make in
            make.centerY.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        })

        resLbl1.snp.makeConstraints({ make in
            make.bottom.equalTo(resLblNum.snp.top).offset(-5)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        })

        resLbl2.snp.makeConstraints({ make in
            make.top.equalTo(resLblNum.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        })
    }
}

extension ResultController: ResultDelegate {
    func updateQuiz(result: Int, title: String?) {
        labelTitle.text = title
        resLblNum.text = "\(result)/5"
    }
}

extension ResultController {
    @objc private func pop() {
        var score = UserDefaults.standard.integer(forKey: "score")
        score += 200
        UserDefaults.standard.set(score, forKey: "score")

        navigationController?.popToRootViewController(animated: false)
    }
}
