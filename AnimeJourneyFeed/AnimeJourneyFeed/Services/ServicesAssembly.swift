//
//  ServiceAssembly.swift
//  AnimeJourneyFeed
//
//  Created by Александр Харин on /162/23.
//

import Swinject

final class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        //inject service for picture loading to presenter
        container.register(PosterLoaderProtocol.self) { _ in
            PosterLoader()
        }
        
        //inject service for feed json loading to presenter
        container.register(FeedLoaderProtocol.self) { _ in
            FeedLoader()
        }
        
        //inject service for persisting provider
        container.register(PersistentProviderProtocol.self) { _ in
            PersistentProvider()
        }
        
        //inject dataModel to presenter
        container.register(DataManagerProtocol.self) { _ in
            DataManager()
        }
        
    }
}
