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
        label.text = "0000"
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
    var dataTask: Cancellable? = nil
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImage.image = nil
        dataTask?.cancel()
    }
    
    func configure(for title: TitleData, with presenter: FeedPresenterProtocol?) {
        titleLabel.text = title.attributes.canonicalTitle
        starCountLabel.text = String(title.attributes.favoritesCount)
        let checkCache = presenter?.checkPictureInCache(id: title.id)
        
        switch checkCache?.flag {
        case .some(let flag):
            if flag {
                print("DEBUG PRINT:", "pic for cell \(title.id) is exist")
                posterImage.image = UIImage(contentsOfFile: checkCache!.path)
                posterImage.contentMode = .scaleToFill
            } else {
                fallthrough
            }
        case .none:
            dataTask = presenter?.loadPoster(link: title.attributes.posterImage.tiny!, completion: { [weak self] imageData in
                if let imageData = imageData {
                    self?.posterImage.image = UIImage(data: imageData)
                    self?.posterImage.contentMode = .scaleToFill
                    presenter?.savePosterPictureToDisk(id: title.id, pngData: imageData)
                }
            })
        }
        
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
