//
//  MovieItemCell.swift
//  ScratchAppUIKit
//
//  Created by Ahmad Zaky W on 06/08/22.
//

import UIKit
import SwiftUI
import SDWebImage
import SnapKit

protocol MovieItemCellProtocol: AnyObject {
    func didTapBookmark(id: Int)
    func didTapMovie(id: Int)
}

class MovieItemTVCell: UITableViewCell {
    
    var delegate: MovieItemCellProtocol?
    
    private var movie: MovieListModel?
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.text = "Title:"
        return label
    }()
    
    private lazy var movieContent: UIView = {
        let movieContent = UIView()
        movieContent.backgroundColor = .clear
        movieContent.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        movieContent.addGestureRecognizer(tap)
        return movieContent
    }()
    
    private lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.text = "Release Date:"
        return label
    }()
    
    private lazy var genre: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.text = "Genre:"
        return label
    }()
    
    private lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Bold", size: 12)
        label.text = "Avengers End Game"
        return label
    }()
    
    private lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.text = "2022-07-22"
        return label
    }()
    
    private lazy var movieGenre: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Poppins-Medium", size: 12)
        label.text = "Drama"
        return label
    }()
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(movieTapped))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    private lazy var bookmark: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bookmark.fill")
        imageView.tintColor = .white
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(bookmarkTapped))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    private lazy var ratingView: RatingComponent = {
        let rating = RatingComponent()
        return rating
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        self.contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: additional method

extension MovieItemTVCell {
    
    func setMovieData(movie: MovieListModel) {
        self.movie = movie
        movieImage.sd_setImage(with: URL(string:MovieConstant().imageBaseUrl + movie.posterPath))
        movieTitle.text = movie.title
        movieReleaseDate.text = movie.releaseDate
        // TODO: missing movie genre handle
    }
    
    @objc func bookmarkTapped() {
        guard let movie = movie else { return }
        delegate?.didTapBookmark(id: movie.id)
    }
    
    @objc func movieTapped() {
        guard let movie = movie else { return }
        delegate?.didTapMovie(id: movie.id)
    }
}

// MARK: setup UI

extension MovieItemTVCell {
    
    private func setupUI() {
        contentView.addSubview(movieImage)
        
        movieImage.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).offset(24)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(95)
            make.height.equalTo(120)
        }
        
        movieImage.image = UIImage(named: "samplemovie")
        
        contentView.addSubview(bookmark)
        bookmark.snp.makeConstraints { make in
            make.right.equalTo(self.snp.right).inset(24)
            make.width.height.equalTo(24)
            make.top.equalTo(self.snp.top).offset(8)
        }
        
        
        
        self.addSubview(movieContent)
        
        movieContent.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalTo(movieImage.snp.right).offset(22)
            make.right.equalTo(bookmark.snp.left)
        }
        
        
        movieContent.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(18)
        }
        
        movieContent.addSubview(movieTitle)
        movieTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(18)
        }
        
        movieContent.addSubview(releaseDate)
        releaseDate.snp.makeConstraints { make in
            make.top.equalTo(movieTitle.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.height.equalTo(18)
        }
        
        movieContent.addSubview(movieReleaseDate)
        movieReleaseDate.snp.makeConstraints { make in
            make.top.equalTo(releaseDate.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(18)
        }
        
        movieContent.addSubview(genre)
        genre.snp.makeConstraints { make in
            make.top.equalTo(movieReleaseDate.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.height.equalTo(18)
        }
        
        movieContent.addSubview(movieGenre)
        movieGenre.snp.makeConstraints { make in
            make.top.equalTo(genre.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(18)
        }

        contentView.addSubview(ratingView)
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(bookmark.snp.bottom).offset(10)
            make.width.equalTo(24)
            make.height.equalTo(48)
            make.right.equalTo(self.snp.right).inset(24)
        }
    }
}

