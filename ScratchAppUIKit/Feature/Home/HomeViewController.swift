//
//  HomeViewController.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 23/06/22.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {

    private var viewControllers = [UIViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        
        addBar(bar, dataSource: self, at: .top)
    }


}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
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
        let title = "Page \(index)"
        return TMBarItem(title: title)
    }
}

