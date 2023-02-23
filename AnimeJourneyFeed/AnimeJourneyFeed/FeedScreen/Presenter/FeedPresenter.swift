//
//  TitleViewPresenter.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /102/23.
//

import Foundation

class FeedPresenter {
    
    private weak var view: FeedViewProtocol?
    private var navigator: FeedNavigator!
    private var dataManager: DataManagerProtocol!
    private var posterLoader: PosterLoaderProtocol!
    private var feedLoader: FeedLoaderProtocol!
    private var persistentProvider: PersistentProviderProtocol!
    
    
    init(dataManager: DataManagerProtocol!, posterLoader: PosterLoaderProtocol!, feedLoader: FeedLoaderProtocol!, persistentProvider: PersistentProviderProtocol!, navigator: FeedNavigator!) {
        self.dataManager = dataManager
        self.posterLoader = posterLoader
        self.feedLoader = feedLoader
        self.persistentProvider = persistentProvider
        self.navigator = navigator
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
                    self?.saveDataToDataBase()
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
    
    func saveDataToDataBase() {
        persistentProvider.updateLinks(linksData: dataManager.apiAnswer.links)
        persistentProvider.updateMeta(metaInfo: dataManager.apiAnswer.meta)
        persistentProvider.updateTitlesData(models: dataManager.apiAnswer.data)
    }
    
    func fetchFromDataBase() {
        let links = persistentProvider.fetchLinksModel()
        let meta = persistentProvider.fetchMetaModel()
        let titlesData =  persistentProvider.fetchTitlesDataModel()
        dataManager.apiAnswer = ApiResponse(
            data: persistentProvider.titlesDataCDModelToStruct(model: titlesData),
            meta: persistentProvider.metaCDModelToStruct(model: meta),
            links: persistentProvider.linksCDModelToStruct(model: links))
    }
    
    func firstBootOfApp() {
        let link = "https://kitsu.io/api/edge/anime?page[limit]=20&page[offset]=0"
        UserDefaults.standard.set(link, forKey: UserDefaultsKeys.apiLinkKey)
        getDataFromApi(for: link)
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.firstBoot)
        
        do {
            print("documents path:", documentDirectoryPath())
            try FileManager.default.createDirectory(atPath: documentDirectoryPath().path.appending("/PosterImages"), withIntermediateDirectories: false)
        } catch {
            print("DEBUG PRINT:", "FileManager error: \(error.localizedDescription)")
        }
        
        
    }
    
    private func documentDirectoryPath() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func savePosterPictureToDisk(id: String, pngData: Data) {
        let picName = "PosterImageForCell\(id).png"
        let path = documentDirectoryPath().path.appending("/PosterImages/\(picName)")
        DispatchQueue.global().async {
            do {
                try pngData.write(to: URL(fileURLWithPath: path), options: .atomic)
            } catch {
                print("Write poster image data to disk error:", error.localizedDescription)
            }
        }
        
    }
    
    func checkPictureInCache(id: String) -> (flag: Bool, path: String) {
        let picName = "PosterImageForCell\(id).png"
        let path = documentDirectoryPath().path.appending("/PosterImages/\(picName)")
        return (FileManager.default.fileExists(atPath: path), path)
    }
    
    func getDocumentsDirectoryOnTap() {
        print("documents path:", documentDirectoryPath())
    }
    
    func showDetailScreen(title: TitleData) {
        navigator.navigate(to: .showDetailScreen(title: title))
    }
    
    
}
