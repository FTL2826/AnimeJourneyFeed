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
    private var persistentProvider: PersistentProviderProtocol!
    
    
    init(dataManager: DataManagerProtocol!, posterLoader: PosterLoaderProtocol!, feedLoader: FeedLoaderProtocol!, persistentProvider: PersistentProviderProtocol!) {
        self.dataManager = dataManager
        self.posterLoader = posterLoader
        self.feedLoader = feedLoader
        self.persistentProvider = persistentProvider
    }
    
}

extension FeedPresenter: FeedPresenterProtocol {
    func attach(view: FeedViewProtocol) {
        self.view = view
    }
    
    func getDataFromApi(for link: String) {
        feedLoader.fetchFeedData(for: link) {[weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.dataManager.apiAnswer = success
                    self?.refreshUI()
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
    
    func rowsInTable() -> Int {
        return dataManager.titlesData.count
    }
    
    func refreshUI() {
        view?.reloadData()
    }
    
    func getTitle(index: Int) -> TitleData {
        return dataManager.titlesData[index]
    }
    
    func getDataFromApiForNextPage() {
        let link = dataManager.apiAnswer.links.next
        getDataFromApi(for: link)
    }
    
    func dataBase() {
//        persistentProvider.updatePoster(tiny: dataManager.titlesData.first!.attributes.posterImage.tiny, medium: dataManager.titlesData.first!.attributes.posterImage.medium)
        
    }
    
}
