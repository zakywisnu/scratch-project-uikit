//
//  NowPlayingListViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 03/07/22.
//

import UIKit
import SwiftUI

class NowPlayingListViewController: UIViewController {
    
    private let viewModel: NowPlayingListViewModel
    
    
    
    init(viewModel: NowPlayingListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchList()
    }


}


