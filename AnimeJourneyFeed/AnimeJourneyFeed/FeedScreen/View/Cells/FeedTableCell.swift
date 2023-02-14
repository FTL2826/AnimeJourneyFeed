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
        let iv = UIImageView(frame: CGRect(x: 6, y: 6, width: 90, height: 90))
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.backgroundColor = .gray
        return iv
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 0
        label.text = "ERROR"
        return label
    }()
    lazy var starCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 1
        label.text = "4506"
        return label
    }()
    lazy var starImage: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        iv.image = UIImage(systemName: "star")
        iv.tintColor = #colorLiteral(red: 1, green: 0.6951724542, blue: 0.3317917632, alpha: 1)
        return iv
    }()
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starImage, starCountLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    //MARK: - setupUI
    private func setupUI() {
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
            vStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vStack.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: vStack.leadingAnchor, constant: -6),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}
