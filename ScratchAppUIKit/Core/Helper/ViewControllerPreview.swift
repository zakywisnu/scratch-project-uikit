//
//  ViewControllerPreview.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 05/08/22.
//

import UIKit
import SwiftUI

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // not needed
    }
}

struct UIViewsPreview: UIViewRepresentable {
    let uiViewBuilder: () -> UIView
    
    init(_ uiViewBuilder: @escaping () -> UIView) {
        self.uiViewBuilder = uiViewBuilder
    }
    
    func makeUIView(context: Context) -> some UIView {
        return uiViewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // not needed
    }
}
