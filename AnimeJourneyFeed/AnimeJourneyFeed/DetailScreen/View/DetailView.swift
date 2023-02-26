//
//  DetailView.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /232/23.
//

import UIKit

enum TextConstants {
    static let title = "VERY LOng title for this type of screen, it's really must have feature because anime titles have totemo nagai namae :)"
    static let createdAt = "Created at: "
    static let updatedAt = "Updated at: "
    static let status = "Status: "
    static let averageRating = "Average rating: "
    static let ageRatingGuide = "Age rating guide: "
    static let startDate = "Start airing at: "
    static let endDate = "Finished airing at: "
    static let episodes = "Episodes: "
    static let episodeLenght = "Episode lenght: "
    static let synopsis = "Synopsis: "
}

class DetailView: UIView {
    
    private var dataTask: Cancellable? = nil
    
    private lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    private lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.title
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        l.sizeToFit()
        l.textColor = .label
        return l
    }()
    private lazy var posterImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 300).isActive = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    private lazy var createdAtLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.createdAt
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        l.textColor = .label
        return l
    }()
    private lazy var createdAtLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.createdAt
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        l.textColor = .label
        return l
    }()
    private lazy var updatedAtLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.updatedAt
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        l.textColor = .label
        return l
    }()
    private lazy var updatedAtLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.updatedAt
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        l.textColor = .label
        return l
    }()
    private lazy var statusLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.status
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var statusLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.status
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var averageRatingLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.averageRating
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var averageRatingLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.averageRating
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var ageRatingLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.ageRatingGuide
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var ageRatingLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.ageRatingGuide
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var startDateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.startDate
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var endDateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.endDate
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var startDateLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.startDate
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var endDateLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.endDate
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var episodesLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.episodes
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var episodesLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.episodes
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var episodeLenghtLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.episodeLenght
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var episodeLenghtLabelValue: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.episodeLenght
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        l.textColor = .label
        return l
    }()
    private lazy var synopsysLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = TextConstants.synopsis
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        l.textColor = .label
        return l
    }()
    
    //MARK: - Stacks
    private lazy var timeLabelsVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(createdAtLabel)
        stack.addArrangedSubview(updatedAtLabel)
        return stack
    }()
    private lazy var timeLabelsValuesVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.addArrangedSubview(createdAtLabelValue)
        stack.addArrangedSubview(updatedAtLabelValue)
        return stack
    }()
    private lazy var timeLabelsGrid: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.addArrangedSubview(timeLabelsVStack)
        stack.addArrangedSubview(timeLabelsValuesVStack)
        return stack
    }()
    
    private lazy var posterImageHStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.addArrangedSubview(posterImage)
        return stack
    }()
    
    private lazy var labelsVStrack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.addArrangedSubview(averageRatingLabel)
        stack.addArrangedSubview(ageRatingLabel)
        stack.addArrangedSubview(statusLabel)
        stack.addArrangedSubview(startDateLabel)
        stack.addArrangedSubview(endDateLabel)
        stack.addArrangedSubview(episodesLabel)
        stack.addArrangedSubview(episodeLenghtLabel)
        return stack
    }()
    private lazy var labelsValueVStrack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.contentMode = .scaleAspectFit
        stack.addArrangedSubview(averageRatingLabelValue)
        stack.addArrangedSubview(ageRatingLabelValue)
        stack.addArrangedSubview(statusLabelValue)
        stack.addArrangedSubview(startDateLabelValue)
        stack.addArrangedSubview(endDateLabelValue)
        stack.addArrangedSubview(episodesLabelValue)
        stack.addArrangedSubview(episodeLenghtLabelValue)
        return stack
    }()
    private lazy var labelsGridStrack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.addArrangedSubview(labelsVStrack)
        stack.addArrangedSubview(labelsValueVStrack)
        return stack
    }()
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(timeLabelsGrid)
        stack.addArrangedSubview(posterImageHStack)
        stack.addArrangedSubview(labelsGridStrack)
        stack.addArrangedSubview(synopsysLabel)
        return stack
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        dataTask?.cancel()
    }
    
    func populateUI(title: TitleAttributes, presenter: DetailPresenterProtocol?, titleId: String) {
        titleLabel.text = title.canonicalTitle
        createdAtLabelValue.text = title.createdAt
        updatedAtLabelValue.text = title.updatedAt
        statusLabelValue.text = title.status
        averageRatingLabelValue.text = title.averageRating
        ageRatingLabelValue.text = title.ageRatingGuide
        startDateLabelValue.text = title.startDate ?? "Not started yet"
        endDateLabelValue.text = title.endDate ?? "Not finished yet"
        if let count = title.episodeCount, count != 0 {
            episodesLabelValue.text = String(count)
        } else {
            episodesLabelValue.text = "?"
        }
        if let lenght = title.episodeLength, lenght != 0 {
            episodeLenghtLabelValue.text = String(lenght) + " min"
        } else {
            episodeLenghtLabelValue.text = "? min"
        }
        synopsysLabel.text = TextConstants.synopsis + title.synopsis
        
        let checkCache = presenter?.checkPictureInCache(id: titleId)
        
        switch checkCache?.flag {
        case.some(let flag):
            if flag {
                print("DEBUG PRINT:", "pic for cell \(titleId) is exist")
                posterImage.image = UIImage(contentsOfFile: checkCache!.path)
                posterImage.contentMode = .scaleToFill
            } else {
                fallthrough
            }
        case .none:
            if let link = title.posterImage.medium {
                dataTask = presenter?.loadPoster(link: link, completion: {[weak self] imageData in
                    if let imageData = imageData {
                        self?.posterImage.image = UIImage(data: imageData)
                        self?.posterImage.contentMode = .scaleToFill
                        presenter?.savePosterPictureToDisk(id: titleId, pngData: imageData)
                    }
                })
            }
        }
        
    }
    
    //MARK: - setupUI
    private func setupUI() {
        
        addSubview(scroll)
        scroll.addSubview(mainVStack)
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            mainVStack.topAnchor.constraint(equalTo: scroll.topAnchor),
            mainVStack.centerXAnchor.constraint(equalTo: scroll.centerXAnchor),
            mainVStack.widthAnchor.constraint(equalTo: scroll.widthAnchor, multiplier: 0.95),
            mainVStack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
        ])
    }
    
    
}
