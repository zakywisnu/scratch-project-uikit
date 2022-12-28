//
//  TopRatedViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 19/08/22.
//

import UIKit
import RxSwift
import SnapKit
import RxCocoa

final class TopRatedViewController: UIViewController {
    
    private let viewModel: TopRatedViewModel
    
    private var tableView = UITableView()
    private let disposeBag = DisposeBag()
    
    init(viewModel: TopRatedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchList()
        tableView.backgroundColor = .clear
        view.backgroundColor = UIColor(hexString: "242A32")
        setupView()
    }
    
    
}

// MARK: Private method

extension TopRatedViewController {
    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview()
        }
        tableView.register(MovieItemTVCell.self, forCellReuseIdentifier: "movieCell")
        tableView.rowHeight = 130
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel
            .movie
            .bind(to: tableView.rx.items(cellIdentifier: "movieCell")) { (tv, movie, cellToUse) in
                if let cell = cellToUse as? MovieItemTVCell {
                    cell.setMovieData(movie: movie)
                    cell.selectionStyle = .none
                    cell.backgroundColor = .clear
                    cell.delegate = self
                }
        }
        .disposed(by: disposeBag)
    }
}

extension TopRatedViewController: MovieItemCellProtocol, UITableViewDelegate {
    func didTapMovie(id: Int) {
        print("tapped id")
    }
    
    func didTapBookmark(id: Int) {
        print("tapped bookmark")
    }
}
