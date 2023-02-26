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
        title = "Feed"
        
        let docDirBtn = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: #selector(getDocDir))
        navigationItem.leftBarButtonItem = docDirBtn
        
        setupData()
    }
    
    @objc private func getDocDir() {
        let path = presenter?.getDocDirString()
        print("Documents directory path:", path ?? "")
        let ac = UIAlertController(title: "Path", message: "Documents directory path: \(path ?? "")", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    private func setupData() {
        if !UserDefaults().bool(forKey: UserDefaultsKeys.firstBoot) {
            presenter?.firstBootOfApp()
        } else {
            presenter?.fetchFromDataBase()
        }
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
        return presenter?.rowsInTable() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableCell.identifier, for: indexPath) as? FeedTableCell else {
            fatalError("Could not dequeue feed table cell")
        }
        let title = presenter?.getTitle(index: indexPath.row)
        if let title = title {
            cell.configure(for: title, with: presenter)
        } else {
            cell.titleLabel.text = "No data for this title, please load it again"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let title = presenter?.getTitle(index: indexPath.row) else { return }
        presenter?.showDetailScreen(title: title)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row + 5) == tableView.numberOfRows(inSection: 0) {
            presenter?.getDataFromApiForNextPage()
        }
    }
    
    
}

