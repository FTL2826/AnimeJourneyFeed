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
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FeedTableCell.self, forCellReuseIdentifier: FeedTableCell.identifier)
        table.rowHeight = 102
        return table
    }()
    
    init(delegate: FeedViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapOnButton() {
        delegate?.actionOnButton()
    }
    
    private func setupUI() {
        self.backgroundColor = .systemBackground
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    

}
