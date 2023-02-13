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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension FeedViewController: FeedViewProtocol {
    func set(presenter: FeedPresenterProtocol) {
        self.presenter = presenter
    }
    
    func update(collection: [Title]) {
        (view as? FeedView)?.update(collection: collection)
    }
}

extension FeedViewController: FeedViewDelegate {
    func actionOnButton() {
        presenter?.buttonTapped()
    }
}

