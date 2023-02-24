//
//  DetailViewController.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /212/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol?
    
    override func loadView() {
        view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let title = presenter?.titleData else { return }
        (view as? DetailView)?.populateUI(title: title.attributes, presenter: presenter)
    }

}

extension DetailViewController: DetailViewProtocol {
    
    func set(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    
    
}
