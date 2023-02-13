//
//  FeedView.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import UIKit

protocol FeedViewDelegate: AnyObject {
    func actionOnButton()
}

class FeedView: UIView {

    private weak var delegate: FeedViewDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.text = "text_TEXT"
        label.textColor = .label
        return label
    }()
    lazy var updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("push me", for: .normal)
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
        return button
    }()
    
    init(delegate: FeedViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupUI()
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnButton() {
        delegate?.actionOnButton()
    }
    
    func update(collection: [Title]) {
        let title = collection.randomElement()!
        titleLabel.text = "\(title.name) \(title.rating)%"
    }
    
    private func setupUI() {
        backgroundColor = .cyan
        
        addSubview(titleLabel)
        addSubview(updateButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            
            updateButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            updateButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50),
        ])
    }
    

}
