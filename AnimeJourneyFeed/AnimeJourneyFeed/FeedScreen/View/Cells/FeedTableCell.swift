//
//  FeedTableCell.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /142/23.
//

import UIKit

class FeedTableCell: UITableViewCell {

    static let identifier = "FeedCell"
    
    lazy var posterImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .gray
        return iv
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        label.text = "ERROR"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupUI
    private func setupUI() {
        addSubview(posterImage)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            posterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            posterImage.widthAnchor.constraint(equalToConstant: 90),
//            posterImage.heightAnchor.constraint(equalToConstant: 90),
            posterImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6)
        ])
    }
    
}
