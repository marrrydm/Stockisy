import UIKit

class BankController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.text = "World Central Banks".localize()
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

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 9
        layout.minimumInteritemSpacing = 9
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.layer.cornerRadius = 13
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        collectionView.layer.masksToBounds = true
        collectionView.clipsToBounds = true
        collectionView.register(BankCell.self, forCellWithReuseIdentifier: BankCell.id)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()

    private let bankModels =
    [
        BankModel(title: "Federal Reserve".localize(), subtitle: "(FED)".localize(), img: "US", percent: "5.50%", nextMeet: "Sep 20, 2023", lastMeet: "Jul 26, 2023"),
        BankModel(title: "European Caentral Bank".localize(), subtitle: "(ECB)".localize(), img: "EU", percent: "4.25%", nextMeet: "Sep 14, 2023", lastMeet: "Jul 27, 2023"),
        BankModel(title: "Bank of England".localize(), subtitle: "(BOE)".localize(), img: "united-kingdom-flag", percent: "5.25%", nextMeet: "Sep 21, 2023", lastMeet: "Aug 03, 2023"),
        BankModel(title: "Swiss National Bank".localize(), subtitle: "(SNB)".localize(), img: "CH", percent: "1.75%", nextMeet: "Sep 21, 2023", lastMeet: "Jun 22, 2023"),
        BankModel(title: "Reserve Bank of Australia".localize(), subtitle: "(RBA)".localize(), img: "AU", percent: "4.10%", nextMeet: "Sep 05, 2023", lastMeet: "Jun 06, 2023"),
        BankModel(title: "Bank of Canada".localize(), subtitle: "(BOC)".localize(), img: "CA", percent: "5.00%", nextMeet: "Sep 06, 2023", lastMeet: "Jun 12, 2023"),
        BankModel(title: "Reserve Bank of New Zealand".localize(), subtitle: "(RBA)".localize(), img: "NZ", percent: "5.50%", nextMeet: "Oct 04, 2023", lastMeet: "May 25, 2023"),
        BankModel(title: "Bank of Japan".localize(), subtitle: "(BOJ)".localize(), img: "japan-flag", percent: "-0.10%", nextMeet: "Sep 22, 2023", lastMeet: "Jan 29, 2016"),
        BankModel(title: "Central Bank of the Russian Federation".localize(), subtitle: "(CBR)".localize(), img: "russia-flag", percent: "12.00%", nextMeet: "Sep 15, 2023", lastMeet: "Aug 15, 2023"),
        BankModel(title: "Reserve Bank of India".localize(), subtitle: "(RBI)".localize(), img: "india-flag", percent: "6.50%", nextMeet: "Oct 06, 2023", lastMeet: "Feb 08, 2023"),
        BankModel(title: "People's Bank of China".localize(), subtitle: "(PBOC)".localize(), img: "china-flag", percent: "3.55%", nextMeet: "", lastMeet: "Jun 20, 2023"),
        BankModel(title: "People's Bank of Brazil".localize(), subtitle: "(BCB)".localize(), img: "brazil-flag", percent: "13.25%", nextMeet: "Sep 20, 2023", lastMeet: "Aug 02, 2023")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.103, green: 0.121, blue: 0.196, alpha: 1)
        navigationController?.navigationBar.isHidden = true

        view.addSubviews(labelTitle, collectionView, imgView)

        labelTitle.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        })

        imgView.snp.makeConstraints({ make in
            make.centerY.equalTo(labelTitle.snp.centerY)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(24)
        })

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(31)
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc private func pop() {
        navigationController?.popViewController(animated: false)
    }
}

extension BankController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bankModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankCell.id, for: indexPath) as! BankCell
        cell.setup(data: bankModels[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width), height: 98)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
