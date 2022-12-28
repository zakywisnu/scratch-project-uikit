//
//  DetailMovieViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 13/09/22.
//

import UIKit
import SnapKit
import RxSwift

final class DetailMovieViewController: UIViewController {
    
    private let viewModel: DetailMovieViewModel
    private let disposeBag = DisposeBag()
    
    init(viewModel: DetailMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init hasn't been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovieDetail()
        setupView()
    }
    
}

// MARK: Private method

extension DetailMovieViewController {
    private func setupView() {
        
    }
}
