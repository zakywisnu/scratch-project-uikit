//
//  MovieItemCVCell.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky Wishnumurti on 26/12/22.
//

import Foundation
import SDWebImage
import SnapKit

final class MovieItemCVCell: UICollectionViewCell {
    
    var onTapMovie: ((Int) -> Void)?
    
    private var movie: MovieListModel?
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.layer.masksToBounds = true
        image.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        image.addGestureRecognizer(tap)
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: private method

extension MovieItemCVCell {
    
    func setMovieData(movie: MovieListModel) {
        self.movie = movie
        movieImage.sd_setImage(with: URL(string: MovieConstant().imageBaseUrl + movie.posterPath))
    }
    
    @objc
    func movieTapped() {
        guard let movie = movie else { return }
        onTapMovie?(movie.id)
    }
    
    private func setupView() {
        contentView.addSubview(movieImage)
        
        movieImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
}
