//
//  DetailPresenter.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /212/23.
//

import Foundation

class DetailPresenter {
    
    private weak var view: DetailViewProtocol?
    private var posterLoader: PosterLoaderProtocol!
    private var dataManager: DataManagerProtocol!
    var titleData: TitleData?
    
    init(posterLoader: PosterLoaderProtocol!, dataManager: DataManagerProtocol!) {
        self.posterLoader = posterLoader
        self.dataManager = dataManager
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func attach(view: DetailViewProtocol) {
        self.view = view
    }
    
    func setData(title: TitleData) {
        self.titleData = title
    }
    
    func getTitle() -> String {
        return titleData?.attributes.canonicalTitle ?? "Unknown title"
    }
    
    func loadPoster(link: String, completion: @escaping (Data?) -> ()) -> Cancellable {
        let url = URL(string: link)!
        return posterLoader.loadImageData(for: url) { data in
            completion(data)
        }
    }
    
    func savePosterPictureToDisk(id: String, pngData: Data) {
        dataManager.savePosterPictureToDisk(id: id, pngData: pngData, posterSize: .medium)
    }
    
    func checkPictureInCache(id: String) -> (flag: Bool, path: String) {
        return dataManager.checkPictureInCache(id: id, posterSize: .medium)
    }
    
}
