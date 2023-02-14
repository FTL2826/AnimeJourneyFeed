//
//  FeedViewController.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import UIKit

class FeedViewController: UIViewController{
    
    private var presenter: FeedPresenterProtocol?
    
    override func loadView() {
        view = FeedView(delegate: self)
        (view as? FeedView)?.tableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDataFromFile()
        (view as? FeedView)?.tableView.reloadData()
    }
    
}

extension FeedViewController: FeedViewProtocol {
    func set(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
    }
}

extension FeedViewController: FeedViewDelegate {
    func actionOnButton() {
        
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.apiAnswer?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableCell.identifier, for: indexPath) as? FeedTableCell else {
            fatalError("Could not dequeue feed table cell")
        }
        let title = presenter?.apiAnswer?.data[indexPath.row]
        cell.titleLabel.text = title?.attributes.titles.romaji
        return cell
    }
    
}

