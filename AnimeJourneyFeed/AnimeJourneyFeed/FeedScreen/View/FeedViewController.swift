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
        title = "Feed"
        reloadData()
    }
    
}

extension FeedViewController: FeedViewProtocol {
    func set(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
    }
    func reloadData() {
        (view as? FeedView)?.tableView.reloadData()
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
        if let title = title {
            cell.configure(for: title, with: presenter)
        } else {
            cell.titleLabel.text = "No data for this title, please load it again"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

