//
//  HomeViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import UIKit
import Tabman
import Pageboy
import RxSwift

class HomeViewController: UIViewController {
    
    private let viewModel: HomeViewModel
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 185)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let homeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you want to watch?"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    private var movies: [MovieListModel] = []
    
    private let disposeBag = DisposeBag()
    private lazy var homePagingView = HomePagingView(viewModel: HomePagingDefaultViewModel())
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder hasn't been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchTrendingMovie()
        setupCV()
        setupView()
        initObserver()
    }

}

// MARK: Private Method

extension HomeViewController {
    private func setupCV() {
        collectionView.register(MovieItemCVCell.self, forCellWithReuseIdentifier: "movieCvCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func initObserver() {
        viewModel.trendingMovie
            .observe(on: ConcurrentMainScheduler.instance)
            .subscribe(on: ConcurrentMainScheduler.instance)
            .subscribe(onNext: { [weak self] movie in
                guard let self = self else { return }
                self.movies = movie
                self.collectionView.reloadData()
            }, onError: { error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupView() {
        
        view.addSubview(homeTitleLabel)
        
        homeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview()
            make.height.equalTo(24)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(homeTitleLabel.snp.bottom).offset(24)
            make.height.equalTo(200)
        }
        
        view.addSubview(homePagingView.view)
        
        homePagingView.view.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(12)
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(collectionView.snp.bottom).offset(24)
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCvCell", for: indexPath) as? MovieItemCVCell else { return UICollectionViewCell() }
        cell.setMovieData(movie: movies[indexPath.row])
        cell.backgroundColor = .clear
        cell.onTapMovie = { [weak self] id in
            print("cell ", id)
        }
        return cell
    }
}



