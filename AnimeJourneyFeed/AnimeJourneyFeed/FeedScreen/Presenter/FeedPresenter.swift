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
    private var feedLoader: FeedLoaderProtocol!
    var apiAnswer: ApiResponse? {
        didSet {
            view?.reloadData()
        }
    }
    
    init(dataManager: DataManagerProtocol!, posterLoader: PosterLoaderProtocol!, feedLoader: FeedLoaderProtocol!) {
        self.dataManager = dataManager
        self.posterLoader = posterLoader
        self.feedLoader = feedLoader
    }
    
}

extension FeedPresenter: FeedPresenterProtocol {
    func attach(view: FeedViewProtocol) {
        self.view = view
    }
    
    func getDataFromFile() {
        let request = URLRequest(url: URL(string: "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0")!)
        feedLoader.fetchFeedData(request) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.apiAnswer = success
                }
            case .failure(let failure):
                print("DEBUG PRINT:", "failed to fetch data /n failure: \(failure)")
            }
        }
    }
    
    func loadPoster(link: String, completion: @escaping (Data?) -> ()) -> Cancellable {
        let url = URL(string: link)!
        return posterLoader.loadImageData(for: url) { data in
            completion(data)
        }
    }
    
}
