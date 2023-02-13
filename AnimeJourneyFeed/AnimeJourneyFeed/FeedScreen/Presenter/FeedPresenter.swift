//
//  TitleViewPresenter.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

class FeedPresenter {
    
    private weak var view: FeedViewProtocol?
    private var dataManager: DataManagerProtocol!
    
    init(dataManager: DataManagerProtocol!) {
        self.dataManager = dataManager
    }
    
}

extension FeedPresenter: FeedPresenterProtocol {
    func attach(view: FeedViewProtocol) {
        self.view = view
    }
    func buttonTapped() {
        view?.update(collection: dataManager.obtainTitles())
        print("DEBUG PRINT:", dataManager.parsedAnswer)
    }
}
