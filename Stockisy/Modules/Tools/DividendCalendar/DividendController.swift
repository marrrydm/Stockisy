import UIKit

class DividendController: UIViewController {
    private let labelTitle: UILabel = {
        let view = UILabel()
        view.text = "Best dividend stock".localize()
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
        collectionView.register(DividendCell.self, forCellWithReuseIdentifier: DividendCell.id)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()

    private var dividendCalendar = NetworkController.shared.dividendCalendar

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

        collectionView.reloadData()
    }

    @objc private func pop() {
        navigationController?.popViewController(animated: false)
    }
}

extension DividendController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dividendCalendar.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DividendCell.id, for: indexPath) as! DividendCell
        cell.setup(data: dividendCalendar[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width), height: 74)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
