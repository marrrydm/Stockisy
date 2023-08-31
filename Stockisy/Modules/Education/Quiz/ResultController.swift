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

    private var resultVal = 0
    private var number = 0

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
    func updateQuiz(result: Int, title: String?, num: Int, numSection: Int) {
        labelTitle.text = title
        resLblNum.text = "\(result)/5"
        resultVal = result
        number = numSection
    }
}

extension ResultController {
    @objc private func pop() {
        var savedNumbers = UserDefaults.standard.array(forKey: "arrLessons") as? [Int]
        let old = savedNumbers
        savedNumbers?.removeAll(where: { $0 == number })
        if savedNumbers != old {
            UserDefaults.standard.set(savedNumbers, forKey: "arrLessons")

            var score = UserDefaults.standard.integer(forKey: "score")
            score += (40 * resultVal)
            UserDefaults.standard.set(score, forKey: "score")

            if number == 0 {
                if UserDefaults.standard.integer(forKey: "score1") == 0 {
                    UserDefaults.standard.set((40 * resultVal), forKey: "score1")
                }
            } else {
                if UserDefaults.standard.integer(forKey: "score2") == 0 {
                    UserDefaults.standard.set((40 * resultVal), forKey: "score2")
                }
            }
        }

        navigationController?.popToRootViewController(animated: false)
    }
}
