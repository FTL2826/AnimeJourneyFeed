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
    private var posterLoader: PosterLoaderProtocol!
    var apiAnswer: ApiAnswer?
    
    init(dataManager: DataManagerProtocol!, posterLoader: PosterLoaderProtocol!) {
        self.dataManager = dataManager
        self.posterLoader = posterLoader
    }
    
}

extension FeedPresenter: FeedPresenterProtocol {
    func attach(view: FeedViewProtocol) {
        self.view = view
    }
    
    func getDataFromFile() {
        apiAnswer = dataManager.parsedAnswer
        print("DEBUG PRINT:", apiAnswer)
    }
    
    func loadPoster() -> Data {
        print("DEBUG PRINT:", "...loading...")
        return Data()
//        return posterLoader.loa()
    }
}
