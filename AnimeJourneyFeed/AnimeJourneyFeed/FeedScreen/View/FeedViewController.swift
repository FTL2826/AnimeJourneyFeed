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
        let link = "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0"
        presenter?.getDataFromApi(for: link)
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
        return presenter?.titlesData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableCell.identifier, for: indexPath) as? FeedTableCell else {
            fatalError("Could not dequeue feed table cell")
        }
        let title = presenter?.titlesData[indexPath.row]
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row + 1) == tableView.numberOfRows(inSection: 0) {
            if let link = presenter?.apiAnswer.links.next {
                print("DEBUG PRINT:", "load data from api ...")
                presenter?.getDataFromApi(for: link)
            }
        }
    }
    
    
}

