//
//  RatingComponent.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 06/08/22.
//

import UIKit
import SwiftUI
import SnapKit

class RatingComponent: UIView {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .white
        return image
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.textColor = UIColor(hexString: "EEEEEE")
        label.text = "9.5"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: Setup UI

extension RatingComponent {
    func setupUI() {
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.size.equalTo(24)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        self.addSubview(ratingLabel)
        ratingLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(image.snp.bottom).offset(4)
            make.height.equalTo(21)
        }
    }
}

struct RatingComponentPreview: PreviewProvider {
    static var previews: some View {
        UIViewsPreview {
            RatingComponent()
        }
        .preferredColorScheme(.dark)
        .frame(height: 120, alignment: .center)
    }
}
