//
//  PopularViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 19/08/22.
//

import UIKit
import SnapKit
import RxSwift

class PopularViewController: UIViewController {
    
    private let viewModel: PopularViewModel
    private let disposeBag = DisposeBag()
    private var tableView = UITableView()
    
    init(viewModel: PopularViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        view.backgroundColor = UIColor(hexString: "242A32")
//        startInjection()
        viewModel.fetchList()
        tableView.backgroundColor = .clear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        removeInjection()
    }
}

extension PopularViewController {
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

extension PopularViewController: MovieItemCellProtocol, UITableViewDelegate {
    func didTapBookmark(id: Int) {
        print("tapped ID", id)
    }
    
    func didTapMovie(id: Int) {
        print("tapped movie")
    }
    
}
