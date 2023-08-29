import UIKit

protocol ResultDelegate: AnyObject {
    func updateQuiz(result: Int, title: String?)
}

class QuizController: UIViewController, UIScrollViewDelegate {
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

    private let questionLbl: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 22, weight: .bold)
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0

        return view
    }()

    private lazy var view1: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        view.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 0

        return view
    }()

    private lazy var view2: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        view.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 1

        return view
    }()

    private lazy var view3: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        view.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 2

        return view
    }()

    private lazy var view4: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0
        view.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        view.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 3

        return view
    }()

    private let answerLbl1: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0

        return view
    }()

    private let answerLbl2: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0

        return view
    }()

    private let answerLbl3: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0

        return view
    }()

    private let answerLbl4: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.font = .systemFont(ofSize: 13, weight: .regular)
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0

        return view
    }()

    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Continue".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        nextButton.alpha = 0.5
        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        return nextButton
    }()

    private var lessonsArray: [([String], [[String]], [Int], Int)] =
    [
        (["qiestion1.1".localize(), "qiestion1.2".localize(), "qiestion1.3".localize(), "qiestion1.4".localize(), "qiestion1.5".localize()],
         [["answer1.1.1".localize(), "answer1.1.2".localize(), "answer1.1.3".localize(), "answer1.1.4".localize()],
          ["answer1.2.1".localize(), "answer1.2.2".localize(), "answer1.2.3".localize(), "answer1.2.4".localize()],
          ["answer1.3.1".localize(), "answer1.3.2".localize(), "answer1.3.3".localize(), "answer1.3.4".localize()],
          ["answer1.4.1".localize(), "answer1.4.2".localize(), "answer1.4.3".localize(), "answer1.4.4".localize()],
          ["answer1.5.1".localize(), "answer1.5.2".localize(), "answer1.5.3".localize(), "answer1.5.4".localize()]],
         [3, 2, 2, 0, 3], 0),
        
        (["qiestion2.1".localize(), "qiestion2.2".localize(), "qiestion2.3".localize(), "qiestion2.4".localize(), "qiestion2.5".localize()],
         [["answer2.1.1".localize(), "answer2.1.2".localize(), "answer2.1.3".localize(), "answer2.1.4".localize()],
          ["answer2.2.1".localize(), "answer2.2.2".localize(), "answer2.2.3".localize(), "answer2.2.4".localize()],
          ["answer2.3.1".localize(), "answer2.3.2".localize(), "answer2.3.3".localize(), "answer2.3.4".localize()],
          ["answer2.4.1".localize(), "answer2.4.2".localize(), "answer2.4.3".localize(), "answer2.4.4".localize()],
          ["answer2.5.1".localize(), "answer2.5.2".localize(), "answer2.5.3".localize(), "answer2.5.4".localize()]],
         [1, 2, 1, 2, 1], 1),
    ]

    private var isStep = 0
    private var number = -1
    private var result = 0

    weak var delegate: ResultDelegate?

    private var isChecked: Int = -1 {
        didSet {
            if view1.layer.borderWidth != 0 || view2.layer.borderWidth != 0 || view3.layer.borderWidth != 0 || view4.layer.borderWidth != 0 {
                nextButton.alpha = 1
            } else {
                nextButton.alpha = 0.5
            }
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.layoutIfNeeded()
        scrollView.updateContentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        scrollView.delegate = self
        view.addSubviews(scrollView, labelTitle, imgView, nextButton)

        scrollView.addSubviews(questionLbl, view1, view2, view3, view4)
        view1.addSubview(answerLbl1)
        view2.addSubview(answerLbl2)
        view3.addSubview(answerLbl3)
        view4.addSubview(answerLbl4)

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(40)
        })

        imgView.snp.makeConstraints({ make in
            make.centerY.equalTo(labelTitle.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        })

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(30)
            make.leading.bottom.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }

        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(50)
        }

        questionLbl.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }

        view1.snp.makeConstraints { make in
            make.top.equalTo(questionLbl.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(26)
        }

        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(26)
        }

        view3.snp.makeConstraints { make in
            make.top.equalTo(view2.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(26)
        }

        view4.snp.makeConstraints { make in
            make.top.equalTo(view3.snp.bottom).offset(10)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(26)
        }

        answerLbl1.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.edges.equalToSuperview().inset(16)
        }

        answerLbl2.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.edges.equalToSuperview().inset(16)
        }

        answerLbl3.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.edges.equalToSuperview().inset(16)
        }

        answerLbl4.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.edges.equalToSuperview().inset(16)
        }
    }
}

extension QuizController {
    @objc private func tapButtonNext() {
        if isChecked == lessonsArray[number].2[isStep] {
            result += 1
        }
        if isStep != 4 && nextButton.alpha == 1 {
            isStep += 1
            questionLbl.text = lessonsArray[number].0[isStep]
            answerLbl1.text = lessonsArray[number].1[isStep][0]
            answerLbl2.text = lessonsArray[number].1[isStep][1]
            answerLbl3.text = lessonsArray[number].1[isStep][2]
            answerLbl4.text = lessonsArray[number].1[isStep][3]

            view1.layer.borderWidth = 0
            view2.layer.borderWidth = 0
            view3.layer.borderWidth = 0
            view4.layer.borderWidth = 0

            nextButton.alpha = 0.5
        } else {
            let vc = ResultController()
            navigationController?.pushViewController(vc, animated: false)
            self.delegate = vc
            self.delegate?.updateQuiz(result: result, title: labelTitle.text)
        }
    }

    @objc func btnClickCheck(_ sender: UIButton) {
        switch (sender) {
        case view1:
            view1.layer.borderWidth = 1
            view2.layer.borderWidth = 0
            view3.layer.borderWidth = 0
            view4.layer.borderWidth = 0
            isChecked = 0
        case view2:
            view2.layer.borderWidth = 1
            view1.layer.borderWidth = 0
            view3.layer.borderWidth = 0
            view4.layer.borderWidth = 0
            isChecked = 1
        case view3:
            view3.layer.borderWidth = 1
            view2.layer.borderWidth = 0
            view1.layer.borderWidth = 0
            view4.layer.borderWidth = 0
            isChecked = 2
        case view4:
            view4.layer.borderWidth = 1
            view2.layer.borderWidth = 0
            view3.layer.borderWidth = 0
            view1.layer.borderWidth = 0
            isChecked = 3
        default: break
        }
    }
}

extension QuizController: QuizDelegate {
    func updateQuiz(title: String, num: Int) {
        labelTitle.text = title
        number = num
        switch num {
        case 0:
            questionLbl.text = lessonsArray[num].0[0]
            answerLbl1.text = lessonsArray[num].1[0][0]
            answerLbl2.text = lessonsArray[num].1[0][1]
            answerLbl3.text = lessonsArray[num].1[0][2]
            answerLbl4.text = lessonsArray[num].1[0][3]
        case 1:
            questionLbl.text = lessonsArray[num].0[0]
            answerLbl1.text = lessonsArray[num].1[0][0]
            answerLbl2.text = lessonsArray[num].1[0][1]
            answerLbl3.text = lessonsArray[num].1[0][2]
            answerLbl4.text = lessonsArray[num].1[0][3]
        default: break
        }
    }
}

extension QuizController {
    @objc private func pop() {
        navigationController?.popViewController(animated: false)
    }
}
