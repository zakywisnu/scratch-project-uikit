//
//  NowPlayingListViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import UIKit
import SwiftUI
import SnapKit
import RxSwift
import RxCocoa

class NowPlayingListViewController: UIViewController {
    
    private let viewModel: NowPlayingListViewModel
    
    private var tableView = UITableView()
    private let disposeBag = DisposeBag()
    fileprivate var stringku: String = ""
    
    init(viewModel: NowPlayingListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupView()
        view.backgroundColor = UIColor(hexString: "242A32")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setutap after loading the view.
        startInjection()
        viewModel.fetchList()
        tableView.backgroundColor = .purple
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeInjection()
    }
    
    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview()
        }
        tableView.register(MovieItemCell.self, forCellReuseIdentifier: "movieCell")
        tableView.rowHeight = 130
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel
            .movie
            .bind(to: tableView.rx.items(cellIdentifier: "movieCell")) { (tv, movie, cellToUse) in
                if let cell = cellToUse as? MovieItemCell {
                    cell.setMovieData(movie: movie)
                    cell.selectionStyle = .none
                    cell.backgroundColor = .clear
                    cell.delegate = self
                }
        }
        .disposed(by: disposeBag)
    }
    
    private func startInjection() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(reloadView),
            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil)
    }
    
    private func removeInjection() {
        NotificationCenter.default.removeObserver(
            self,
            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"),
            object: nil
        )
    }
    
    @objc
    private func reloadView() {
        self.injected()
    }
}

extension NowPlayingListViewController: MovieItemCellProtocol, UITableViewDelegate {
    func didTapBookmark(id: Int) {
        print("tapped ID", id)
    }
    
    func didTapMovie(id: Int) {
        print("tapped movie")
    }
    
}
