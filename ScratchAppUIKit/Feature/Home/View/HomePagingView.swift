//
//  HomePagingView.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 26/12/22.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import Tabman
import Pageboy

final class HomePagingView: TabmanViewController {
    
    private var viewControllers: [UIViewController] = []
    
    private let viewModel: HomePagingViewModel
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    init(viewModel: HomePagingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder hasn't been implemented yet")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = viewModel.getTabVC()
        dataSource = self
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .progressive
        bar.backgroundColor = .clear
        bar.layout.separatorInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        addBar(bar, dataSource: self, at: .top)
    }
    
}

// MARK: PageBoy Extension

extension HomePagingView: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = viewModel.getBarTitle(index: index)
        return TMBarItem(title: title)
    }
}



