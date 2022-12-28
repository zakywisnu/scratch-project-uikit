//
//  ViewController+Extension.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 15/12/22.
//

import UIKit

extension UIViewController {
    @objc func injected() {
        viewDidLoad()
    }
    
    func startInjection() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(reloadView),
            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil
        )
    }
    
    func removeInjection() {
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
