import UIKit

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
//        viewTest.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 0

        return view
    }()

    private lazy var view2: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
//        viewTest.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 1

        return view
    }()

    private lazy var view3: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
//        viewTest.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
        view.tag = 2

        return view
    }()

    private lazy var view4: UIButton = {
        let view = UIButton()
        view.backgroundColor = UIColor(red: 0.162, green: 0.189, blue: 0.292, alpha: 1)
        view.layer.cornerRadius = 10
//        viewTest.addTarget(self, action: #selector(btnClickCheck), for: .touchUpInside)
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
//        nextButton.addTarget(self, action: #selector(tapButtonNext), for: .touchUpInside)

        return nextButton
    }()

    private var lessonsArray: [(String, String, String, String, Int)] =
    [
        
    ]

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

extension QuizController: QuizDelegate {
    func updateQuiz(title: String, num: Int) {
        labelTitle.text = title
        switch num {
//        case 0:
//            labelTitleLarge.text = lessonsArray[0].0
//            labelBlue.text = lessonsArray[0].1
//            labelMain1.text = lessonsArray[0].2
//            labelMain2.text = lessonsArray[0].3
//        case 1:
//            labelTitleLarge.text = lessonsArray[1].0
//            labelBlue.text = lessonsArray[1].1
//            labelMain1.text = lessonsArray[1].2
//            labelMain2.text = lessonsArray[1].3
        default: break
        }
    }
}

extension QuizController {
    @objc private func pop() {
        navigationController?.popViewController(animated: false)
    }
}
