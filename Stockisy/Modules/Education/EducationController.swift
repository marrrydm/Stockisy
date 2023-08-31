import UIKit

protocol EduDelegate: AnyObject {
    func updateEdu(title: String, num: Int, numSection: Int)
}

protocol QuizDelegate: AnyObject {
    func updateQuiz(title: String, num: Int, numSection: Int)
}

class EducationController: UIViewController, UIScrollViewDelegate {
    weak var delegate: EduDelegate?
    weak var delegateQuiz: QuizDelegate?

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
        view.text = "tabbar.edu".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let levelTitle: UILabel = {
        let view = UILabel()
        view.text = "Level".localize() + " 1"
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle: UILabel = {
        let view = UILabel()
        view.text = "0 / 150"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "imgEdu")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private lazy var nextButton1: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Done".localize(), for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC2), for: .touchUpInside)
        nextButton.tag = 0

        return nextButton
    }()

    private let levelTitle1: UILabel = {
        let view = UILabel()
        view.text = "Quiz of the day".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle1: UILabel = {
        let view = UILabel()
        view.text = "0 / 200"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .right
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img1")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private lazy var nextButton2: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Done".localize(), for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC2), for: .touchUpInside)
        nextButton.tag = 1

        return nextButton
    }()

    private let levelTitle2: UILabel = {
        let view = UILabel()
        view.text = "Basic quiz".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle2: UILabel = {
        let view = UILabel()
        view.text = "0 / 200"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .right
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img2")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private lazy var nextButton3: UIButton = {
        let nextButton = UIButton()
        nextButton.setTitle("Done".localize(), for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.tag = 2

        return nextButton
    }()

    private let levelTitle3: UILabel = {
        let view = UILabel()
        view.text = "Trading basics".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle3: UILabel = {
        let view = UILabel()
        view.text = "0 / 200"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .right
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView3: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img3")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view4: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private lazy var nextButton4: UIButton = {
        let nextButton = UIButton()
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Done".localize(), for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.tag = 3

        return nextButton
    }()

    private let levelTitle4: UILabel = {
        let view = UILabel()
        view.text = "How to choose dividends".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle4: UILabel = {
        let view = UILabel()
        view.text = "0 / 200"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .right
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView4: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img4")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view5: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private lazy var nextButton5: UIButton = {
        let nextButton = UIButton()
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Done".localize(), for: .normal)
        nextButton.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        nextButton.tag = 4

        return nextButton
    }()

    private let levelTitle5: UILabel = {
        let view = UILabel()
        view.text = "What are Daily Pivot Points".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let scoreTitle5: UILabel = {
        let view = UILabel()
        view.text = "0 / 200"
        view.textColor = UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.numberOfLines = 0
        view.textAlignment = .right
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView5: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img5")
        view.contentMode = .scaleAspectFit

        return view
    }()

    private let view6: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 16

        return view
    }()

    private let levelTitle6: UILabel = {
        let view = UILabel()
        view.text = "More chapters to be added soon".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView6: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img6")
        view.contentMode = .scaleAspectFit

        return view
    }()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.layoutIfNeeded()
        scrollView.updateContentView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let score = UserDefaults.standard.integer(forKey: "score")
        var slash = 150
        switch score {
        case 0...150:
            slash = 150
            levelTitle.text = "Level".localize() + " 1"
        case 151...599:
            slash = 600
            levelTitle.text = "Level".localize() + " 2"
        case 600...1000:
            slash = 1000
            levelTitle.text = "Level".localize() + " 3"
        default: break
        }
        scoreTitle.text = "\(UserDefaults.standard.integer(forKey: "score")) / \(slash)"

        actionBtn()

        let score1 = UserDefaults.standard.integer(forKey: "score1")
        let score2 = UserDefaults.standard.integer(forKey: "score2")
        let score3 = UserDefaults.standard.integer(forKey: "score3")
        let score4 = UserDefaults.standard.integer(forKey: "score4")
        let score5 = UserDefaults.standard.integer(forKey: "score5")
        scoreTitle1.text = "\(score1) / 200"
        scoreTitle2.text = "\(score2) / 200"
        scoreTitle3.text = "\(score3) / 200"
        scoreTitle4.text = "\(score4) / 200"
        scoreTitle5.text = "\(score5) / 200"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        scrollView.delegate = self
        view.addSubviews(scrollView, labelTitle, levelTitle, scoreTitle, imgView)

        scrollView.addSubviews(view1, view2, view3, view4, view5, view6)
        view1.addSubviews(imgView1, nextButton1, levelTitle1, scoreTitle1)
        view2.addSubviews(imgView2, nextButton2, levelTitle2, scoreTitle2)
        view3.addSubviews(imgView3, nextButton3, levelTitle3, scoreTitle3)
        view4.addSubviews(imgView4, nextButton4, levelTitle4, scoreTitle4)
        view5.addSubviews(imgView5, nextButton5, levelTitle5, scoreTitle5)
        view6.addSubviews(imgView6, levelTitle6)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(24)
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        imgView.snp.makeConstraints({ make in
            make.top.equalTo(labelTitle.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        levelTitle.snp.makeConstraints({ make in
            make.bottom.equalTo(imgView.snp.centerY).offset(-2)
            make.leading.equalTo(imgView.snp.trailing).offset(12)
        })

        scoreTitle.snp.makeConstraints({ make in
            make.top.equalTo(imgView.snp.centerY).offset(4)
            make.leading.equalTo(imgView.snp.trailing).offset(12)
        })

        view1.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.height.equalTo(view4.snp.height)
        })

        imgView1.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        scoreTitle1.snp.makeConstraints({ make in
            make.top.equalTo(imgView1.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        })

        levelTitle1.snp.makeConstraints({ make in
            make.top.equalTo(imgView1.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton1.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }

        view2.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(view4.snp.height)
        })

        imgView2.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        scoreTitle2.snp.makeConstraints({ make in
            make.top.equalTo(imgView2.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        })

        levelTitle2.snp.makeConstraints({ make in
            make.top.equalTo(imgView2.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton2.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }

        view3.snp.makeConstraints({ make in
            make.top.equalTo(view1.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.height.equalTo(view4.snp.height)
        })

        imgView3.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        scoreTitle3.snp.makeConstraints({ make in
            make.top.equalTo(imgView3.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        })

        levelTitle3.snp.makeConstraints({ make in
            make.top.equalTo(imgView3.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton3.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }

        view4.snp.makeConstraints({ make in
            make.top.equalTo(view2.snp.bottom).offset(12)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.bottom.equalTo(nextButton4.snp.bottom).offset(16)
        })

        imgView4.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        scoreTitle4.snp.makeConstraints({ make in
            make.top.equalTo(imgView4.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        })

        levelTitle4.snp.makeConstraints({ make in
            make.top.equalTo(imgView4.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton4.snp.makeConstraints { make in
            make.top.equalTo(levelTitle4.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }

        view5.snp.makeConstraints({ make in
            make.top.equalTo(view3.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.height.equalTo(view4.snp.height)
        })

        imgView5.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        scoreTitle5.snp.makeConstraints({ make in
            make.top.equalTo(imgView5.snp.top)
            make.trailing.equalToSuperview().offset(-16)
        })

        levelTitle5.snp.makeConstraints({ make in
            make.top.equalTo(imgView5.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton5.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }

        view6.snp.makeConstraints({ make in
            make.top.equalTo(view4.snp.bottom).offset(12)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(view4.snp.height)
        })

        imgView6.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
        })

        levelTitle6.snp.makeConstraints({ make in
            make.top.equalTo(imgView6.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })
    }
}

extension EducationController {
    @objc private func nextVC(sender: UIButton) {
        let vc = LessonController()
        navigationController?.pushViewController(vc, animated: false)
        var title = ""
        var num = -1

        switch sender {
        case nextButton3: title = levelTitle3.text!
            num = 0
        case nextButton4: title = levelTitle4.text!
            num = 1
        case nextButton5: title = levelTitle5.text!
            num = 2
        default: break
        }

        self.delegate = vc
        self.delegate?.updateEdu(title: title, num: num, numSection: sender.tag)
    }

    @objc private func nextVC2(sender: UIButton) {
        let vc = QuizController()
        navigationController?.pushViewController(vc, animated: false)
        var title = ""
        var num = -1

        switch sender {
        case nextButton1: title = levelTitle1.text!
            num = 0
        case nextButton2: title = levelTitle2.text!
            num = 1
        default: break
        }

        self.delegateQuiz = vc
        self.delegateQuiz?.updateQuiz(title: title, num: num, numSection: sender.tag)
    }

    private func actionBtn() {
        nextButton1.setTitle("Done".localize(), for: .normal)
        nextButton1.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton2.setTitle("Done".localize(), for: .normal)
        nextButton2.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton3.setTitle("Done".localize(), for: .normal)
        nextButton3.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton4.setTitle("Done".localize(), for: .normal)
        nextButton4.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        nextButton5.setTitle("Done".localize(), for: .normal)
        nextButton5.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)

        let savedNumbers = UserDefaults.standard.array(forKey: "arrLessons") as? [Int]
        for numbers in savedNumbers ?? [] {
            switch numbers {
            case 0:
                nextButton1.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
                nextButton1.setTitle("Open".localize(), for: .normal)
            case 1:
                nextButton2.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
                nextButton2.setTitle("Open".localize(), for: .normal)
            case 2:
                nextButton3.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
                nextButton3.setTitle("Open".localize(), for: .normal)
            case 3:
                nextButton4.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
                nextButton4.setTitle("Open".localize(), for: .normal)
            case 4:
                nextButton5.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
                nextButton5.setTitle("Open".localize(), for: .normal)
            default: break
            }
        }
    }
}
