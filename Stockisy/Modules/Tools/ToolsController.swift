import UIKit

class ToolsController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.text = "tabbar.tools".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.lineBreakMode = .byWordWrapping

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
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Open".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC1), for: .touchUpInside)

        return nextButton
    }()

    private let levelTitle1: UILabel = {
        let view = UILabel()
        view.text = "Dividend Calendar".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img4")
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
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Open".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC2), for: .touchUpInside)

        return nextButton
    }()

    private let levelTitle2: UILabel = {
        let view = UILabel()
        view.text = "Daily Pivot Points".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img5")
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
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Open".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.addTarget(self, action: #selector(nextVC3), for: .touchUpInside)

        return nextButton
    }()

    private let levelTitle3: UILabel = {
        let view = UILabel()
        view.text = "World Central Banks".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView3: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img7")
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
        nextButton.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.alpha = 0
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Open".localize(), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        nextButton.isUserInteractionEnabled = false

        return nextButton
    }()

    private let levelTitle4: UILabel = {
        let view = UILabel()
        view.text = "More chapters to be added soon".localize()
        view.textColor = .white
        view.font = .systemFont(ofSize: 17, weight: .semibold)
        view.numberOfLines = 0
        view.textAlignment = .left
        view.lineBreakMode = .byWordWrapping

        return view
    }()

    private let imgView4: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img6")
        view.contentMode = .scaleAspectFit

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        view.addSubviews(labelTitle, view1, view2, view3, view4)

        view1.addSubviews(imgView1, nextButton1, levelTitle1)
        view2.addSubviews(imgView2, nextButton2, levelTitle2)
        view3.addSubviews(imgView3, nextButton3, levelTitle3)
        view4.addSubviews(imgView4, nextButton4, levelTitle4)

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        view1.snp.makeConstraints({ make in
            make.top.equalTo(labelTitle.snp.bottom).offset(31)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.snp.centerX).offset(-5.5)
            make.height.equalTo(view4.snp.height)
        })

        imgView1.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
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
            make.top.equalTo(labelTitle.snp.bottom).offset(31)
            make.leading.equalTo(view.snp.centerX).offset(5.5)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(view4.snp.height)
        })

        imgView2.snp.makeConstraints({ make in
            make.top.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(44)
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

        levelTitle4.snp.makeConstraints({ make in
            make.top.equalTo(imgView4.snp.bottom).offset(13)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        nextButton4.snp.makeConstraints { make in
            make.top.equalTo(levelTitle4.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(34)
        }
    }
}

extension ToolsController {
    @objc private func nextVC1(sender: UIButton) {
        let vc = DividendController()
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func nextVC2(sender: UIButton) {
        let vc = DailyController()
        navigationController?.pushViewController(vc, animated: false)
    }

    @objc private func nextVC3(sender: UIButton) {
        let vc = BankController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
