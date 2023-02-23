//
//  DetailViewController.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /212/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = presenter?.getTitle()
        view.backgroundColor = .cyan
    }
    

}

extension DetailViewController: DetailViewProtocol {
    
    func set(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    
    
}
