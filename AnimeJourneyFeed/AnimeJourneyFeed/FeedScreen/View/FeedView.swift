//
//  FeedView.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import UIKit

protocol FeedViewOutput: AnyObject {
    func actionOnButton()
}

class FeedView: UIView {

    weak var delegate: FeedViewOutput?
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnButton() {
        delegate?.actionOnButton()
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
